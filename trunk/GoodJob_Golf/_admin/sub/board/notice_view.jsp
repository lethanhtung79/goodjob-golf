﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	String npage = StringUtils.trimToEmpty(request.getParameter("npage"));
	
	BoardDto dto = dao.getView("TB_NOTICE_BBS" , NumberUtils.toInt(seq,0));
	
%>
<HTML>
<HEAD>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=euc-kr">
<LINK REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</HEAD>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 공지사항★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10" valign="top" align="center"><img src="../../images/board/line01.gif" width="600" height="1"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="60"><img src="../../images/board/if_sbj.gif" width="48" height="20"></td>
                <td width="540"><%=StringUtils.trimToEmpty(dto.getSubject())%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="../../images/board/line03.gif" width="600" height="11"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="60"><img src="../../images/board/if_date.gif" width="48" height="20"></td>
                <td width="540"><%=StringUtils.trimToEmpty(dto.getWrite_date())%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="../../images/board/line03.gif" width="600" height="11"></td>
        </tr>
        <tr>
          <td><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="60" valign="top"><img src="../../images/board/if_cts.gif" width="48" height="20"></td>
                <td class="exp" width="540"><%=StringUtils.trimToEmpty(dto.getContent())%></td>
              </tr>
              <tr>
                <td width="600" valign="top" colspan="2"><p>&nbsp;</p></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="../../images/board/line01.gif" width="600" height="1"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center"><table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="200"><a href="notice_list.jsp?npage=<%=npage%>"><img src="../../images/board/bbs_list.gif" width="53" height="22" border='0'></a></td>
                <td width="350" align="right"><table border="0" width="150" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="75" align="center"><a href="notice_write.jsp?seq=<%=seq%>&mode=modify"><img src="../../images/board/bbs_modify.gif" width="53" height="22" border="0"></a></td>
                      <td width="75" align="center"><a href="notice_del.jsp?seq=<%=seq%>"><img src="../../images/board/bbs_del.gif" width="53" height="22" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
