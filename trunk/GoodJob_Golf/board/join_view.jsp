﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->

					<!--############### 중앙 컨텐츠 영역 #################-->
					<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>JOIN 커뮤니티</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">JOIN 커뮤니티</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td background="../../images/board/img_main_title_bg.gif" height="31" align="right">본 게시물은 <span class="blue">진행중</span>입니다 또는 본게시물은 <span class="orange">완료</span>되었습니다</td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109"><img align="absmiddle" src="../../images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="26">&nbsp;</td>
                                                                <td width="150" class=blue>홍길동</td>
                                                                <td width="109" align="center"><img src="../../images/board/img_board_title_phone.gif" width="31" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="246" class="normal_b">010-123-4567</td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109" height="30"><img src="../../images/board/img_board_title_area.gif" width="31" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="151" class="normal_b">수도권</td>
                                                                <td width="109" align="center"><img align="absmiddle" src="../../images/board/img_board_title_cc.gif" width="42" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="246"  class="blue">안양베네스트CC</td>
                                                              </tr>
                                                              <tr>
                                                                <td width="109" height="30" align="center"><img src="../../images/board/img_board_title_sex.gif" width="43" height="15" border="0"></td>
                                                                <td width="1" height="22" align="center" bgcolor="#D1D3D4"></td>
                                                                <td width="25" height="22">&nbsp;</td>
                                                                <td width="151" height="22"  class="normal_b">구분없음</td>
                                                                <td width="109" height="22" align="center"><img src="../../images/board/img_board_title_age.gif" width="43" height="15" border="0"></td>
                                                                <td width="1" height="22" bgcolor="#D1D3D4"></td>
                                                                <td width="25" height="22">&nbsp;</td>
                                                                <td width="246" height="22"  class="normal_b">구분없음</td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109" height="30"><img src="../../images/board/img_board_title_people.gif" width="43" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="151"><span class=orange>2 </span>명</td>
                                                                <td width="109" align="center"><img src="../../images/board/img_board_title_round.gif" width="52" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="246" class="normal_b">12월 31일 오전 10시</td>
                                                              </tr>
                                                              <tr>
                                                                <td width="109" height="30" align="center"><img src="../../images/board/img_board_title_price.gif" width="43" height="15" border="0"></td>
                                                                <td width="1" height="22" align="center" bgcolor="#D1D3D4"></td>
                                                                <td width="25" height="10">&nbsp;</td>
                                                                <td width="532" height="30" colspan="5">그린피 : <span class=orange>10,000원</span> / 카트비 : <span class=orange>10,000원</span> / 캐디피 : <span class=orange>10,000원</span></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" valign="top" width="109"><img src="../../images/board/img_board_title_write.gif" width="43" height="15" border="0"></td>
                                                                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                                                                <td valign="top" width="25">&nbsp;</td>
                                                                <td width="532" valign="top" height="150">초대글입니다</td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td height="50" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td width="88"><a href="join_edit.html"><img src="../../images/board/btn_edit.gif" width="71" height="24" border="0"></a></td>
                                                                <td width="480"><img src="../../images/board/btn_end.gif" width="71" height="24" border="0"></td>
                                                                <td width="99" align="right"><a href="join_list.html"><img src="../../images/board/btn_list.gif" width="71" height="24" border="0" alt="목록"></a></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td height="2" width="666" colspan="7" bgcolor="#C8D290"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="50" height="27" align="center"><img src="../../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                                                                <td width="10" height="27" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="410" height="27" align="center"><img align="absmiddle" src="../../images/board/img_contents.gif" width="29" height="18" border="0"></td>
                                                                <td width="10" height="27" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="80" height="27" align="center"><img align="absmiddle" src="../../images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                                                                <td width="10" height="27" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="96" height="27" align="center"><p><img src="../../images/board/img_board_title_date.gif" width="21" height="15" border="0"></p></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="7" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td align="center" height="27" width="50">100</td>
                                                                <td align="center" width="10"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="410">댓글내용</td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="80" align="center">홍길동</td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="96" align="center"><p>2011-12-31</p></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="7" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="40"></td>
                                                        </tr>
                                                        <tr>
                                                          <td style="padding-left:133px;">골프장 JOIN커뮤니티에 참여를 원하시는 회원분께서는 댓글을 남겨주시기 바랍니다.</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="107"><img src="../../images/board/img_board_reply.gif" width="60" height="30" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="470" class=blue><textarea name="content" rows="4" cols="73" class="box03"></textarea></td>
                                                                <td width="66" class="blue" align="right">
                                                               <input type="image" name="formimage3" src="../../images/board/btn_confirm.gif" width="60" height="60" border="0"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="40"></td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td height="2" width="666" colspan="19" bgcolor="#C8D290"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="36" align="center" height="27"><img src="../../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="52" align="center"><img align="absmiddle" src="../../images/board/img_board_title_day.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="52" align="center"><img align="absmiddle" src="../../images/board/img_board_title_in.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="173" align="center"><img align="absmiddle" src="../../images/board/img_board_title_field.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="46" align="center"><img align="absmiddle" src="../../images/board/img_board_title_booking.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="47" align="center"><img align="absmiddle" src="../../images/board/img_board_title_in2.gif" width="41" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="40" align="center"><img align="absmiddle" src="../../images/board/img_board_title_age2.gif" width="40" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="39" align="center"><img align="absmiddle" src="../../images/board/img_board_title_regist.gif" width="21" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="38" align="center"><img align="absmiddle" src="../../images/board/img_board_title_hit.gif" width="21" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="53" align="center"><img align="absmiddle" src="../../images/board/img_board_title_process.gif" width="41" height="15" border="0"></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="19" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="41" class=normal_s>100</td>
                                                                <td align="center" width="62" class=normal_s>11/12/31</td>
                                                                <td width="62" align="center" class=normal_s>홍길동</td>
                                                                <td width="183" align="center"><a href="join_view.html" class=board_list>골프장명은 여기로</a></td>
                                                                <td width="57" align="center" class=normal_s>11/12/31</td>
                                                                <td width="56" align="center" class=normal_s>2명</td>
                                                                <td width="51" align="center" class=normal_s>30대</td>
                                                                <td width="49" align="center" class=normal_s>2건</td>
                                                                <td align="center" width="48" class=normal_s>100</td>
                                                                <td align="center" width="60" class=blue_s>진행중</td>
                                                              </tr>
                                                              <tr>
                                                                <td colspan="10" bgcolor="#E5E5E5" height="1"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="white" height="30" align="center" class=normal_s>99</td>
                                                                <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
                                                                <td bgcolor="white" align="center" class=normal_s>홍길동</td>
                                                                <td bgcolor="white" align="center"><a href="join_view.html" class=board_list>골프장명은 여기로</a></td>
                                                                <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
                                                                <td bgcolor="white" align="center" class=normal_s>3명</td>
                                                                <td bgcolor="white" align="center" class=normal_s>40대</td>
                                                                <td bgcolor="white" align="center" class=normal_s>3건</td>
                                                                <td bgcolor="white" align="center" class=normal_s>190</td>
                                                                <td bgcolor="white" align="center" class=orange_s>완료</td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="10" bgcolor="#E5E5E5"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="50">&nbsp;</td>
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
                          <tr>
                            <td><script>flashObject("/images/swf/bottom_menu.swf","","751","27")</script></td>
                          </tr>
                          <tr>
                            <td height="76"><img src="/images/common/img_copyright.gif" width="751" height="76"></td>
                          </tr>
                        </table>
					
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
