<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/member.css"/>
		    
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script>
    	var contextPath = "${pageContext.request.contextPath}";
    </script>    
<meta charset="UTF-8">
<title>Weflex</title>
	<script>
		$(function(){
			$("#profileSelector").hover(function(){	
				$(this).click();
			},function(){
				$(".triggers").each(function(){
					if($(this).hasClass("show"))
						$(this).removeClass("show");
				});
			});
			
			$("#move-account").click(function(){
				location.replace(contextPath + "/yourAccount");
			});
			
			$("#move-help").click(function(){
				location.replace(contextPath + "/help");
			});
			
			$("#move-logout").click(function(){
				location.replace(contextPath + "/logout");
			});
			
						
		});
	</script>
	<script>
	$(function(){
		$("btn-client").click(function(){
			location.href="${pageContext.request.contextPath }/memberShipdrop/";
		});
	});
	</script>
</head>
<body>
	<div id="appMountPoint">
		<div class="netflix-sans-font-loaded">
			<div class="accountLayout">
				<!-- ?????? ?????? -->
				<div id="hdSpace">
					<div id="hdPinTarget" class="member-header">
						<div id="hd">
							<div>
								<a href="${pageContext.request.contextPath }/home" class="svg-nfLogo logo">
									<img class="logo_img" src="${pageContext.request.contextPath }/res/img/weflex_logo.png">
								</a>
							</div>
							<div class="account-secondary-navigation last">
								<div id="account-tools">
									<div id="profileSelector" class="profile-selector" data-bs-toggle="collapse" data-bs-target=".triggers" aria-expanded="false" aria-controls="trigger-collapse profiles-collapse">
										<div class="current-profile">
											<img class="avatar" src="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABZAl_RHxQaFudkiao5vPLVFhEyGG1QqTCFxjdy4hEOrxzY9GGUa2IoZyznfP4TitB2zLMNPgY_RK74GZJufj7ek.png?r=a41">
											<span class="profile-arrow"></span>	
											<span class="trigger collapse triggers" id="trigger-collapse"></span>										
										</div>
										<div class="profiles-container collapse triggers" id="profiles-collapse">											
											<ul class="links structural">
												<li><a id="move-account" href="${pageContext.request.contextPath }/yourAccount">??????</a></li>
												<li><a id="move-help" href="${pageContext.request.contextPath }/help">?????? ??????</a></li>
												<li><a id="move-logout" href="${pageContext.request.contextPath }/logout">?????????????????? ????????????</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ?????? content ?????? -->
				<div class="bd">
					<div class="responsive-account-container">
						<div>
							<h1 class="account-header account-header-inline">??????</h1>
							<div class="account-section-membersince">
								<div class="account-section-membersince--svg"></div>
								????????? ??????: ${clientDto.clientJoin }
							</div>
							<div class="responsive-account-content">
								<div class="account-section collapsable-panel clearfix membership-section-wrapper membership-section-with-button">
									<header class="account-section-header collapsable-section-toggle">
										<h2 class="account-section-heading">????????? ??????
