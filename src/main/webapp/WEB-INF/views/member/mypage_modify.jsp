<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<title>MoviePlus: 모두를 위한 영화관 </title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>

	<!--상단의 홈 아이콘 > 나의 무비플러스-->
       <div class="container has-lnb">
            <div class="page-util">
                 <div class="inner-wrap" id="myLoaction"><div class="location">
					<span>Home</span>
					<a href="${pageContext.request.contextPath}/member/mypage" title="나의 무비플러스 페이지로 이동">나의 무비플러스</a>
				</div></div>
	        </div>
       <div class="inner-wrap">
                

	<!--사이드바-->
	<div class="lnb-area">
		<nav id="lnb">
			<p class="tit on"><a href="${pageContext.request.contextPath}/member/mypage" title="나의 무비플러스">나의 무비플러스</a></p>

			<ul>
				<li class=""><a href="#" title="예매/구매내역">예매/구매내역</a></li>
                   <li>
                   	<a href="#" title="영화/스토어 관람권">영화/스토어 관람권</a>
					<ul class="depth3">
						<li><a href="#" title="영화관람권">영화관람권</a></li>
						<li><a href="#" title="스토어 교환권">스토어 교환권</a></li>
					</ul>
				</li>
				<li><a id="discountCoupon" href="#" title="무비플러스/제휴쿠폰">무비플러스/제휴쿠폰</a></li>
				<!-- <li><a href="/on/oh/ohh/Mvtckt/GiftCardL.do">무비플러스 기프트카드</a></li> -->
				<li>
					<a href="#" title="멤버십 포인트">멤버십 포인트</a>
					<ul class="depth3">
						<li><a href="#" title="포인트 이용내역">포인트 이용내역</a></li>
						<li><a href="#" title="멤버십 카드관리">멤버십 카드관리</a></li>
						<li><a href="#" title="MiL.k 제휴서비스">MiL.k 포인트</a></li>
					</ul>
				</li>
				<li><a href="#" titel="나의 무비스토리">나의 무비스토리</a></li>
				<li><a href="#" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
				<li><a href="#" title="나의 문의내역">나의 문의내역</a></li>
				<li><a href="#" title="자주쓰는 할인카드">자주쓰는 카드 관리</a></li>
				<li>
					<a href="#" title="회원정보">회원정보</a>
					<ul class="depth3">
						<li><a href="${pageContext.request.contextPath}/member/modifyinfo" title="개인정보 수정">개인정보 수정</a></li>
						<li><a href="#" title="선택정보 수정">선택정보 수정</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>




	<div id="myLoactionInfo" style="display: none;">
		<div class="location">
			<span>Home</span>
			<a href="${pageContext.request.contextPath}/member/mypage" title="나의 무비플러스 페이지로 이동">나의 무비플러스</a>
			<a href="" title="회원정보 페이지로 이동">회원정보</a>
        	<a class="no-link">개인정보 수정</a>
		</div>
	</div>

