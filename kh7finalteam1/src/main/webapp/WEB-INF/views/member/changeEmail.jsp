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
<title>Netflix</title>
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
			
			$("#id_newEmail").on("propertychange change keyup paste input", function(){				
				var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				if(regex.test($(this).val())){
					$(this).css("border-color", "#5fa53f");					
					$(".inputError").css("display", "none");
					$("#btn-next").attr('disabled', false);
				}
				else{
					$(this).css("border-color", "#b92d2b");
					$(".inputError").css("display", "block");
					$("#btn-next").attr('disabled', true);
				}
			});
			
			$("#btn-next").click(function(e){
				$.ajax({
					//url:"${pageContext.request.contextPath}/data/member/changePhone",
					url:contextPath+"/data/member/changeEmail",
					type:"post",
					data: {"email": $("#id_newEmail").val()},
					success:function(resp){
						$(".success-modal").modal("show");
					},
					error:function(resp){
						$(".fail-modal").modal("show");
					}
				});
				
				e.preventDefault();
				
			});
			
			$("#btn-cancel").click(function(){
				window.history.back();
			});
			
			$("#move-main-btn").click(function(){
				location.replace(contextPath);
			});
			
			$(".move-account-btn").click(function(){
				location.replace(contextPath + "/yourAccount");
			});
					
			$("#move-help-btn").click(function(){
				location.replace(contextPath + "/help");
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
								<a href="${pageContext.request.contextPath }" class="svg-nfLogo logo">
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
											<div class="profile-selector">
												<ul class="profiles structural">
													<li class="profile">
														<a href="#">
															<img src="https://occ-0-988-395.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABf9uIfUy3k75jnjPf-M5wZdrjcXMLe04_P5az0_eAPb3dECf_y_hunxCmOg5febcU6DyIEc1L18SK7t1vmE6s5o.png?r=fcd">
															<span class="name">??????</span>															
														</a>
													</li>
												</ul>
											</div>
											<ul class="profile-manage structural">
												<li class="manage">
													<a href="#">????????? ??????</a>
												</li>
											</ul>
											<ul class="links structural">
												<li><a href="#">??????</a></li>
												<li><a href="#">?????? ??????</a></li>
												<li><a href="#">?????????????????? ????????????</a></li>
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
					<div class="responsive-account-container responsive-account-container-phone">
						<form class="change-phone-form">
							<div class="ui-message-container ui-message-security-pass">
								<div class="ui-message-svg-icon">
									<i class="fas fa-user-shield" style="color: white;"></i>
								</div>
								<div class="ui-message-contents">
									?????????????????????! ?????? ????????? ????????????????????? ?????? ?????? ????????? ???????????? ??? ????????????.
								</div>
							</div>
							<h1 class="headline email-headLine">???????????? ???????????????	</h1>
							<ul class="simpleEmailForm structural ui-grid">
								<li class="nfFormSpace">
									<div class="nfInput">
										<div class="nfInputPlacement">
											<label class="input_id">
												<input type="text" id="id_currentEmail" class="nfTextField hasText" value="${email }" disabled>
												<label for="id_currentEmail" class="placeLabel">?????? ?????????</label>
											</label>
										</div>
									</div>
								</li>
								<li class="nfFormSpace">
									<div class="nfInput">
										<div class="nfInputPlacement">
											<label class="input_id">
												<input type="text" name="newEmail" class="nfTextField error hasText" id="id_newEmail">
												<label for="id_newEmail" class="placeLabel">??? ?????????</label>
											</label>
										</div>
										<div class="inputError">????????? ????????? ????????? ???????????????. ???: name@example.com</div>
									</div>
								</li>
							</ul>
							<%-- <input type="text" name="phoneNumber" placeholder="${email }">											
							<div class="inputError">????????? ??????????????? ???????????????.	</div> --%>
							<div class="nf-btn-bar change-phone-buttons">
								<button id="btn-next" type="submit" disabled class="nf-btn nf-btn-primary nf-btn-retro nf-btn-small">
									??????
								</button>
								<button id="btn-cancel" type="button" class="nf-btn nf-btn-secondary nf-btn-solid nf-btn-small">
									??????
								</button>
							</div>
						</form>
					</div>
				</div>
				
				<!-- ?????? ?????? Modal -->
				<div class="modal fade success-modal" id="staticBackdrop"	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true" >
					<div class="modal-dialog">
						<div class="modal-content" style="margin-top: 10rem;">
							<div class="modal-body"><h1 class="headline">???????????? ?????????????????????</h1></div>
							<div class="modal-footer">
								<button id="move-main-btn" type="button" class="btn btn-secondary modal-btn" data-bs-dismiss="modal">?????????????????? ??????</button>
								<button type="button" class="move-account-btn btn btn-primary modal-btn">??? ?????? ????????????</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- ?????? ?????? Modal -->
				<div class="modal fade fail-modal" id="staticBackdrop"	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true" >
					<div class="modal-dialog">
						<div class="modal-content" style="margin-top: 10rem;">
							<div class="modal-header">
								<h1 class="modal-title fail-modal-title" id="exampleModalLabel">????????? ?????? ??????</h1>		
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>						
							</div>
							<div class="modal-body"><h5 class="headline">??????????????? ??????????????????</h5></div>
							<div class="modal-footer">
								<button id="move-help-btn" type="button" class="btn btn-secondary modal-btn" data-bs-dismiss="modal">??????????????? ??????</button>
								<button type="button" class="move-account-btn btn btn-primary modal-btn">??? ?????? ????????????</button>
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