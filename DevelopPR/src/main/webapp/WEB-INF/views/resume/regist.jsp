<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="resumeRegist">
<head>
<title>�̷¼� ���</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
    <div class="container">
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">�̷¼� ���</div>
               <div class="c">"~~~~~~~~~~~~~~~~~~"</div>
            </div>
            <div id="img">
                + 
            </div>
        </header>
        <div id="pill">* �� �ʼ� �Է� �����Դϴ�.</div>
    
        <main>
            <div class="detail">
                    <div class="subject">
                        �� ����
                    </div>
                    <div class="content">
                        <div class="state">             
                            <div class="name">
                                ���� ���� ���� *
                            </div> 
                            <div class="s_info">
                                <div class="button"> </div>������
                                <div class="button"> </div>������
                            </div>
                        </div>
                        
                        
                        <div id="p_name">
                            <div class="name" >
                            �� �� *
                            </div>
                            <div class="p_info">
                                <input type="text" id="pr_name" placeholder="�̸��� �Է����ּ���.(2~20��)"/>
                            </div>
                        </div>

                        <div id="birth">
                            <div class="name">
                            �� �� * 
                            </div>
                            <div class="birth_info">
                                <select name="year" id="year">
                                    for������ �⵵~~
                                    <option>----��</option>
                                </select>
                                <select name="month" id="month">
                                    <option>--��</option>
                                </select>
                                <select name="day" id="day">
                                    <option>--��</option>
                                </select>
                            </div>
                        </div>

                        <div id="phone">
                            <div class="name">
                                �ڵ�����ȣ *
                            </div>
                            <div class="phone_info">
                                <input type="text" placeholder="010123456578 ���·� �����ּ���." class="textshort"/>
                                <input type="radio" class="phone_radio" value="phoneopen"/>����
                                <input type="radio" class="phone_radio" value="phoneclose"/>�����
                            </div>
                        </div>

                        <div id="email">
                            <div class="name">
                                �̸��� * 
                            </div>
                            <div class="email_info">
                                <input type="text" placeholder="9~50�� ����" class="textshort"/>
                                <input type="radio" value="emailopen"/>����
                                <input type="radio" value="emailclose"/>�����
                            </div>
                        </div>

                        <div id="blog">
                            <div class="name" id="blog">
                            ��α�
                            </div>
                            <div class="info">
                                <input type="text" placeholder="����ǥ���� �߰�" class="textlong"/>
                            </div>
                        </div>

                        <div id="address">
                            <div class="name">
                            �ּ� *
                            </div>
                            <div class="info">
                                    <input type="text" placeholder="����ǥ���� �߰�" class="textshort"/>
                                <input type="radio" value="addressopen"/>����
                                <input type="radio" value="addressclose"/>�����
                            </div>
                        </div>

                        <div id="hopeaddress">
                            <div class="name">
                            ��� �ٹ���
                            </div>
                            <div class="info">
                                <input type="text" class="textlong"/>
                            </div>
                        </div>

                        <div id="comment">
                            <div class="name">
                            �Ұ�/ �¿��/ Comment
                            </div>
                            <div class="info">
                                <input type="text" class="textlong"/>
                            </div>
                        </div>
                    </div>

            </div>
            
            <div class="information">

                    <div class="acq">
                        <div class="subject">�ڰ�����</div>
                        <div class="acq_ok">
                            <input type="text" class="textmiddle1" placeholder="�ڰ��� ��� ��¥"/>|
                            <input type="text" class="textmiddle2" placeholder="�ڰ��� �̸�"/>
                            <button>+</button>
                        </div>
                    </div>
                

                    <div class="edu">
                        <div class="subject">�з�/���� ����</div>
                        <div class="edu_ok">
                                <input type="text" class="textmiddle1" placeholder="�з�/���� �⵵"/>|
                                <input type="text" class="textmiddle2" placeholder="�з� / ���� �̸�"/>
                                <button>+</button>
                        </div>
                    
                    
                    </div>
                

                    <div class="career">
                        <div class="subject">��� ����</div>
                        <div class="career_ok">
                                <input type="text" class="textmiddle1" placeholder="�з�/���� �⵵"/>|
                                <input type="text" class="textmiddle2" placeholder="�з� / ���� �̸�"/>
                                <button>+</button>
                        </div>
                    </div>
            

            </div>
            
            <div class="skill">
                            <div class="subject">Tech-stack</div>
                            <div class="tech">
                                <div class="abb">
                                    <input type="text" id="abb"/>
                                </div>
                                <div class="techinfo">
                                    ����<br/>
                                    <input type="text" id="techname" placeholder="��� ��"><br/>
                                  
                                   <div class="range" data-value="50">
										<div class="label">
											<div class="value">50</div>
											<div class="drop"></div>		
										</div>
										<div class="input-box">
											<input id="input-range" type="range" min="0" max="100" value="0"/>
											<div class="bar"></div>
										</div>
									</div>
									
									</div>
                            </div>
            </div>
        </main>
        
        <footer>
            aa
        </footer>
    
</div>
</body>
</html>