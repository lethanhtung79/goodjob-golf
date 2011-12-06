﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">

	function on_submit() {

		if(!$('#mem_name').val()) {
			alert('회원명을 입력해 주세요');
			return;
		}
		
		location.href="/member/join_member_form.jsp";
   	}

   	function sms_send(){

   		if(!$('#mobile0').val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}

   		if(!$('#mobile1').val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile1').focus();
			return;
		}

   		if(!$('#mobile2').val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile2').focus();
			return;
		}

   		if(!$('#mobile3').val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile3').focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "/event/201112/",
			data: "fmoney="+$('#fmoney').val()+"&memo="+$('#memo').val(),
			success: function(msg){
				if($.trim(msg) == '1'){
					
				}
				else{
					
				}
		}});
	}
//-->
</script>
					<!--############### 중앙 컨텐츠 영역 #################-->
<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>회원가입</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원가입</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td width="640" style="padding-top:15px;"><img src="../../images/mem_join/img_join_title_input.gif" width="640" height="80" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="../../images/mem_join/img_join_message.gif" width="560" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="162">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="410"><input class="mem_input" type="text" size="15" name="id"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="27"><input id="mem_id" class="mem_input" type="text" size="15" name="mem_id">
                                                                        @
                                                                        <input id="mem_domain" class="mem_input" type="text" size="15" name="mem_domain">
                                                                        <select name="formselect1" size="1" onchange="">
                                                                          <option value="">선택하세요</option>
                                                                          <option value="naver.com">naver.com</option>
                                                                          <option value="hanmail.net">hanmail.net</option>
                                                                          <option value="dreamwiz.com">dreamwiz.com</option>
                                                                          <option value="empal.com">empal.com</option>
                                                                          <option value="hanmir.com">hanmir.com</option>
                                                                          <option value="hanafos.com">hanafos.com</option>
                                                                          <option value="nate.com">nate.com</option>
                                                                          <option value="paran.com">paran.com</option>
                                                                          <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                                          <option value="gmail.com">gmail.com</option>
                                                                          <option value="self">직접입력하기</option>
                                                                        </select></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="20"><span class=mem_notice>자주 사용하시는 E-mail계정을 입력하시기 바랍니다.</span></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>비밀번호</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input id="mem_pwd" class="mem_input" type="text" size="20" name="mem_pwd">
                                                                  4~12자리의 영문이나 숫자 </td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>비밀번호확인</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="text" size="20" name="id"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>핸드폰</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><select name="formselect1" size="1">
                                                                    <option>선택</option>
                                                                    <option>010</option>
                                                                    <option>011</option>
                                                                    <option>016</option>
                                                                    <option>017</option>
                                                                    <option>018</option>
                                                                    <option>019</option>
                                                                  </select>
                                                                  -
                                                                  <input class="mem_input" type="text" size="4" name="id" maxlength="4">
                                                                  -
                                                                  <input class="mem_input" type="text" size="4" name="id" maxlength="4"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>SMS 수신여부</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="23"> 수신
                                                                        <input type="radio" name="formradio1" checked>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" name="formradio1"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td class="mem_notice" height="23">수신거부 시 예약확인 및 취소와 관련된 알림메세지 서비스를 받으실 수 없습니다. </td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="31" align="right" style="padding-right:10px;" class=mem_subject>E-mail수신여부</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="23"> 수신
                                                                        <input type="radio" name="formradio2" checked>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" name="formradio2"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td class="mem_notice" height="23">수신거부 시 예약확인 및 취소와 관련된 알림메세지 서비스를 받으실 수 없습니다. </td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">추천인 아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="text" size="15" name="id">
                                                                  @
                                                                  <input class="mem_input" type="text" size="15" name="id">
                                                                  <select name="formselect1" size="1">
                                                                    <option>선택하세요</option>
                                                                    <option>naver.com</option>
                                                                    <option>hanmail.net</option>
                                                                    <option>dreamwiz.com</option>
                                                                    <option>empal.com</option>
                                                                    <option>hanmir.com</option>
                                                                    <option>hanafos.com</option>
                                                                    <option>nate.com</option>
                                                                    <option>paran.com</option>
                                                                    <option>yahoo.co.kr</option>
                                                                    <option>gmail.com</option>
                                                                    <option>직접입력하기</option>
                                                                  </select></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:40px;"><a href="javascript:on_submit();"><img src="/images/mem_join/btn_join_mem.gif" width="130" height="39" border="0"></a></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
					
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
