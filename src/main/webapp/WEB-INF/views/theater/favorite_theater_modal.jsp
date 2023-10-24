<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 자주가는 극장 모달 -->
<section id="favor_theater_setting" class="modal-layer"
	style="z-index: 503;">
	<div class="wrap" id="favorBrchReg"
		style="width: 500px; height: 360px; margin-left: -250px; margin-top: -180px;">
		<header class="layer-header">
			<h3 class="tit">선호극장 관리</h3>
		</header>

		<div class="layer-con" style="min-height: 220px; height: 248px;">

			<div class="box-gray v1 a-c">
				<div
					class="dropdown bootstrap-select w150px small bs3 modal-dropdown">
					<button type="button" class="btn dropdown-toggle btn-default"
						title="서울">
						<div class="filter-option">
							<div class="filter-option-inner">
								<div id="modal-loc-selected" class="filter-option-inner-inner">서울</div>
							</div>
						</div>
						<span class="bs-caret"><span class="caret"></span></span>
					</button>
					<div class="dropdown-menu" role="combobox"
						style="max-height: 152px; overflow: hidden; min-width: 150px;">
						<div class="inner open"
							style="max-height: 150px; overflow-y: auto;">
							<ul id="modal-location-list" class="dropdown-menu inner">
								<!-- ajax -->
							</ul>
						</div>
					</div>
				</div>

				<div
					class="dropdown bootstrap-select w150px small ml05 bs3 modal-dropdown">
					<button type="button"
						class="btn dropdown-toggle bs-placeholder btn-default"
						data-toggle="dropdown" role="button" title="극장 선택">
						<div class="filter-option">
							<div class="filter-option-inner">
								<div id="modal-th-selected" class="filter-option-inner-inner"
									style="color: black;">극장 선택</div>
							</div>
						</div>
						<span class="bs-caret"><span class="caret"></span></span>
					</button>
					<div class="dropdown-menu open" role="combobox"
						style="max-height: 152px; overflow: hidden; min-width: 150px;">
						<div class="inner open"
							style="max-height: 150px; overflow-y: auto;">
							<ul id="modal-theater-list" class="dropdown-menu inner ">
								<!-- ajax -->
							</ul>
						</div>
					</div>
				</div>

				<button type="button" id="modal-add-theater"
					class="button gray small ml05">추가</button>
			</div>

			<!-- theater-choice-list -->
			<div class="theater-choice-list">

				<div class="bg empty">

				</div>

				<div class="bg empty"></div>

				<div class="bg empty"></div>

			</div>
			<!--// theater-choice-list -->
		</div>

		<div class="btn-group-fixed">
			<button type="button" class="button close-layer">취소</button>
			<button id="fav-modalp" type="button" class="button purple">등록</button>
		</div>

		<button type="button" class="btn-modal-close">레이어 닫기</button>
	</div>

	<div id="divFavorBrch" style="display: none;">
		<div class="circle">
			<p class="txt"></p>
			<button type="button" class="del">삭제</button>
		</div>
	</div>

</section>

<!-- 자주가는 극장 모달 -->

