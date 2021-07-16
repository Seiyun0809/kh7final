<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/index.css"/>
		    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        
	<meta charset="UTF-8">
	<title>넷플릭스 대한민국 - 인터넷으로 TV프로그램과 영화를 시청하세요</title>
</head>
<body>
	<div class="basicLayout">
		<div class="our-story-container our-story-extended-diacritics">
			<!-- header 부분 -->
			<div class="our-story-header-wrapper">
				<div class="our-story-header">
					<span class="our-story-logo">
						<a style="display: inline-block; height: 100%;" href="#"><img class="img-logo" src="${pageContext.request.contextPath }/res/img/Netflix_Logo_RGB.png" ></a> 
					</span>	
					
					<div class="lang-selection-container">
						<div class="select-arrow">
							<select class="ui-select">
								<option selected>한국어</option>
								<option>English</option>
							</select>
						</div>
					</div>	
					
					<a href="#" class="custom-a-tag login-red-btn">로그인</a>
				</div>
			</div>
			
			<!-- content cards 부분 -->
			<div class="our-story-cards">
				<!-- 1번째 story card div -->
				<div class="our-story-card hero-card hero_fuji vlv">
					<div class="our-story-card-background">
						<div class="concord-img-wrapper">
							<img class="concord-img" src="https://assets.nflxext.com/ffe/siteui/vlv3/c0a32732-b033-43b3-be2a-8fee037a6146/eb295b7c-6aa7-4485-a3f5-0c61ee5f1434/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_large.jpg">
							<div class="concord-img-gradient"></div>
						</div>
					</div>
					<div class="our-story-card-text">
						<h1 class="our-story-card-title">영화, TV 프로그램을 무제한으로.</h1>
						<h2 class="our-story-card-subtitle">다양한 디바이스에서 시청하세요. 언제든 해지하실 수 있습니다.</h2>
						<form class="cta-form email-form">
							<h3 class="email-form-title">시청할 준비가 되셨나요? 멤버십을 등록하거나 재시작하려면 이메일 주소를 입력하세요.</h3>
							<div class="email-form-lockup">
								<ul class="simpleForm structural ui-grid">
									<li class="nfFormSpace field-email">
										<div class="nfInput nfInputResponsive">
											<div class="nfInputPlacement">
												<label class="input_id" placeholder="email">
													<input type="email" id="id_email_hero_fuji" name="email" class="nfTextField hasText" maxlength="50" minlength="5" placeholder="이메일 주소">													
												</label>
											</div>
										</div>
									</li>
								</ul>
								<div class="our-story-cta-container cta-link-wrapper">
									<button class="btn btn-red nmhp-cta nmhp-cta-extra-large btn-none btn-custom">
										<span class="cta-btn-txt">시작하기</span>
										<span class="chevron-right-arrow"><i class="fas fa-angle-right"></i></span>									
									</button>
								</div>
							</div>
						</form>
					</div>					
				</div>
				
				<!-- 2번째 story card div -->
				<div class="our-story-card animation-card watchOnTv">
					<div class="animation-card-container">
						<div class="our-story-card-text">
							<h1 class="our-story-card-title">TV로 즐기세요.</h1>
							<h2 class="our-story-card-subtitle">스마트 TV, PlayStation, Xbox, Chromecast, Apple TV, 블루레이 플레이어 등 다양한 디바이스에서 시청하세요.</h2>
						</div>
						<div class="our-story-card-img-container">
							<div class="our-story-card-animation-container">
								<img class="our-story-card-img" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png">
								<div class="our-story-card-animation">
									<video class="our-story-card-video" autoplay muted loop>
										<source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v" type="video/mp4">
									</video>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 3번째 story card div -->
				<div class="our-story-card animation-card downloadAndWatch flipped">
					<div class="animation-card-container">
						<div class="our-story-card-text">
							<h1 class="our-story-card-title">즐겨 보는 콘텐츠를 저장해 오프라인으로 시청하세요.</h1>
							<h2 class="our-story-card-subtitle">간편하게 저장하고 빈틈없이 즐겨보세요.</h2>
						</div>
						<div class="our-story-card-img-container">
							<div class="our-story-card-animation-container">
								<img class="our-story-card-img" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/mobile-0819.jpg">
								<div class="our-story-card-animation">
									<div class="our-story-card-animation-image">
										<img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/boxshot.png">
									</div>
									<div class="our-story-card-animation-text">
										<div class="text-0">기묘한 이야기</div>
										<div class="text-1">저장 중...</div>
									</div>
								</div>
							</div>
						</div>					
					</div>
				</div>
				
				<!-- 4번째 story card div -->
				<div class="our-story-card animation-card watchOnDevice">
					<div class="animation-card-container">
						<div class="our-story-card-text">
							<h1 class="our-story-card-title">다양한 디바이스에서 시청하세요.</h1>
							<h2 class="our-story-card-subtitle">각종 영화와 TV 프로그램을 스마트폰, 태블릿, 노트북, TV에서 무제한으로 스트리밍하세요. 추가 요금이 전혀 없습니다.</h2>
						</div>
						<div class="our-story-card-img-container">
							<div class="our-story-card-animation-container">
								<img class="our-story-card-img" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png">
								<div class="our-story-card-animation">
									<video class="our-story-card-video" autoplay muted loop>
										<source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-devices.m4v" type="video/mp4">
									</video>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 5번째 story card div -->
				<div class="our-story-card animation-card kidsValueProp flipped">
					<div class="animation-card-container">
						<div class="our-story-card-text">
							<h1 class="our-story-card-title">어린이 전용 프로필을 만들어 보세요.</h1>
							<h2 class="our-story-card-subtitle">자기만의 공간에서 좋아하는 캐릭터와 즐기는 신나는 모험. 자녀에게 이 특별한 경험을 선물하세요. 넷플릭스 회원이라면 무료입니다.</h2>
						</div>
						<div class="our-story-card-img-container">
							<div class="our-story-card-animation-container">
								<img class="our-story-card-img" src="https://occ-0-988-993.1.nflxso.net/dnm/api/v6/19OhWN2dO19C9txTON9tvTFtefw/AAAABTyynLTvOBU46RmBnCIPyjAryrXCZKImpoXdp7Mz54jVGKnBQ1X84bzR-3vtD-RA4uu2b1FjrDgfxE6KElG14WAXW19X.png?r=acf">								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 6번째 story card div -->
				<div class="our-story-card faq-card">
					<div class="our-story-card-text">
						<h1 class="our-story-card-title">자주 묻는 질문</h1>
						<ul class="faq-list">
							<li class="faq-list-item">
								<div class="custom-accordion-item">
									<button class="accordion-button faq-question" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="false" aria-controls="collapseOne">
										넷플릭스란 무엇인가요?</button>
									<div id="collapseOne" class="accordion-collapse collapse faq-answer"
										aria-labelledby="headingOne"
										data-bs-parent=".faq-list-item">
										<div class="accordion-body">
											넷플릭스는 각종 수상 경력에 빛나는 TV 프로그램, 영화, 애니메이션, 다큐멘터리 등 다양한 콘텐츠를 인터넷 연결이 가능한 수천 종의 디바이스에서 시청할 수 있는 스트리밍 서비스입니다.
											<br>
											<br>
											저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼 즐길 수 있습니다. 무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 TV 프로그램과 영화가 제공됩니다.
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>	
	</div>

</body>
</html>