<!-- 컨텐츠 영역 -->
<div id="contents"  class="">
	  <h2 class="tit">개인정보 수정</h2>

        <ul class="dot-list mb10">
             <li>회원님의 정보를 정확히 입력해주세요.</li>
        </ul>

          <div class="table-wrap">
              <table class="board-form">
                  <caption>프로필사진, 아이디 항목을 가진 표</caption>
                  <colgroup>
                      <col style="width:180px;">
                      <col>
                  </colgroup>
                  <tbody>
                      <tr>
                          <th scope="row">프로필 사진</th>
                          <td>
                              <div class="profile-photo">
                                  <form name="fileForm">
                                      <input type="file" id="profileTarget" name="file" style="display: none;">
                                      
                                  </form>

                                      
                                  <div class="profile-img">
                                      <img src="./modify2_files/FkxX5WniUf1bRPiiKG9eZpHe5W4ZGvIo_640.png" alt="프로필 사진">
                                  </div>

                                     <button type="button" class="button small gray-line" id="deleteProfileImgBtn">이미지 삭제</button>
                                      
                                  <a href="" id="deletemember" class="button small member-out" title="회원탈퇴">회원탈퇴</a>
                              </div>
                              <p style="font-size:0.8em; color:#999; margin-top:10px; padding:0; text-align:left; position:absolute; top:22px; left:194px;">
                                  ※ 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
                          </td>
                      </tr>
                      <tr>
                          <th scope="row">아이디</th>
                          <td>${memberInfo.MEMBER_ID}</td>
                      </tr>
                  </tbody>
              </table>
          </div>

          <div class="tit-util mt40 mb10">
              <h3 class="tit">기본정보</h3>

              <div class="right">
                  <p class="reset"><em class="font-orange">*</em> 필수</p>
              </div>
          </div>

          <form name="mbInfoForm">
              <input type="hidden" name="mbNo" value="14300923">
              
              <input type="hidden" name="phoneNo" value="010-7478-7481">
              <input type="hidden" name="zipcd" value="">
              <input type="hidden" name="mbAddr" value="">
              <input type="hidden" name="mbProfilFileNo" value="1174805">
              <input type="hidden" id="mbByymmdd" value="19940810">

              <div class="table-wrap mb40">
                  <table class="board-form">
                      <caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
                      <colgroup>
                          <col style="width:180px;">
                          <col>
                      </colgroup>
                      <tbody>
                          <tr>
                              <th scope="row">
                                  이름 <em class="font-orange">*</em>
                              </th>
                              <td>
                                  <span class="mbNmClass">${memberInfo.MEMBER_NAME}</span>
                                  <a href="https://www.megabox.co.kr/mypage/userinfo#layer_name" class="button small gray-line ml10 mr10 btn-modal-open" w-data="600" h-data="350" title="이름변경">이름변경</a>
                                  ※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.

                                  <section id="layer_name" class="modal-layer"><a href="${pageContext.request.contextPath}/member/mypage" class="focus">레이어로 포커스 이동 됨</a>
                                      <div class="wrap">
                                          <header class="layer-header">
                                              <h3 class="tit">본인확인 수단 선택</h3>
                                          </header>

                                          <div class="layer-con">
                                              <p class="reset">
                                                  이름을 변경하기 위한 본인 확인 수단을 선택해 주세요.<br>
                                                  (단, 개명된 이름으로 가입된 본인명의의 휴대전화 또는 아이핀으로만 가능함)
                                              </p>

                                              <div class="box-gray v1 mt20 a-c">
                                                  <a href="https://www.megabox.co.kr/mypage/userinfo#" target="_blank" class="button" id="ipinBtn" title="I-PIN 인증">I-PIN 인증</a>
                                                  <a href="https://www.megabox.co.kr/mypage/userinfo#" target="_blank" class="button ml10" id="phoneBtn" title="휴대폰 인증">휴대폰 인증</a>
                                              </div>

                                              <ul class="dash-list mt20">
                                                  <li>신용평가기관에 개명된 이름이 먼저 등록되어 있어야 합니다.</li>
                                                  <li>본인인증을 위해 입력하신 정보는 해당 인증기관에서 직접 수집하며 인증 이외의 용도로 이용 또는 저장되지 않습니다.</li>
                                              </ul>
                                          </div>

                                          <button type="button" class="btn-modal-close">레이어 닫기</button>
                                      </div>
                                  </section>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  생년월일 <em class="font-orange">*</em>
                              </th>
                              <td>
                                <span id="birth">${memberInfo.MEMBER_BIRTH}</span>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="num">휴대폰</label> <em class="font-orange">*</em>
                              </th>
                              <td>
                                  <div class="clearfix">
                                      <p class="reset float-l w170px lh32 changeVal" data-name="phoneNo">
                                          <span id="phoneNo">${memberInfo.MEMBER_PHONENO}</span> <!-- 010-1234-5678 형식으로 바꾸기 -->
                                      </p>
                                      <div class="float-l">
                                          <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
                                      </div>
                                  </div>

                                  <div class="change-phone-num-area">
                                      <div class="position">
                                          <label for="chPhone" class="label">변경할 휴대폰</label>
                                          <input type="text" id="chPhone" class="input-text w160px numType" placeholder="&#39;-&#39;없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11">
                                          <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
                                      </div>

                                      <div class="position" style="display: none;">
                                          <label for="chkNum" class="label">인증번호 입력</label>

                                          <div class="chk-num small">
                                              <div class="line">
                                                  <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">

                                                  <div class="time-limit" id="timeLimit">3:00</div>
                                              </div>
                                          </div>
                                          <button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="email">이메일</label> <em class="font-orange">*</em>
                              </th>
                              <td>
                                  <input type="text" id="email" name="mbEmail" class="input-text w500px" value="${memberInfo.MEMBER_EMAIL}">
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">비밀번호 <em class="font-orange">*</em></th>
                              <td>
                                  <a href="https://www.megabox.co.kr/on/oh/ohh/Mypage/userPwdChangePage.do" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </form>


          <h3 class="tit">간편로그인 계정연동</h3>

          <div class="table-wrap mb40">
              <table class="board-list">
                  <caption>구분, 연동정보, 연결 항목을 가진 간편 로그인 계정연동 표</caption>
                  <colgroup>
                      <col style="width:130px;">
                      <col>
                      <col style="width:110px;">
                  </colgroup>
                  <thead>
                      <tr>
                          <th scope="col">구분</th>
                          <th scope="col">연동정보</th>
                          <th scope="col">연결</th>
                      </tr>
                  </thead>
                  <tbody id="lnkgInfoTbody">
                      <tr>
                          <th scope="row" class="a-c">네이버</th>
                          
                              
                              
                                  <td class="a-l">연결된 계정정보가 없습니다.</td>
                                  <td><button type="button" class="button small gray" lnkgty="NAVER" connty="conn">연동</button></td>
                              
                          
                      </tr>
                      <tr>
                          <th scope="row" class="a-c">카카오</th>
                          
                              
                              
                                  <td class="a-l">연결된 계정정보가 없습니다.</td>
                                  <td><button type="button" class="button small gray" lnkgty="KAKAO" connty="conn">연동</button></td>
                              
                          
                      </tr>
                      <tr>
                          <th scope="row" class="a-c">페이코</th>
                          
                              
                              
                                  <td class="a-l">연결된 계정정보가 없습니다.</td>
                                  <td><button type="button" class="button small gray" lnkgty="PAYCO" connty="conn">연동</button></td>
                              
                          
                      </tr>
                  </tbody>
              </table>
          </div>

          <h3 class="tit">스페셜 멤버십 가입내역</h3>

          <div class="table-wrap mb40">

              <!-- 가입된 스페셜멤버십이 있는 경우 -->
              <table class="board-form">
                  <caption>가입정보, 스페셜 멤버십 이용동의 안내 순서로 보여줍니다.</caption>
                  <colgroup>
                      <col style="width:180px;">
                      <col>
                  </colgroup>
                  <tbody>
                      <!-- 가입 내역이 없는 경우 -->
                      <tr>
                          <th scope="row">가입정보</th>

                          
                              
                                  <td>
                                      <div class="clearfix">
                                          <p class="float-l reset lh32">가입된 스페셜 멤버십이 없습니다.</p>
                                          <div class="float-r">
                                              <a href="https://www.megabox.co.kr/curation/specialcontent" class="button small gray" title="스페셜 멤버십 가입 안내">스페셜 멤버십 가입 안내</a>
                                          </div>
                                      </div>
                                  </td>
                              
                              
                          
                      </tr>

                      
                  </tbody>
              </table>
          </div>

          <div class="btn-group mt40">
              <button class="button large" id="cancelBtn">취소</button>
              <button class="button purple large" id="updateBtn">등록</button>
          </div>
      </div>
<!-- contents end -->

   </div>
</div>
        
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>