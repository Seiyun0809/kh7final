<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%--<% String errMsg = (String)session.getAttribute("errMsg");
 if(errMsg == null) errMsg = "";
 session.invalidate();
 --%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/loginPage.css"/>
		    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        
	<meta charset="UTF-8">
	<title>Weflex</title>
</head>
<body>
	<div id="appMountPoint">
		<div class="login-wrapper hybrid-login-wrapper">
			<div class="login-wrapper-background">
				<img class="concord-img vlv-creative" src="https://assets.nflxext.com/ffe/siteui/vlv3/b8e09d9c-d1e7-4800-afd9-810e41ace684/6d68acdf-6efa-4f03-9513-ef482daff117/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_small.jpg"
					srcset="https://assets.nflxext.com/ffe/siteui/vlv3/b8e09d9c-d1e7-4800-afd9-810e41ace684/6d68acdf-6efa-4f03-9513-ef482daff117/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_small.jpg 1000w, https://assets.nflxext.com/ffe/siteui/vlv3/b8e09d9c-d1e7-4800-afd9-810e41ace684/6d68acdf-6efa-4f03-9513-ef482daff117/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_medium.jpg 1500w, https://assets.nflxext.com/ffe/siteui/vlv3/b8e09d9c-d1e7-4800-afd9-810e41ace684/6d68acdf-6efa-4f03-9513-ef482daff117/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_large.jpg 1800w">				
			</div>
			<div class="nfHeader login-header signupBasicHeader">
				<a href="${pageContext.request.contextPath }" class="svg-nfLogo signupBasicHeader">
					<img class="logo_img" src="${pageContext.request.contextPath }/res/img/weflex_logo.png">
				</a>
			</div>
			<div class="login-body">
				<div>
					<div class="login-content login-form hybrid-login-form hybrid-login-form-signup">
						<div class="hybrid-login-form-main">
						<%--<div id = "errMsg" style="color:white"><%=errMsg %></div> --%>
							<h1>?????????</h1>
							<form action="loginCheck" method="post" class="login-form">
								<div class="nfInput nfEmailPhoneInput login-input login-input-email">
									<div class="nfInputPlacement">
										<div class="nfEmailPhoneControls">
											<label class="input_id">
												<input type="text"  name="clientId" class="nfTextField hasText"  value="${email}" placeholder="????????? ??????">												
											</label>
										</div>
									</div>
								</div>
								<div class="nfInput nfPasswordInput login-input login-input-password">
									<div class="nfInputPlacement">
										<div class="nfPasswordControls">
											<label class="input_id">
												<input type="password"  name="clientPw" class="nfTextField hasText" placeholder="????????????">
											</label>
										</div>
									</div>
								</div>
								<button class="btn login-button btn-submit btn-small" type="submit">?????????</button>
								<div class="hybrid-login-form-help">
									<div class="ui-binary-input login-remember-me">
										<c:choose>
											<c:when test="${cookie.loginInfo != null }">
												<input type="checkbox" id="bxid_rememberMe_true" name="loginInfo" checked>
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="bxid_rememberMe_true" name="loginInfo">
											</c:otherwise>
										</c:choose>										
												
										<label for="bxid_rememberMe_true">
											<span class="login-remember-me-label-text">????????? ?????? ??????</span>
										</label>
									</div>
									<a href="${pageContext.request.contextPath}/join1" class="link login-help-link">????????????</a>
								</div>
							</form>
						</div>
						
						<div class="hybrid-login-form-other">
							<div class="login-signup-now">
								Weflex ????????? ????????????? 
								<a href="${pageContext.request.contextPath}/" >?????? ???????????????.</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- footer -->
			<div class="site-footer-wrapper centered">
				<div class="footer-divider"></div>
				
				<div class="site-footer">
					<p class="footer-top">
						????????? ???????????????? ?????? ??????:&nbsp;
						<a href="#" class="footer-top-a">080-001-9587</a>
					</p>
					<ul class="footer-links structural">
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>?????? ?????? ??????</span>
							</a>
						</li>
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>?????? ??????</span>
							</a>
						</li>
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>?????? ??????</span>
							</a>
						</li>
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>????????????</span>
							</a>
						</li>
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>?????? ??????</span>
							</a>
						</li>
						<li class="footer-link-item">
							<a class="footer-link" href="#">
								<span>?????? ??????</span>
							</a>
						</li>
					</ul>
					<div class="lang-selection-container">
						<div class="ui-select-wrapper">
							<div class="select-arrow medium prefix globe">
								<select class="ui-select medium">
									<option selected>?????????</option>
									<option>English</option>
								</select>
							</div>									
						</div>
					</div>
					<div class="copy-text">
						<div class="copy-text-block">????????????????????????????????? ???????????? ???????????????????????????: ???2018-????????????-0426??? ????????????: 080-001-9587</div>
						<div class="copy-text-block">??????: ???????????? ??? ?????????</div>
						<div class="copy-text-block">????????? ??????: korea@netflix.com</div>
						<div class="copy-text-block">??????: ???????????? ??????????????? ????????? ???????????? 26, ?????????????????? A??? 20??? ???????????? 03161</div>
						<div class="copy-text-block">?????????????????????: 165-87-00119</div>
						<div class="copy-text-block">???????????? ?????????: Amazon Web Services Inc.</div>
						<div class="copy-text-block">????????????????????? ????????????</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>