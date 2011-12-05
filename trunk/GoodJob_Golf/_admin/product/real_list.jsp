<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="com.goodjob.reserve.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	RegionDao regionDao = new RegionDao();
	List<RegionDto> arrRegions = regionDao.getRegionList("1");
	String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
	String mainTitle = "";
	String pageName = "";

	if(menuSeq.startsWith("1")){
		mainTitle = "★ 실시간 골프장목록 ★";
		pageName = "실시간";
	}else{
		mainTitle = "★ 사전 골프장목록 ★";
		pageName = "사전";
	}
	
	GolfLinkDao dld = new GolfLinkDao();
	List<GolfLinkDto> arrGolfLink = dld.getGolfLinkList(Integer.parseInt(menuSeq));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title></title>
<script language="JavaScript"> 
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title><%= mainTitle%></td>
    <td align="right" style="padding-right:30px;"><select name="formselect1" size="1">
        <option>전체지역보기</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
%>
        <option><%=arrRegions.get(i).getRegion_name() %></option>
<%
		}
	}
%>
      </select> <img align="absmiddle" src="../images/inc/btn_search2.gif" width="45" height="22" border="0"></td>
  </tr>
  <tr>
    <td align="center" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
	<tr>
	    <td bgcolor="#e6e7e8" align="center" height="25" width="176"><span class=list_title>지역</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="236"><span class=list_title>골프장명</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="293"><span class=list_title>주소</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="159"><span class=list_title>운영방식</span></td>
	    <td width="249" align="center" bgcolor="#E6E7E8"><span class=list_title>코스입력</span></td>
	    <td width="233" align="center" bgcolor="#E6E7E8"><span class=list_title>시간 및 가격입력</span></td>
	    <td align="center" bgcolor="#E6E7E8" width="248"><span class=list_title>위약처리규정입력 및 수정</span></td>
	    <td align="center" bgcolor="#E6E7E8" width="216"><span class=list_title>골프장 정보</span></td>
	</tr>
	<% 
	if(arrGolfLink.size() > 0){
		for(int i = 0; i < arrGolfLink.size();i++){
	%>
	
	<tr>
	    <td bgcolor="white" align="center" bgcolor="white"><%= arrGolfLink.get(i).getRegion_name()%></td>
		<td align="center" bgcolor="white"><span class=list_subject><%= arrGolfLink.get(i).getGolflink_name()%></span></td>
		<td align="center" bgcolor="white"><%= arrGolfLink.get(i).getGolflink_address1()%></td>
		<td align="center" bgcolor="white"><%= pageName %></td>
        <td align="center" bgcolor="white">
        	<table border="0" cellpadding="0" cellspacing="0" width="90%">
            <tr>
            	<td width="50%" align="center"><a href="/_admin/product/popup/pop_course.jsp?glseq=<%=arrGolfLink.get(i).getGolflink_seq()%>" onClick="NewWindow(this.href,'name','415','400','yes');return false;"><img src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a></td>
                <td width="50%" align="center">코스없음<input type="checkbox" name="formcheckbox1"></td>
            </tr>
            </table>
        </td>
        <td align="center" bgcolor="white"><a href="real_time_input.html" onClick="NewWindow(this.href,'name','820','520','yes');return false;"><img src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a></td>
        <td align="center" bgcolor="white"><a href="real_rule_reg.jsp?glseq=<%=arrGolfLink.get(i).getGolflink_seq()%>"><img src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a></td>
        <td align="center" bgcolor="white"><a href="#"><img src="../images/inc/btn_edit2.gif" width="74" height="26" border="0"></a></td>
    </tr>
    <%
		}
   	}
    %>
    </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="100"><a href="real_reg.jsp?menu=<%=menuSeq%>"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
</body>
</html>
