<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.MEMBER"%>
<%
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"), "1");
	String field = StringUtils.defaultIfEmpty(request.getParameter("field"), "");
	String region = StringUtils.defaultIfEmpty(request.getParameter("region"), "");
	String reserve = StringUtils.defaultIfEmpty(request.getParameter("reserve"), "");
	
	String keyword = StringUtils.defaultIfEmpty(request.getParameter("keyword"), "");
	String per_page = StringUtils.defaultIfEmpty(request.getParameter("per_page"), "10");
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , MEMBER.per_page );
	
	MemberDao mDao = new MemberDao();
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	params.put("per_page",per_page);
	
	
	List<MemberDto> mList = mDao.getMemSubList(params);
	
	int totalMemCount = mDao.getTotalMember();
	
	int totalCount = mDao.getMemSubTotal(params);
	
	String strPage = paging.getPaging(totalCount, false);
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<title></title>
<script language="javascript">
<!-- 
function NewWindow(mypage, myname, w, h, scroll) {

	var chk = document.getElementsByName("memSeq");
	var count = 0;
	for(i=0; i<chk.length;i++){                                                                    
		if(chk[i].checked==true){
			count++;
			$('#mobile').val(document.getElementsByName("mem_mtel")[i].value);
			break;
		}
	}
		
	if(count == 0){
		alert("sms 발송할 회원을 선택해 주세요!");
		return;
	} 
	var winl = (screen.width - w) / 2; 
	var wint = (screen.height - h) / 2; 
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'; 
	sms = window.open('', "pop_sms_1", winprops); 
	
	document.smsFrm.target="pop_sms_1";
	document.smsFrm.action=mypage;
	document.smsFrm.submit();
	 
} 

var check  = 0;                                                                            //체크 여부 확인
function CheckAll(){                
	var boolchk;                                                                              //boolean형 변수 
	var chk = document.getElementsByName("memSeq");                 //체크박스의 name값
	if(check){ check=0; boolchk = false; }
	else{ check=1; boolchk = true; }    //체크여부에 따른 true/false 설정
	
	for(i=0; i<chk.length;i++){                                                                    
		chk[i].checked = boolchk;                                                                //체크되어 있을경우 설정변경
	}
}

function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="sms_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="sms_list.jsp"
	frm.submit();
}

function perPage(){
	var frm = document.perFrm;
	frm.action="mail_list.jsp"
	frm.submit();
}

//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ SMS 발송 ★</td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="npage" value=""/>
<input type="hidden" name="per_page" value="<%=per_page%>"/>
  <tr>
    <td align="center" style="padding-top:20px;"><p>
        <select name="field" size="1">
          <option value=""<%=("".equals(field)?" selected":"")%>>선택하세요</option>
          <option value="name"<%=("name".equals(field)?" selected":"")%>>회원명</option>
          <option value="id"<%=("id".equals(field)?" selected":"")%>>아이디</option>
          <option value="mobile"<%=("mobile".equals(field)?" selected":"")%>>휴대폰</option>
          <option value="reserve"<%=("reserve".equals(field)?" selected":"")%>>예약횟수</option>
        </select>
        <!--select name="region" size="1">
          <option value=""<%=("".equals(region)?" selected":"")%>>선택하세요</option>
          <option value="1"<%=("1".equals(region)?" selected":"")%>>수도권</option>
          <option value="2"<%=("2".equals(region)?" selected":"")%>>강원권</option>
          <option value="3"<%=("3".equals(region)?" selected":"")%>>충청권</option>
          <option value="4"<%=("4".equals(region)?" selected":"")%>>경상권</option>
          <option value="5"<%=("5".equals(region)?" selected":"")%>>전라권</option>
          <option value="6"<%=("6".equals(region)?" selected":"")%>>제주권</option>
        </select>

        <select name="reserve" size="1">
          <option value=""<%=("".equals(reserve)?" selected":"")%>>선택하세요</option>
          <option value="real"<%=("".equals(reserve)?" selected":"")%>>실시간부킹</option>
          <option value="book"<%=("".equals(reserve)?" selected":"")%>>사전예약</option>
          <option value="package"<%=("".equals(reserve)?" selected":"")%>>패키지</option>
        </select>-->
        &nbsp;
        <input id="keyword" name="keyword" type="text" size="20" value="<%=keyword%>" class="input_box">
        <a href="javascript:on_search();"><img src="/_admin/images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></a>
      </p></td>
  </tr>
