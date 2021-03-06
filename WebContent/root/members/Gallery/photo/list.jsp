﻿<%@page import="com.htmtennis.prj.dao.mybatis.MyBPhotoDao"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcPhotoDao"%>
<%@page import="com.htmtennis.prj.dao.PhotoDao"%>
<%@page import="com.htmtennis.prj.model.Photo"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="ctxName" value="${pageContext.request.servletContext.contextPath}" />
<%	String ctx = request.getContextPath();	%>
	
<% 
	int npage = 1;
	String nquery="";
	String nfield="TITLE";
	
	String _page = request.getParameter("pg");
	String _query = request.getParameter("qy");
	String _field = request.getParameter("fd");
	
	if(_page != null && !_page.equals(""))
		npage = Integer.parseInt(_page);
	if(_query!= null && !_query.equals(""))
		nquery = _query;
	if(_field!= null && !_field.equals(""))
		nfield = _field;
	
 	PhotoDao photoDao = new MyBPhotoDao();
 	
	/* SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
	PhotoDao photoDao = sqlSession.getMapper(PhotoDao.class);  */
 	
	List<Photo> list = photoDao.getPhotos(npage, nquery, nfield);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("total", photoDao.getSize("", "TITLE"));
	
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="../css/bind.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/modernizr.js"></script>
</head>

<body>
    <!-- header -->
    <jsp:include page="../../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">
        
        	<!-- aside -->
            <jsp:include page="../../../inc/aside.jsp"></jsp:include>


            <main id="main">
                <!--  main content part  -->
                <div id="main-title-bar">
                    <p> >>Photo </p>
                </div>

                <div id="table-margin-left">
                    
                </div>

                <div id="table">
                    <table>
                        <tbody>
                            <tr class="table-list-row">
                            
                            	<!-- 글개수만큼 리스트를 갱신 -->
	                            <c:forEach var="ph"  items="${list}">
	                            	<td class="table-cell">
	                                    <table>
	                                        <tbody>
	                                            <tr>
	                                                <td>
	                                                    <a href="view.jsp?c=${ph.code}"><img class="cell-img" src="../images/delpo_1.jpg" /></a>
	                                                </td>
	                                            </tr>
	                                            <tr class="cell-margin"></tr>
	                                            <tr>
	                                                <td><a class="cell-title" href="view.jsp?c=${ph.code}">${ph.title}</a></td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </td>
	                            </c:forEach>

                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <form action="list.jsp" method="get">
                  <fieldset>

                     <legend class="hidden">검색 필드</legend>
                     <label for="field" class="hidden">검색분류</label> 
                     <select class="search-field" name="fd">
                     	<option ${param.fd=='WRITER' ? 'selected' : ""} value="WRITER">작성자</option>
                        <option ${param.fd=='TITLE' ? 'selected' : ""} value="TITLE">제목</option>
                        <option ${param.fd=='CONTENTS' ? 'selected' : ""} value="CONTENTS">본문</option>
                        
                     </select> 
                           <input class="input-normal" type="text" name="qy" value=${param.qy }></input>
                           <input class="btn btn-search" type="submit" value="검색" />
                  </fieldset>
               </form>
               
               
             </main>
        </div>
    </div>


		<!-- footer -->
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>

	</body>
</html>
