<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="m">
<head>

<title>�޽���</title>
<link rel="stylesheet" type="text/css" href="meeting.css"/>
</head>
<body> 
    <div class="container">
        <div id="list">
            <div class="subject">�޽��� ���</div>
            <div id="search">
                <input type="text" id="s_text" placeholder="�޽��� �˻�"/>
                <input type="button" id="s_button" value="�˻�"/>
            </div>
                <div class="listAll">
                <div class="mlist">
                    <div class="up">
                        <div class="m_name">
                            ȫ�浿
                        </div> 
                        <div class="o"></div>
                        <div class="m_lastday">
                            2019-01-16
                        </div>
                    </div>
                    <div class="m_info">
                        �ȳ�
                    </div>
                </div>

                <div class="mlist">
                    <div class="up">
                        <div class="m_name">
                            �̸�2
                        </div> 
                        <div class="m_lastday">
                            ������ ä�� ��¥2
                            </div>
                        </div>
                        <div class="m_info">
                            ������ ä�� ����2
                        </div>
                </div>
            </div>
        </div>

        <div id="info">
            <div id="chat">
                ��ȭâ
            </div>
            <div id="chat_in">
                <input type="text" id="chat_text" placeholder="�޽����� �Է��ϼ���."/>
            </div>
        </div>

        <div id="nav">
            <div id="myinfo">
                <div id="my_img">
                    ����
                </div>
                <div id="my_name">
                    ���̸�
                </div>
            </div>

	        <div id="css_tabs">
			    <input id="tab1" type="radio" name="tab" checked="checked" />
			    <input id="tab2" type="radio" name="tab" />
			    <label for="tab1">Tab 1</label>
			    <label for="tab2">Tab 2</label>
			    <div class="tab1_content">follower</div>
			    <div class="tab2_content">following</div>
			   
			</div>
        </div>

    </div>
</body>
</html>
