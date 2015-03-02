<%@page import="java.util.List"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcPhotoDao"%>
<%@page import="com.htmtennis.prj.dao.PhotoDao"%>
<%@page import="com.htmtennis.prj.model.Photo"%>


<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	PhotoDao photoDao = new JdbcPhotoDao();
	List<Photo> list = photoDao.getPhotos(npage, nquery, nfield);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("total", photoDao.getSize(""));
	
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
    
    <jsp:include page="../../../inc/header.jsp"></jsp:include>

    <div id="body">
        <div class="content-wrapper clearfix">

            <aside id="side">
                <!--  aside menu part  -->
                <!--<h2 class="hidden">Menu</h2>-->
                <nav id="side-menu">
                    <ul class="clearfix">
                        <li class="side-menu-item"><a class="side-menu-text" href="../../Notice/list.html">Notice</a></li>
                        <li class="side-menu-item"><a class="side-menu-text" href="../../">Tennis</a></li>

                        <li class="side-menu-item">
                            <a class="side-menu-text" href="">Community</a>
                            <ul>
                                <li class="side-menu-detail"><a class="side-menu-text" href="../../Community/freeboard/list.html">Free</a>
                                <li class="side-menu-detail"><a class="side-menu-text" href="../../Community/infomation/list.html">Info</a>
                            </ul>
                        </li>

                        <li class="side-menu-item">
                            <a class="side-menu-text" href="">Gallery</a>
                            <ul>
                                <li class="side-menu-detail"><a class="side-menu-text" href="list.html">Photo</a>
                                <li class="side-menu-detail"><a class="side-menu-text" href="../video/list.html">Video</a>
                            </ul>
                        </li>

                        <li class="side-menu-item"><a class="side-menu-text" href="../../Schedule/list.html">Schedule</a></li>
                        <li class="side-menu-item"><a class="side-menu-text" href="../../Link/main.html">Link</a></li>
                    </ul>
                </nav>

            </aside>


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
                
                

            </main>

        </div>
    </div>



   <jsp:include page="../../../inc/footer.jsp"></jsp:include>

</body>
</html>
