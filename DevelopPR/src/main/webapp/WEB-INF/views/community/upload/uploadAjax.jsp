<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/tag_header.jsp" %>
<style>
    .fileDrop {
        width:600px;
        height: 200px;
        border: 1px dotted blue;
    }

    small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
    }
</style>
<script>
    $(document).ready(function(){
        $(".fileDrop").on("dragenter dragover", function(event){
            event.preventDefault(); // 기본효과를 막음
        });
        // event : jQuery의 이벤트
        // originalEvent : javascript의 이벤트
        $(".fileDrop").on("drop", function(event){
            event.preventDefault(); // 기본효과를 막음
            // 드래그된 파일의 정보
            var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
            var file = files[0];
            // 콘솔에서 파일정보 확인
            /* console.log(file); */

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", file);


            $.ajax({
                type: "post",
                url: "${path}/upload/uploadAjax",
                data: formData,
                // processData: true=> get방식, false => post방식
                dataType: "text",
                // contentType: true => application/x-www-form-urlencoded, 
                //                false => multipart/form-data
                processData: false,
                contentType: false,
                success: function(data){
                	var str = "";
                    // 이미지 파일이면 썸네일 이미지 출력
                    if(checkImageType(data)){ 
                        str = "<div><a href='${path}/upload/displayFile?fileName="+getImageLink(data)+"'>";
                        str += "<img src='${path}/upload/displayFile?fileName="+data+"'></a>";
                    // 일반파일이면 다운로드링크
                    } else { 
                        str = "<div><a href='${path}/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
                    }
                    // 삭제 버튼
                    str += "<span data-src="+data+">[삭제]</span></div>";
                    $(".uploadedList").append(str);
                
                
                
                }
            });
        });
        $(".uploadedList").on("click", "span", function(event){
            alert("이미지 삭제")
            var that = $(this); // 여기서 this는 클릭한 span태그
            $.ajax({
                url: "${path}/upload/deleteFile",
                type: "post",
                // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
                // 태그.attr("속성")
                data: {fileName:$(this).attr("data-src")}, // json방식
                dataType: "text",
                success: function(result){
                    if( result == "deleted" ){
                        // 클릭한 span태그가 속한 div를 제거
                        that.parent("div").remove();
                    }
                }
            });
        });
    
    
    
    
    
    });
</script>
</head>
<body>

    <h2>AJAX File Upload</h2>
    <!-- 파일을 업로드할 영역 -->
    <div class="fileDrop"></div>
    <!-- 업로드된 파일 목록 -->
    <div class="uploadedList"></div>
</body>
</html>