<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>�̷¼� �󼼺���</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
<div class="container">
    <header>
        <div class="comment">comment</div>
    </header>
    <div class="img">
        <img src="../key2.png"/>
        <div class="impormation">
            <label>���� ���� </label>
            <label> ������ </label>
            <button>��Ʈ������</button>
        </div>
    </div>
    <section class="content">
			<main>
                <div class="left">
                    <div class="detail">
                        <label class="subject">������</label>
                        <ul>
                            <li>* �̸�</li>
                            <li>* ����</li>
                            <li>~~</li>
                        </ul>
                    </div>

                    <div class="project">
                        <label class="subject">������Ʈ</label>
                        <button>+</button>
                        ������Ʈ�̸�, ����,~~
                    </div>
                </div>

                <div class="right">
                    <div class="certificate">
                        <label class="subject">�ڰ� ����</label>
                            <ul>
                                <li>��泯¥ | �ڰ��� �̸�</li> 
                                <li>��泯¥ | �ڰ��� �̸�</li> 
                            </ul>  
                    </div>

                    <div class="edu">
                        <label class="subject">�з� ����</label>
                            <ul>
                                <li>�ش�⵵ | �з�����</li> 
                                <li>�ش�⵵ | �з�����</li> 
                            </ul>  
                    </div>

                    <div class="career">
                        <label class="subject">���/���� ����</label>
                            <ul>
                                <li>�ش�⵵ | �������</li> 
                                <li>�ش�⵵ | �������</li> 
                            </ul>  
                    </div>                
                </div>
            </main>
            
            <div class="tech-stack">
                <label class="subject">Tech-stack</label>
                 ��� �����
                �ۼ�Ʈ��
            </div>
            
    </section>

    </div>
    <footer>
        footer ����
    </footer>
</body>
</html>