<%@page import="com.htmtennis.prj.model.Shop"%>
<%@page import="java.util.List"%>
<%@page import="com.htmtennis.prj.dao.ShopDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcShopDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int npage=1;
	String field = "name";
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
					
			
	ShopDao shopDao = new JdbcShopDao();
	List<Shop> shop = shopDao.getShops(npage, query, field);
	
	pageContext.setAttribute("shop", shop);
	pageContext.setAttribute("total", shopDao.getSize(""));
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bind.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/modernizr.js"></script>
</head>

<body>
    <header id="header">
        <!--  header part  -->
        <div class="content-wrapper">
            <h1 class="hidden">Header</h1>
            <div class="logo">
                <a href=""><img src="../../images/logo_s.png" alt="동아리로고"></a>
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
                <img id="slide-img" src="../../images/slide-img01.png" />
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
                                <li class="side-menu-detail"><a class="side-menu-text" href="">Free</a>
                                <li class="side-menu-detail"><a class="side-menu-text" href="">Info</a>
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
                <h2 id="main-title">Shop</h2>
                <!--<div class="breadcrumb">
                    <h3 class="hidden">현재경로</h3>
                    <ul>
                        <li class="breadcrumb-item breadcrumb-item-size">Home</li>
                        <li class="breadcrumb-item breadcrumb-item-size">Link</li>
                        <li class="breadcrumb-item breadcrumb-item-size">Court</li>
                    </ul>
                </div>-->
                <div class="text-center main-item">
                    <a href=""><img src="../../images/link-map.jpg" width="500" height="250" alt="맵"></a>
                </div>

                <div class="text-center main-item">
                    <div class="wrapper">
                        <h3 class="hidden">링크게시물 검색폼</h3>
                        <form>
                            <fieldset>
                                <a>지도를 클릭하시면 서울 및 지역구별 검색을 할수 있습니다</a>
                                <input class="input-normal" type="text" name="query" />
                                <input class="btn btn-search" type="submit" value="검색" />
                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="board">
                    <table class="board-table text-center">
                        <thead>
                        	<tr class="board-row">
                                <th class="board-cell-th board-cell-width-60  text-center">번호</th>
                                <th class="board-cell-th board-cell-width-160  text-center">이름</th>
                                <th class="board-cell-th board-cell-width-300  text-center">주소</th>
                                <th class="board-cell-th board-cell-width-100  text-center">전화번호</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach var="sh" items="${shop}">
                        <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">${sh.code}</th>
                                <th class="board-cell board-cell-width-160  text-center"><a href="shopDetail.jsp?c=${sh.name}">${sh.code}</a></th>
                                <th class="board-cell board-cell-width-300  text-center">${sh.address}</th>
                                <th class="board-cell board-cell-width-100  text-center">${sh.phoNum}</th>
                            </tr>
                        </c:forEach>
                        
                            <!-- <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">1</th>
                                <th class="board-cell board-cell-width-160  text-center"><a href="courtDetail.html">테니스스퀘어</a></th>
                                <th class="board-cell board-cell-width-300  text-center">서울특별시 중구 광희동</th>
                                <th class="board-cell board-cell-width-100  text-center">02-424-8548</th>
                            </tr>
                            <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">2</th>
                                <th class="board-cell board-cell-width-160  text-center"><a href="courtDetail.html">테니스메트로</a></th>
                                <th class="board-cell board-cell-width-300  text-center">서울특별시 중구 광희동1가</th>
                                <th class="board-cell board-cell-width-100  text-center">02-468-2234</th>
                            </tr>
                            <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">3</th>
                                <th class="board-cell board-cell-width-120  text-center"><a href="courtDetail.html">삼성스포츠</a></th>
                                <th class="board-cell board-cell-width-300  text-center">서울특별시 중구 광희동1가</th>
                                <th class="board-cell board-cell-width-100  text-center">02-856-6448</th>

                            </tr>
                            <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">4</th>
                                <th class="board-cell board-cell-width-160  text-center"><a href="courtDetail.html">우량스포츠</a></th>
                                <th class="board-cell board-cell-width-300  text-center">서울특별시 중구 광희동1가</th>
                                <th class="board-cell board-cell-width-100  text-center">02-745-1234</th>
                            </tr>
                            <tr class="board-row">
                                <th class="board-cell board-cell-width-60  text-center">5</th>
                                <th class="board-cell board-cell-width-160  text-center"><a href="courtDetail.html">빅타스포츠</a></th>
                                <th class="board-cell board-cell-width-300  text-center">서울특별시 중구 광희동1가</th>
                                <th class="board-cell board-cell-width-100  text-center">02-226-8998</th>
                            </tr> -->
                        </tbody>
                    </table>
                </div>

            </main>


        </div>
    </div>



    <footer id="footer">
        <!--  footer part  -->
        <div class="content-wrapper clearfix">

            <div id="logo-footer-container">
                <h2><img src="../../images/logo_m.png" alt="동아리정보" /></h2>
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

