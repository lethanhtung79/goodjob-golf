﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@page import="com.goodjob.board.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	FileUpload fileUpload = new FileUpload(request, "/home/hosting_users/savekorea2400/www/tmp/", 1024*1024*5);

	Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();

	String idx = (String)paramMap.get("idx");
	String email = (String)paramMap.get("email");
	String subject = (String)paramMap.get("subject");
	String content = (String)paramMap.get("content");
	String password = (String)paramMap.get("password");
	
	String upfile = (String)fileMap.get("upfile");
	
	BoardDto dto = new BoardDto();
	dto.setEmail(email);
	dto.setName("");
	dto.setMem_id("");
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPassword(password);
	dto.setFilename(upfile);
	dto.setWriteip(request.getRemoteAddr());
	dto.setIshtml("N");
	
	BoardDao dao = new BoardDao();
	dao.setInsert("notice_bbs" , dto);
	
%>