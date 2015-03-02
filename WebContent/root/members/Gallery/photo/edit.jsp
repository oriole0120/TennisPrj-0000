<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="../css/bind.css" rel="stylesheet" type="text/css" />
    <!--<script type="text/javascript" src="../js/modernizr.js"></script>-->
    <script type="text/javascript" src="../../../editor/js/HuskyEZCreator.js" charset="utf8"></script>


 
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
                <section id="board-detail" class="space-top-l">
                    <h1 class="hidden">본문 작성</h1>
                    
                    <div id="main-title-bar">
    	                <p> >>Photo </p>
	                </div>
        
                    
                    <form id="text-area" action="photoRegProc.jsp" method="post" enctype="multipart/form-data">
                    	<fieldset>
	                    	<legend class="hidden">공지사항입력필드</legend>
	                    	
	                    	<dl>
		                        <dt class="detail-cell title newrow">제목</dt>
		                        <dd class="detail-cell text-highlight"><input type="text" name="title" /></dd>
		                        
		                        <dt class="hidden">내용</dt>
		                        <dd class="content newrow">
		                        	<textarea name="content" id="content" rows="10" cols="100" style="width: 750px; height: 400px; display: none;"></textarea>
		                        	<script type="text/javascript">
					                    var oEditors = [];
					                    nhn.husky.EZCreator.createInIFrame({
					                        oAppRef: oEditors,
					                        elPlaceHolder: "content",
					                        sSkinURI: "../../../editor/SmartEditor2Skin.html",
					                        fCreator: "createSEditor2"
					                    });
				                	</script>
		                        </dd>
		                    </dl>
                    	</fieldset>
                    
	                    <p id="button-container" class="space-top text-center">
	                    	<input type = "submit" value="등록" />
	                    	<a href="list.jsp">취소</a>
	                    </p>
          
                	</form>
            	</section>
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
