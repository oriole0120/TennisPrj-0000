<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

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
                <div>
                    <h2 id="main-title">정보게시판</h2>

                    <nav id="full-path">
                        <!--<h3>현재경로</h3>-->
                        <ol>
                            <!--<li class="path">Home ></li>-->
                            <li class="path">Community ></li>
                            <li class="path">정보게시판 </li>
                        </ol>
                    </nav>

                    <div id="detail-view">
                        <!--글 보기 화면-->
                        <article class="detail space-top-l">
                            <dl>
                                <dt class="detail-cell detail-cell-title detail-cell-break">제목</dt>
                                <dd class="detail-cell text-highlight">2015년 첫 테니스~!</dd>

                                <dt class="detail-cell detail-cell-title detail-cell-break">작성일</dt>
                                <dd class="detail-cell">2015-02-01</dd>

                                <dt class="detail-cell detail-cell-title detail-cell-break">작성자</dt>
                                <dd class="detail-cell detail-cell-half">페더러</dd>

                                <dt class="detail-cell detail-cell-title ">조회수</dt>
                                <dd class="detail-cell detail-cell-half">50</dd>

                                <dt class="detail-cell detail-cell-title ">추천</dt>
                                <dd class="detail-cell detail-cell-half">77</dd>

                                <dt class="detail-cell detail-cell-title ">첨부파일</dt>
                                <dd class="detail-cell detail-cell-half"></dd>

                                <dt class="hidden">내용</dt>
                                <dd class="detail-cell-content detail-cell-break">
                                    2015년 첫 테니스를 쳤습니다.<br />
                                    간만에 쳐도 재밌네요ㅎㅎ<br />
                                    모두들 즐테하시기 바랍니다^^<br />
                                </dd>
                            </dl>
                            <div id="space-top">
                                <p class="space-top text-center">
                                    <a class="btn btn-list" href="list.html">목록</a>
                                </p>
                                <p class="space-top text-center">
                                    <a class="btn btn-list" href="view.html">이전글</a>
                                </p>

                                <p class="space-top text-center">
                                    <a class="btn btn-list" href="view.html">다음글</a>
                                </p>
                            </div>
                        </article>

    </div>
                    <!--<h3>영상게시물 검색폼</h3>-->

                    <!--<div id="main-search-form">
                        
                        <form>
                            <fieldset>
                               
                                <select>
                                    <option>작성자</option>
                                    <option>제목</option>
                                    <option>본문</option>
                                </select>

                                <input class="search" type="text" name="query" />
                                <input class="search" type="submit" value="검색" />

                            </fieldset>
                        </form>
                    </div>-->
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