</form>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
   <tr>
    <td align="center">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <form name="perFrm" method="post" action="">
        <tr>
          <td height="25"  style="padding-left:5px;" width="112">
          <a href="javascript:CheckAll();"><img src="/_admin/images/inc/btn_select.gif" width="50" height="16" border="0"></a>
          </td>
          <td width="1487" height="25">총 <span class=orange><%=totalMemCount%></span>명 회원중 <span class=blue><%=totalCount%></span>명 검색</td>
          <td width="14%" align="right">
          	<select name="per_page" size="1" onchange="perPage();">
              <option value="10"<%=("10".equals(per_page)?" selected":"")%>>10개씩</option>
              <option value="30"<%=("30".equals(per_page)?" selected":"")%>>30개씩</option>
              <option value="50"<%=("50".equals(per_page)?" selected":"")%>>50개씩</option>
              <option value="100"<%=("100".equals(per_page)?" selected":"")%>>100개씩</option>
            </select></td>
        </tr>
</form>
        <tr>
          <td colspan="3" width="1856">
          <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
 <form name="smsFrm" method="post">
 <input type="hidden" id="mobile" name="mobile" value=""/>
              <tr>
                <td bgcolor="#e6e7e8" height="25" align="center" width="70"><span class=normal_b>선택</span></td>
                <td height="25" align="center" bgcolor="#E6E7E8" width="115"><span class=normal_b>회원명</span></td>
                <td bgcolor="#e6e7e8" align="center" width="320"><span class=normal_b>아이디</span></td>
                <td align="center" bgcolor="#E6E7E8" width="168"><span class=normal_b>로그인횟수</span></td>
                <td bgcolor="#e6e7e8" align="center" width="187"><span class=normal_b>가입일</span></td>
                <td align="center" bgcolor="#E6E7E8" width="215"><span class=normal_b>최종로그인</span></td>
                <td align="center" bgcolor="#E6E7E8" width="240"><span class=normal_b>골프장예약횟수</span></td>
                <td bgcolor="#e6e7e8" align="center" width="250"><span class=normal_b>연락처</span></td>
                <td bgcolor="#e6e7e8" align="center" width="246"><span class=normal_b>SMS수신여부</span></td>
              </tr>
<%
	int mSize = mList.size();

	MemberDto mDto;
	for(int i = 0 ; i < mSize ; i++){ 
		mDto = mList.get(i);
%>
              <tr>
                <td bgcolor="white" align="center" height="25">
                <input type="checkbox" name="memSeq" value="<%=mDto.getMem_seq()%>">
                <input type="hidden" name="mem_mtel" value="<%=mDto.getMem_mtel()%>"/>
                </td>
                <td height="25" align="center" bgcolor="white"><%=mDto.getMem_name()%></td>
                <td align="center" bgcolor="white"><%=mDto.getMem_id()%></td>
                <td align="center" bgcolor="white"><%=mDto.getLogon_cnt()%>회</td>
                <td align="center" bgcolor="white"><%=mDto.getReg_dt()%></td>
                <td align="center" bgcolor="white"><%=StringUtils.defaultString(mDto.getLast_dt(),"미로그인")%></td>
                <td align="center" bgcolor="white"><%=mDto.getReserve_cnt()%>회</td>
                <td align="center" bgcolor="white"><%=StringUtils.trimToEmpty(mDto.getMem_mtel())%></td>
                <td align="center" bgcolor="white"><%=("Y".equals(mDto.getSms_yn())?"수신":"비수신")%></td>
              </tr>
<%
	}
%>
            </table></td>
        </tr>
      </table></td>
  </tr>
  </form>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="70%">
        <tr>
          <td width="50%" align="center"><%=strPage%></td>
          <td width="50%" align="center"><a href="sms_pop.jsp" onClick="NewWindow(this.href,'name','740','350','yes');return false;"><img src="/_admin/images/inc/btn_sms_send.gif" width="200" height="39" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>