<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.sql.ORDER"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.order.GolfLinkDao"%>
<%@page import="com.goodjob.order.dto.GolfLinkDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String sField = StringUtils.defaultIfEmpty(request.getParameter("field2"),"");
String sValue = StringUtils.defaultIfEmpty(request.getParameter("keyword2"),"");

GolfLinkDto glDto = new GolfLinkDto();
if("reserve_day".equals(sField)){
	glDto.setReserve_day(sValue);
}
if("reserve_name".equals(sField)){
	glDto.setReserve_name(sValue);
}
if("golflink_name".equals(sField)){
	glDto.setGolflink_name(sValue);
}
if("booking_day".equals(sField)){
	glDto.setBooking_day(sValue);
}

GolfLinkDao glList = new GolfLinkDao();
List<GolfLinkDto> list = glList.getTotalReserveSearch(glDto);
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<title></title>
<script language="javascript">
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 

function on_search() {
	var frm = document.frm;
	if(!$('#keyword2').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword2').focus();
		return;
	} 
	frm.action="total_search.jsp"
	frm.submit();
}

function selItem(menuReserve){
	var frm = document.frmLink;
	var strValue = menuReserve.split("/");
	var field = "reserve_seq";
	var value = "";
	if(strValue[0] == "1"){
		frm.action = "real_list.jsp";
	}
	if(strValue[0] == "2"){
		frm.action = "pre_list.jsp";
	}
	if(strValue[0] == "3"){
		frm.action = "package_list.jsp";
	}
	if(strValue[0] == "4"){
		frm.action = "package_foreign_list.jsp";
	}
	if(strValue[0] == "5"){
		document.frmLink.action = "condo_list.jsp";
	}
	$("#field").val(field);
	$("#keyword").val(strValue[1]);

	frm.submit();
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD class=title align=center>★ 통합검색 ★</TD></TR>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TD align=center>
<form name="frmLink" method="post" action="total_search.jsp">
<input type="hidden" id="field" name="field">
<input type="hidden" id="keyword" name="keyword">
</form>
<form name="frm" method="post" action="total_search.jsp">
<select id="field2" name="field2" size="1">
  <option>선택하세요</option>
  <option value="reserve_day" <%=("reserve_day".equals(sField)?" selected":"")%>>예약일</option>
  <option value="reserve_name" <%=("reserve_name".equals(sField)?" selected":"")%>>예약자</option>
  <option value="golflink_name" <%=("golflink_name".equals(sField)?" selected":"")%>>골프장명(패키지명)</option>
  <option value="booking_day" <%=("booking_day".equals(sField)?" selected":"")%>>부킹일(출발일)</option>
</select>
<input id="keyword2" name="keyword2" value="<%=sValue%>" type="text" size="15" class="input_box">
<input id="searchOk" name="searchOk" type="image" src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle" onclick="on_search();">
</form>
</TD>
</TR>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TD align=center>
	<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=silver>
	<TBODY>
	<TR>
	<TD bgColor=#e6e7e8 height=25 width=132 align=center><SPAN class=normal_b>예약종류</SPAN></TD>
	<TD bgColor=#e6e7e8 width=200 align=center><SPAN class=normal_b>예약신청일</SPAN></TD>
	<TD bgColor=#e6e7e8 width=169 align=center><SPAN class=normal_b>예약자</SPAN></TD>
	<TD bgColor=#e6e7e8 width=255 align=center><SPAN class=normal_b>아이디</SPAN></TD>
	<TD bgColor=#e6e7e8 width=194 align=center><SPAN class=normal_b>연락처</SPAN></TD>
	<TD bgColor=#e6e7e8 width=206 align=center><SPAN class=normal_b>골프장 or 패키지명</SPAN></TD>
	<TD bgColor=#e6e7e8 width=206 align=center><SPAN class=normal_b>부킹일 or 투어예정일</SPAN></TD>
	<TD bgColor=#e6e7e8 width=100 align=center><SPAN class=normal_b>처리상태</SPAN></TD>
	</TR>
<%
if(list != null){
	for(int i = 0; i < list.size();i++){ 
		String menuName = "";
		if(list.get(i).getMenu_seq() == 1){
			menuName = "실시간";
		}
		if(list.get(i).getMenu_seq() == 2){
			menuName = "사전";
		}
		if(list.get(i).getMenu_seq() == 3){
			menuName = "국내패키지";
		}
		if(list.get(i).getMenu_seq() == 4){
			menuName = "해외패키지";
		}
		if(list.get(i).getMenu_seq() == 5){
			menuName = "콘도";
		}
		String reserveDay = list.get(i).getReserve_day();
		String bookingDay = list.get(i).getBooking_day();
		if(bookingDay.length() == 8){
			bookingDay = bookingDay.substring(0,4)
				+ "-" + bookingDay.substring(4,6)
				+ "-" + bookingDay.substring(6,8);
		}
		String processStatus = list.get(i).getProcess_status();
		if(processStatus.equals("0")){
			processStatus = "예약대기";
		}
		if(processStatus.equals("1")){
			processStatus = "예약완료";
		}
		if(processStatus.equals("2")){
			processStatus = "취소불가";
		}
		if(processStatus.equals("3")){
			processStatus = "예약취소";
		}
%>
	<TR style="cursor:pointer" onclick="selItem('<%=list.get(i).getMenu_seq() + "/" + list.get(i).getReserve_seq() %>')">
	<TD bgColor=white height=25 align=center><%=menuName %></TD>
	<TD bgColor=white align=center><%=reserveDay %></TD>
	<TD bgColor=white align=center><%=list.get(i).getReserve_name() %></TD>
	<TD bgColor=white align=center><%=list.get(i).getReserve_uid() %></TD>
	<TD bgColor=white align=center><%=list.get(i).getReserve_phone() %></TD>
	<TD bgColor=white align=center><%=list.get(i).getGolflink_name() %></TD>
	<TD bgColor=white align=center><%=bookingDay %></TD>
	<TD bgColor=white align=center><%=processStatus %></TD>
	</TR>
<% 
	}
}
%>
	</TBODY>
	</TABLE>
</TD>
</TR>
<TR>
<TD height=2 align=center>&nbsp;</TD>
</TR>
<TR>
<TD height=2 align=center>&nbsp;</TD>
</TR>
</TBODY>
</TABLE>
</body>
</html>