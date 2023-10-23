<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

		<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span>
					<a href="/customer_service" title="고객센터 페이지로 이동">고객센터</a>
				</div>
			</div>
		</div>

		<div class="inner-wrap">
			<div class="lnb-area addchat">
				<nav id="lnb" class="ty2">
					<p class="tit"><a href="http://localhost:9000/movieplus/customer_service" title="고객센터">고객센터</a></p>
					<ul>
						<li><a href="http://localhost:9000/movieplus/customer_service" title="고객센터 홈">고객센터 홈</a></li>
						<li><a href="http://localhost:9000/movieplus/customer_service/question" title="자주 묻는 질문">자주 묻는 질문</a></li>
						<li class="on"><a href="http://localhost:9000/movieplus/customer_service/notice" title="공지사항">공지사항</a></li>
						<li><a href="http://localhost:9000/movieplus/customer_service/oneonone" title="1:1문의">1:1문의</a></li>
						<li><a href="http://localhost:9000/movieplus/customer_service/group" title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
						<li><a href="http://localhost:9000/movieplus/customer_service/lostitem" title="분실물 문의">분실물 문의</a></li>
					</ul>

					<div class="left-customer-info">
						<p class="tit">
							MoviePlus 고객센터
							<span>Dream center</span>
						</p>
						<p class="time"><i class="iconset ico-clock"></i> 10:00~19:00</p>
					</div>
				</nav>
			</div>

			<div id="contents" class="">
				<h2 class="tit">공지사항</h2>

				<div class="table-wrap">
					<table class="board-list">
						<colgroup>
							<col style="width:72px;">
							<col style="width:200px;">
							<col style="width:auto;">
							<col style="width:116px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
					</table>
				</div>

				<!-- pagination -->
				<nav class="pagination"><strong class="active">1</strong> <a title="2페이지보기" href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기" href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기" href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기" href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기" href="javascript:void(0)" pagenum="6">6</a> <a title="7페이지보기" href="javascript:void(0)" pagenum="7">7</a> <a title="8페이지보기" href="javascript:void(0)" pagenum="8">8</a> <a title="9페이지보기" href="javascript:void(0)" pagenum="9">9</a> <a title="10페이지보기" href="javascript:void(0)" pagenum="10">10</a> <a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a> <a title="마지막 페이지 보기" href="javascript:void(0)" class="control last" pagenum="551">last</a> </nav>
				<!--// pagination -->
			</div>
		</div>
	</div>

<div class="normalStyle" style="display:none;position:fixed;top:0;left:0;background:#000;opacity:0.7;text-indent:-9999px;width:100%;height:100%;z-index:100;">닫기</div><div class="alertStyle" style="display:none;position:fixed;top:0px;left:0px;background:#000;opacity:0.7;width:100%;height:100%;z-index:5005;"></div></body></html>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>