<!-- 											<button class="btn account-cancel-button btn-plain btn-small"> -->
<!-- 												<span>????????? ??????</span> -->
<!-- 											</button> -->
											<a href="${pageContext.request.contextPath }/memberShipdrop" class="btn account-cancel-button btn-small btn-drop">
												<span>?????? ??????</span>
											</a>
										</h2>
									</header>
									<section class="collapsable-section-content account-section-content">
										<div class="account-subsection clearfix">
											<div class="clearfix">
												<div class="account-section-group">
													<div class="account-section-item account-section-email">${clientDto.clientId }</div>
													<div class="account-section-item account-section-item-disabled">????????????:********</div>
													<div class="account-section-item account-section-item-disabled">????????????: ${clientDto.clientPhone }</div>
												</div>
												<div class="account-section-group">
													<div class="account-section-item">
														<form class="account-section-form" action="changeEmail">
															<input type="hidden" name="email" value="${clientDto.clientId }">
															<button class="account-section-link" type="submit">																
																????????? ?????? ??????
															</button>
														</form>
													</div>
													<div class="account-section-item">
														<form class="account-section-form" action="changePassword">
															<input type="hidden" >
															<button class="account-section-link" type="submit">																
																???????????? ??????
															</button>
														</form>
													</div>
													<div class="account-section-item">
														<form class="account-section-form" action="changePhone">
															<input type="hidden" name="phoneNumber" value="${clientDto.clientPhone }">
															<button class="account-section-link" type="submit">																
																????????? ?????? ??????
															</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<div class="account-subsection clearfix light-divider">
											<div>
												<div class="account-subsection-borderless clearfix">
													<div class="account-section-group payment-details -wide">
														<div class="account-section-item">
															<div class="wallet--mop">
																<span>
																	<span class="text-payment">???????????????</span>
																</span>
															</div>
														</div>
														<div class="account-section-item">
															${nextExpire }

														</div>
													</div>
													<div class="account-section-group -thin">
														<div class="account-section-item">
															<form class="account-section-form" action="pay/payHistory">
																<input type="hidden" >
																<button class="account-section-link" type="submit">																
																	?????? ?????? ??????
																</button>
															</form>
														</div>
													</div>
												</div>
											</div>											
										</div>
									</section>
								</div>
								
								<div class="account-section collapsable-panel clearfix">
									<header class="account-section-header collapsable-section-toggle">
										<h2 class="account-section-heading">????????? ?????? ??????</h2>
									</header>
									<section class="collapsable-section-content account-section-content">
										<div class="account-subsection clearfix">
											<div class="clearfix">
												<div class="account-section-group">
													<div class="account-section-item">
														<c:choose>
															<c:when test="${clientGradeDto.gradeName eq 'normal'}">
																<b>????????????</b>
															</c:when>
															<c:when test="${clientGradeDto.gradeName eq 'standard'}">
																<b>????????????</b>
															</c:when>
															<c:when test="${clientGradeDto.gradeName eq 'premium'}">
																<b>????????????</b>
															</c:when>
															<c:when test="${clientGradeDto.gradeName eq 'counselor'}">
																<b>?????????</b>
															</c:when>
															<c:when test="${clientGradeDto.gradeName eq 'admin'}">
																<b>?????????</b>
															</c:when>		
															<c:otherwise>
																<b>????????? ?????????????????????.</b>
															</c:otherwise>														
														</c:choose>
													</div>
												</div>
<!-- 												<div class="account-section-group"> -->
<!-- 													<div class="account-section-item"> -->
<!-- 														<form class="account-section-form" > -->
<!-- 															<input type="hidden" > -->
<!-- 															<button class="account-section-link" type="submit">																 -->
<!-- 																????????? ?????? -->
<!-- 															</button> -->
<!-- 														</form> -->
<!-- 													</div> -->
<!-- 												</div> -->
											</div>
										</div>
									</section>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				
				<!-- ?????? footer ?????? -->
				<div class="site-footer-wrapper">
					<div class="footer-divider"></div>
					<div class="site-footer">
						<p class="footer-top">
							<a href="#" class="footer-top-a">????????? ???????????????? ?????? ????????? ???????????????.</a>
						</p>						
						<ul class="footer-links structural">
							<li class="footer-link-item footer-link-audio-and-subtitles">
								<a href="#" class="footer-link"><span>?????? ??? ??????</span></a>
							</li>
							<li class="footer-link-item footer-link-help">
								<a href="#" class="footer-link"><span>?????? ??????</span></a>
							</li>
							<li class="footer-link-item footer-link-gift-card">
								<a href="#" class="footer-link"><span>???????????????</span></a>
							</li>
							<li class="footer-link-item footer-link-relations">
								<a href="#" class="footer-link"><span>?????? ??????(IR)</span></a>
							</li>
							<li class="footer-link-item footer-link-media">
								<a href="#" class="footer-link"><span>????????? ??????</span></a>
							</li>
							<li class="footer-link-item footer-link-jobs">
								<a href="#" class="footer-link"><span>?????? ??????</span></a>
							</li>							
							<li class="footer-link-item footer-link-cookies">
								<a href="#" class="footer-link"><span>?????? ??????</span></a>
							</li>
							<li class="footer-link-item footer-link-terms">
								<a href="#" class="footer-link"><span>?????? ??????</span></a>
							</li>
							<li class="footer-link-item footer-link-privacy">
								<a href="#" class="footer-link"><span>???????????? ????????????</span></a>
							</li>
						</ul>
						<div class="service-code-wrapper">
							<a class="service-code pointer">????????? ??????</a>
						</div>
						<div class="copy-text">
							<div class="copy-text-block">????????????????????????????????? ???????????? ???????????????????????????: ???2018-????????????-0426??? ????????????: </div>
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
	</div>	
</body>
</html>