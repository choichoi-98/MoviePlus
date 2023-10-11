<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

<!-- 컨텐츠 영역 -->
<div id="contents"  class="">
  <form enctype="multipart/form-data" id="modifyinfoform" action="${pageContext.request.contextPath}/member/modifyProcess" method="post">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
                                  <div class="profile-img">
                                  	  <span id="filevalue" style="display:none;">${memberInfo.MEMBER_PROFILE}</span>
                                  	  <c:if test="${empty memberInfo.MEMBER_PROFILE}">
                                     	 <img src="${pageContext.request.contextPath}/resources/image/member/bg-profile.png" alt="프로필 사진">
                                      </c:if>
                                      <c:if test="${!empty memberInfo.MEMBER_PROFILE}">
                                     	 <img src="${pageContext.request.contextPath}/upload${memberInfo.MEMBER_PROFILE}" alt="프로필 사진">
                                      </c:if>
                                      <input type="file" id="upfile" name="uploadfile" accept=".jpg, .png" >
                                  </div>
									 <button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 등록</button>  
                                     <button type="button" class="button small gray-line" id="deleteProfileImgBtn" style="display:none;">이미지 삭제</button> 
                                      
                                  <a href="${pageContext.request.contextPath}/member/delete?MEMBER_ID=${memberInfo.MEMBER_ID}" id="deletemember" class="button small member-out" title="회원탈퇴">회원탈퇴</a>
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

              <input type="hidden" name="MEMBER_ID" value="${memberInfo.MEMBER_ID}">

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
                                  <input type="text" name="MEMBER_PHONENO" id="phoneNo" class="input-text w500px" value="${memberInfo.MEMBER_PHONENO}" maxLength="11" placeholder="&#39;-&#39;제외하고 입력해 주세요">
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                   <label for="email">이메일</label> <em class="font-orange">*</em>
                              </th>
                              <td>
                                  <div class="clearfix">
                                      <p class="reset float-l w170px lh32 changeVal" data-name="Email">
                                       <span id="email" >${memberInfo.MEMBER_EMAIL}</span> 
                                      </p>
                                      <div class="float-l">
                                          <button type="button" class="button small gray-line change-phone-num" id="EmailChgBtn" title="이메일 변경">이메일 변경</button>
                                      </div>
                                  </div>

                                  <div class="change-phone-num-area">
                                      <div class="position">
                                          <label for="chPhone" class="label">변경할 이메일</label>
                                          <input type="text" name="MEMBER_EMAIL" value="${memberInfo.MEMBER_EMAIL}" id="chEmail" class="input-text w180px" placeholder="&#39;@&#39;포함하여 입력해 주세요" title="변경할 이메일 입력" style="width:220px; !important" >
                                          <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
                                      	  <input type="hidden" class="verifycode" id="chverifycode" name="chverifycode" />
                                      </div>

                                      <div class="position" style="display: none;">
                                          <label for="chkNum" class="label">인증번호 입력</label>
										
                                          <div class="chk-num small">
                                              <div class="line">
                                                  <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="6">
                                                  <div class="time-limit" id="timeLimit">3:00</div>
                                              </div>
                                          </div>
                                          <button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
                                      </div>
                                  </div>
                              </td>
                          </tr>
           
                          <tr>
                              <th scope="row">비밀번호 <em class="font-orange">*</em></th>
                              <td>
                                  <a href="${pageContext.request.contextPath}/member/passchg" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          


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
              <button type="submit" class="button purple large" id="updateBtn">등록</button>
          </div>
          </form>
      </div>
<!-- contents end -->

   </div>
</div>
        
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

