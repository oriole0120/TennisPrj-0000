<%@page import="com.htmtennis.prj.model.Free"%>
<%@page import="java.util.List"%>
<%@page import="com.htmtennis.prj.dao.FreeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcFreeDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int npage=1;
	String field = "TITLE";
	String query = "";
	
	String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");
	
	if(_page != null && !_page.equals(""))
		npage=Integer.parseInt(_page);
	
	if(_field != null && !_field.equals(""))
		field =_field;
		
	if(_query != null && !_query.equals(""))
		query =_query;
					
			
	FreeDao freeDao = new JdbcFreeDao();
	List<Free> list = freeDao.getFrees(npage, query, field);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("total", freeDao.getSize(""));
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <!--<link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/layout.css" rel="stylesheet" type="text/css" />-->

    <link href="../css/bind.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/modernizr.js"></script>
</head>

<body>
    <header id="header">
        <!--  header part  -->
        <div class="content-wrapper">
             <h1 class="hidden">Header</h1>
             <div class="logo">
                <a href=""><img src="../../../images/logo_s.png" alt="동아리로고"></a>
                <p>Hansung Tennis Membership</p>
            </div>

            <section class="header-item-container">
                <h2 class="hidden">머릿말</h2>
                <nav id="member-menu">
                    <h3 class="hidden">회원메뉴</h3>
                    <ul class="clearfix">
                        <li class="member-menu-item"><a class="member-menu-text" href="">홈</a></li>
                        <li class="member-menu-item"><a class="member-menu-text" href="">로그인</a></li>
                        <li class="member-menu-item"><a class="member-menu-text" href="">가입</a></li>
                    </ul>
                </nav>

                <nav id="search-form">
                    <h3 class="hidden">게시글검색폼</h3>
                    <form>
                        <fieldset>
                            <input id="search-input" type="text" />
                            <input id="search-button" type="submit" value="검색" />
                        </fieldset>
                    </form>
                </nav>
            </section>


            <div class="header-slide-img">
                <!--  image slide part  -->
                <img id="slide-img" src="../../../images/slide-img01.png" />
            </div>




        </div>

    </header>



    <div id="body">
        <div class="content-wrapper clearfix">

            <aside id="side">
                <!--  aside menu part  -->
                <!--<h2 class="hidden">Menu</h2>-->
                <nav id="side-menu">
                    <ul class="clearfix">
                        <li class="side-menu-item"><a class="side-menu-text" href="">Notice</a></li>
                        <li class="side-menu-item"><a class="side-menu-text" href="">Tennis</a></li>
                       
                         <li class="side-menu-item">
                            <a class="side-menu-text" href="">Community</a>
                            <ul>
                                <li class="side-menu-detail"><a class="side-menu-text" href="list.html">Free</a>
                                <li class="side-menu-detail"><a class="side-menu-text" href="../infomation/list.html">Info</a>
                            </ul>
                        </li>

                        <li class="side-menu-item">
                            <a class="side-menu-text" href="">Gallery</a>
                            <ul>
                                <li class="side-menu-detail"><a class="side-menu-text" href="">Photo</a>
                                <li class="side-menu-detail"><a class="side-menu-text" href="">Video</a>
                            </ul>
                        </li>

                        <li class="side-menu-item"><a class="side-menu-text" href="">Schedule</a></li>
                        <li class="side-menu-item"><a class="side-menu-text" href="">Link</a></li>
                    </ul>
                </nav>

            </aside>


            <main id="main">
                <div>
                    <!--  main content part  -->
                    <h2 id="main-title">정보게시판</h2>

                    <nav id="full-path">
                        <!--<h3>현재경로</h3>-->
                        <ol>
                            <!--<li class="path">Home ></li>-->
                            <li class="path">Community ></li>
                            <li class="path">정보게시판</li>
                        </ol>
                    </nav>

                    <div id="write">
                        <p><a href="edit.html">글쓰기</a></p>
                    </div>

                    <div>
                        <h3 class="hidden">영상목록부분</h3>
                        
                        <table id="free-board-table">
                            <thead>
                                <tr class="free-board-row">
                                    <th class="free-board-cell num"><a class="board-list-item-text">번호</a></th>
                                    <th class="free-board-cell title"><a class="board-list-item-text">제목</a></th>
                                    <th class="free-board-cell writer"><a class="board-list-item-text">작성자</a></th>
                                    <th class="free-board-cell date"><a class="board-list-item-text">작성일</a></th>
                                    <th class="free-board-cell hit"><a class="board-list-item-text">조회수</a></th>
                                    <th class="free-board-cell recommend"><a class="board-list-item-text">추천</a></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="fr" items="${list}">	
                            		<tr>
                            			<td class="free-board-cell num"><a class="board-list-item-text">${fr.code}</td>
										<td class="free-board-cell title"><a class="board-list-item-text" href="view.jsp?c=${fr.code}">${fr.title}</a></td>
										<td class="free-board-cell writer"><a class="board-list-item-text" >${fr.writer}</a></td>
										<td class="free-board-cell date"><a class="board-list-item-text">${fr.regdate}</a></td>
										<td class="free-board-cell hit"><a class="board-list-item-text">${fr.hit}</a></td>
										<td class="free-board-cell recommend"><a class="board-list-item-text">${fr.thumb}</a></td>
									</tr>	
								</c:forEach>
																
                                <!-- <tr>
                                    <td class="free-board-cell num"><a class="board-list-item-text">9</a></td>
                                    <td class="free-board-cell title"><a class="board-list-item-text" href="view.html">테니스 레슨시작했습니다!</a></td>
                                    <td class="free-board-cell writer"><a class="board-list-item-text" href="">페더러짱짱</a></td>
                                    <td class="free-board-cell date"><a class="board-list-item-text">2015-01-19</a></td>
                                    <td class="free-board-cell hit"><a class="board-list-item-text">17</a></td>
                                    <td class="free-board-cell recommend"><a class="board-list-item-text">52</a></td>
                                </tr>
                                
                                <tr>
                                    <td class="free-board-cell num"><a class="board-list-item-text">2</a></td>
                                    <td class="free-board-cell title"><a class="board-list-item-text" href="view.html">테니스 엄청 힘든운동이네요ㅎㅎ</a></td>
                                    <td class="free-board-cell writer"><a class="board-list-item-text" href="">초보자</a></td>
                                    <td class="free-board-cell date"><a class="board-list-item-text">2015-01-17</a></td>
                                    <td class="free-board-cell hit"><a class="board-list-item-text">24</a></td>
                                    <td class="free-board-cell recommend"><a class="board-list-item-text">11</a></td>
                                </tr>
                                <tr>
                                    <td class="free-board-cell num"><a class="board-list-item-text">1</a></td>
                                    <td class="free-board-cell title"><a class="board-list-item-text" href="view.html">즐거운 모임이었어요^^</a></td>
                                    <td class="free-board-cell writer"><a class="board-list-item-text" href="">조코비치</a></td>
                                    <td class="free-board-cell date"><a class="board-list-item-text">2015-01-17</a></td>
                                    <td class="free-board-cell hit"><a class="board-list-item-text">51</a></td>
                                    <td class="free-board-cell recommend"><a class="board-list-item-text">33</a></td>
                                </tr> -->

                            </tbody>
                        </table>
                    </div>

                    <div>
                        <!--<h3>현재페이지위치</h3>-->
                        <p id="page-list">1/5 page</p>
                    </div>

                    <div>
                        <!--<h3>페이지선택목록</h3>-->
                        <p><a class="page" href="list.html">이전</a></p>
                        <ul>
                            <li class="page">1</li>
                            <li class="page">2</li>
                            <li class="page">3</li>
                            <li class="page">4</li>
                            <li class="page">5</li>
                        </ul>
                        <p><a href="list.html">다음</a></p>
                    </div>

                    <div id="main-search-form">
                        <!--<h3>영상게시물 검색폼</h3>-->
                        <form>
                            <fieldset>
                                <!--<legend>영상검색필드</legend>-->
                                <select>
                                    <option>작성자</option>
                                    <option>제목</option>
                                    <option>본문</option>
                                </select>

                                <input class="search" type="text" name="query" />
                                <input class="search" type="submit" value="검색" />

                            </fieldset>
                        </form>
                    </div>

                </div>
            </main>

        </div>
    </div>



    <footer id="footer">
        <!--  footer part  -->
        <div class="content-wrapper clearfix">

            <div id="logo-footer-container">
                <h2><img src="../../../images/logo_m.png" alt="동아리정보" /></h2>
            </div>

            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">동아리정보</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title item-newline"> 주소</dt>
                        <dd class="company-info-item item-data">서울특별시 성북구 삼선교로 16길 116</dd>
                        <dt class="company-info-item item-title">연락처</dt>
                        <dd class="company-info-item item-data">02-760-5528</dd>

                        <dt class="company-info-item item-title item-newline">관리자메일</dt>
                        <dd class="company-info-item item-data">oriole0120@naver.com</dd>
                        <dt class="company-info-item item-title">회장</dt>
                        <dd class="company-info-item item-data">###</dd>
                        <dt class="company-info-item item-title">HTM</dt>
                        <dd class="company-info-item item-data">[Hansung Tennis Membership]</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">저작권정보</h3>
                    <p>Copyright@chanCompany 2015</p>
                </div>
            </div>
        </div>

    </footer>

</body>
</html>
