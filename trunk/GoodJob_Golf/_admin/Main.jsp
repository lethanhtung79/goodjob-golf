<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>������� ���� ������</title>
</head>

<frameset cols="200, 1*" border="0">
	<frame src="left_menu.jsp" name="left_menu" scrolling="no" marginwidth="0" marginheight="0" namo_target_frame="main">
	<frameset rows="30, 92%, 25">
		<frame src="top.html" scrolling="no" marginwidth="0" marginheight="0">
		<frame src="product/real_list.jsp?menu=1" name="main" scrolling="yes" marginwidth="10" marginheight="10" namo_target_frame="main">
		<frame src="bottom.html" scrolling="no" marginwidth="0" marginheight="0" name="bottom">
	</frameset>
	<noframes>
	<body bgcolor="white">
	<p>�� �������� ������, �������� �� �� �ִ� �������� �ʿ��մϴ�.</p>
	</body>
	</noframes>
</frameset>
</html>