<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moviePost.js"></script>


<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	    <div class="container">
        <!-- page-tit-area -->
        <div class="page-util">
            <div class="inner-wrap">
                <div class="location">
                    <span>Home</span>
                    <a href="#" title="영화 페이지로 이동">영화</a>
                    <a href="#" title="무비포스트 페이지로 이동">무비포스트</a>
                </div>

                
            </div>
        </div>
        <!--// page-tit-area -->

        <!-- contents -->
        <div id="contents">
            <!-- inner-wrap -->
            <div class="inner-wrap">
                <h3 class="tit">무비포스트 작성</h3>
                <div class="user-post-top movieList">
                    <p class="tit">무비포스트로 등록하실 영화를 선택해주세요!</p>
                    <div class="right">
                        등록가능한 영화 <strong class="font-gblue"><span id="totMovieCnt">${mp_movieCnt}</span></strong> 건
                    </div>
                </div>

                <div class="movie-post-step01 movieList">
                    <div class="movie-post">
                        <!-- post-list -->
                        <div class="select-post-list">
                            <ul class="select-post" id="movieList">
	                            <c:forEach var="mp_movie" items="${mp_movieList}"> 
		                            <li>    
		                            	<a href="#" title="${mp_movie.movie_Title} 선택" data-movieCode="${mp_movie.movie_Code}" data-nm="${mp_movie.movie_Title}">
			                            	<div class="bg-chk"></div>        
			                            	<img src="${mp_movie.movie_Poster}"alt="${mp_movie.movie_Title}">   
		                            	</a>
		                            </li>
	                            </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!--
                        to 개발 :
                        웹접근성 이슈 : 더보기 클릭시 새로 생성되는 목록의 첫번째 li 로 focus 가 이동되어야 합니다. (tabindex="0")
                     -->
                    <div class="btn-more" id="addMovieDiv" style="display: none;">
                        <button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                    </div>

                    <div class="btn-group mt20">
                        <a href="${pageContext.request.contextPath}/moviepost/all" class="button large" id="cancelMovieBtn" title="취소">취소</a>
                        <a href="#" class="button large purple" id="selectMovieBtn" title="등록">등록</a>
                    </div>
                </div>

            </div>
            <!--// contents -->
        </div>
    </div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>