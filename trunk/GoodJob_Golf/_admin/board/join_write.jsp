<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.reserve.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="com.goodjob.reserve.dto.PackageDto"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
</head>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ JOIN 커뮤니티 ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="667">
        <tr>
          <td background="/_admin/images/board/img_main_title_bg.gif" height="31">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109"><img align="absmiddle" src="/_admin/images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="26">&nbsp;</td>
                <td width="110" class=blue>홍길동</td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_phone.gif" width="31" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="286"><select name="formselect1" size="1">
                    <option>선택</option>
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                    <option>017</option>
                    <option>018</option>
                    <option>019</option>
                  </select>
                  -
                  <input class="input_01" type="text" size="6" name="day">
                  -
                  <input class="input_01" type="text" size="6" name="day"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_area.gif" width="31" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="110"><select name="formselect1" size="1">
                    <option>선택하세요</option>
                    <option>수도권</option>
                    <option>강원권</option>
                    <option>충청권</option>
                    <option>전라권</option>
                    <option>경상권</option>
                    <option>제주권</option>
                  </select></td>
                <td width="109" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_cc.gif" width="42" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="287"><input class="input_01" type="text" size="32" name="day"></td>
              </tr>
              <tr>
                <td height="30" align="center" width="109"><img src="/_admin/images/board/img_board_title_sex.gif" width="43" height="15" border="0"></td>
                <td height="22" align="center" bgcolor="#D1D3D4" width="1"></td>
                <td height="22" width="25">&nbsp;</td>
                <td height="22" width="110"><select name="formselect1" size="1">
                    <option>선택하세요</option>
                    <option>남성</option>
                    <option>여성</option>
                    <option>구분없음</option>
                  </select></td>
                <td height="22" align="center" width="109"><img src="/_admin/images/board/img_board_title_age.gif" width="43" height="15" border="0"></td>
                <td height="22" bgcolor="#D1D3D4" width="1"></td>
                <td height="22" width="25">&nbsp;</td>
                <td height="22" width="287"><select name="formselect1" size="1">
                    <option>선택하세요</option>
                    <option>20대</option>
                    <option>30대</option>
                    <option>40대</option>
                    <option>50대</option>
                    <option>60대</option>
                    <option>구분없음</option>
                  </select></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_people.gif" width="43" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="110"><select name="formselect1" size="1">
                    <option>선택하세요</option>
                    <option>1명</option>
                    <option>2명</option>
                    <option>3명</option>
                  </select></td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_round.gif" width="52" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="287"><select name="formselect1" size="1">
                    <option>12월</option>
                  </select>
                  <select name="formselect1" size="1">
                    <option>31일</option>
                  </select>
                  <select name="formselect1" size="1">
                    <option>오전</option>
                    <option>오후</option>
                  </select>
                  <input class="input_01" type="text" size="2" name="day">
                  시
                  <input class="input_01" type="text" size="2" name="day">
                  분</td>
              </tr>
              <tr>
                <td height="30" align="center"><img src="/_admin/images/board/img_board_title_price.gif" width="43" height="15" border="0"></td>
                <td height="22" align="center" bgcolor="#D1D3D4"></td>
                <td height="10">&nbsp;</td>
                <td height="30" colspan="5"><form name="form4">
                    <img src="/_admin/images/board/img_title_greenpee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" name="day">
                    원 &nbsp;<img src="/_admin/images/board/img_title_cartpee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" name="day">
                    원 &nbsp;<img src="/_admin/images/board/img_title_caddiepee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" name="day">
                    원
                  </form></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" valign="top" width="109"><img src="/_admin/images/board/img_board_title_write.gif" width="43" height="15" border="0"></td>
                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                <td valign="top" width="25">&nbsp;</td>
                <td width="532" valign="top"><textarea name="content" rows="15" cols="80" class="box03"></textarea></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="88"><a href="join_list.html"><img src="/_admin/images/board/btn_list.gif" width="71" height="24" border="0" alt="목록"></a></td>
                <td width="480" align="right"><img align="absmiddle" src="/_admin/images/board/btn_input.gif" width="71" height="24" border="0" alt="등록"></td>
                <td width="99" align="right"><img src="/_admin/images/board/btn_cancel.gif" width="71" height="24" border="0" align="absmiddle"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="50">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</body>
</html>