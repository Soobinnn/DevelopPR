package com.DevelopPR.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownload {
     
     /**
     * 파일(첨부파일, 이미지등) 다운로드.(업체견적서)
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "fileDownload.do")
    public void PrDownload(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
       /* String path =  request.getSession().getServletContext().getRealPath("저장경로"); */
    	String path =  request.getSession().getServletContext().getRealPath("/opt/apache-tomcat-9.0.14/webapps/DevelopPR/resources/project_upload/");
        
        String filename = request.getParameter("fileName");
        String downname = request.getParameter("downName");
        String realPath = "";
       
        if (filename == null || "".equals(filename)) {
            filename = downname;
        }
         
        try {
            String browser = request.getHeader("User-Agent"); 
            //파일 인코딩 
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
                        "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        realPath = path +"/" +downname.substring(0,4) + "/"+downname;
        File file1 = new File(realPath);
        if (!file1.exists()) {
            return ;
        }
         
        // 파일명 지정        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realPath);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        } catch (IOException ex) {
            System.out.println("IOException");
        }
    }
}