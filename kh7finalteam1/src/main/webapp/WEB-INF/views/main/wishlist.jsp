<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
		$(".search-page-card-img").hover(function(){
			$(this).css("cursor","pointer");
		});
		
		var timeout;
		var modalX;
		var modalY;
		var img;
		//마우스 호버 시 모달 팝업 	
		$(".search-page-card-img").mouseenter(function(){
			
			img = $(this);
			timeout=setTimeout(function(){
				
				var modalWidth=img.width()*1.4;
				var modalVideoHeight=img.height()*1.4*1.05;
				

				$("#hoverModal2").css("width",modalWidth+"px");
				$("#modal-header2").css("height",modalVideoHeight+"px");
				
				/* $("#hoverModal").css("height",modalHeight+"px"); */
				

				$("#hoverModal2").modal({backdrop: false});
				
				$("#hoverModal2").modal("show");
				var imgX=img.offset().left;
				var imgY=img.offset().top;
				
				
				var imgMiddleX=imgX+(img.width()/2);
				var imgMiddleY=imgY+(img.height()/2);

				var modalHeight=$("#hoverModal2").height();
				modalX=imgMiddleX-modalWidth/2;
				modalY=imgMiddleY-modalHeight/2;

				if(modalX<0) modalX=10;
				if((modalX+$("#hoverModal2").width())>$(window).width()){
					modalX=$(window).width()-$("#hoverModal2").width()-10;
				}
				
				
				
			$(".search-page-card-img").mouseleave(function(){
				clearTimeout(timeout);
			});
			
			
			
		
			$("#hoverModal2").css("transform","translate3d("+modalX+"px,"+modalY+"px,0px)"); 	
			$("body").removeClass("modal-open");
			},1000);
			
			
					
		});
		
		
		$(".search-page-card-img").mouseleave(function(){
			$("#hoverModal2").modal("hide");
		});
		
		$("#hoverModal2").mouseleave(function(){
			$("#hoverModal2").modal("hide");
	
		});
		
		
	});
	
</script>
<div class="main-color container-center search-page-body">







	<c:forEach var="contentDto" items="${contentList}">
		<div class="search-page-card"><img src="${contentDto.contentThumbnail }" class="search-page-card-img"></div>

	</c:forEach> 
	
	
	<c:forEach var="j" begin="1" end="5" step="1">
		<div class="search-page-card" style="visibility:hidden;"><img src="res/img/slider_img1.jpeg" class="search-page-card-img"></div>
	</c:forEach> 
	
	
	
<!-- 호버시 팝업될 창 -->
        <div class="modal fade hoverModal" id="hoverModal2"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content hoverModalBox ">
               
                <div class="modal-header" id="modal-header2" style="padding:0;display:flex;border:none;">
                    <iframe class="hoverModalVideo" src="https://www.youtube.com/embed/6a3vhKbJKAE?autoplay=1&loop=1&mute=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="modal-body " id="modal-body2"style=" border:none;">
                    <div class="hover-modal-btn-box">
                    	<button class="btn btn-outline-light hover-modal-etc-btn hover-modal-play-btn"><i class="fas fa-play"></i></button>
	                    <button class="btn btn-outline-light hover-modal-etc-btn" id="modal-check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn" id="modal-plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn modal-thumbs-up" ><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn modal-thumbs-down"><i class="far fa-thumbs-down"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn hover-modal-more-button "data-bs-toggle="modal" data-bs-target="#detailModal"><i class="fas fa-chevron-down"></i></button>
                    </div>
                    <div>
                    	<div class="modal-trailer-feature" style="margin-top:2%;">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box content-limit"></div>
								<div class="modal-trailer-feature-box">시즌 3개</div>
								<div class="modal-feature-border modal-trailer-feature-box">HD</div>
							</div>
                    	<div >
                    		<span>다크</span>
                    		<span style="color:rgb(100,100,100);">&ensp;•&ensp;</span>
                    		<span>흥미진진</span>
                    		<span style="color:rgb(100,100,100);">&ensp;•&ensp;</span>
                    		<span>스릴러</span>
                    	</div>
                    	
                    </div>
                </div>
                
            </div>
        </div>
    </div>

<!-- 상세 정보 클릭시 팝업 모달 -->
	<div class="modal fade " id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg detail-modal">
	    <div class="modal-content">
	     
	      <div class="modal-body main-color" style="padding:0px; border:none;">
			<button type="button" class="btn-close btn-close-white modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
			<div style="position:relative;" class="detail-modal-video-box">
	        	<!-- <video width="100%" height="80%"  autoplay loop muted  style="z-index:-5"> -->

	        	<iframe id="player" width="100%" height="100%" src="https://www.youtube.com/embed/6qaW-KZpmjM?enablejsapi=1&start=00&mute=0&controls=1&modestbranding=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>

				<div class="modal-gradation-box">&ensp;&ensp;</div>
				
				  <div class="modal-trailer-over-box">	
					<div class="main-trailer-img">
						<img id="content-logo" src="" style="width:100%;">
					</div>
					<div class="modal-btn-box">
						<form action="play" style="display: inline-block;">
							<input type="hidden" id="input-content-no" name="contentNo">
							<button class="btn btn-light modal-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
						</form>										
						<button class="btn btn-outline-light modal-etc-btn" id="check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light modal-etc-btn" id="plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light modal-etc-btn" id="thumbs-up-empty"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light modal-etc-btn" id="thumbs-up-full" style="display:none;"><i class="fas fa-thumbs-up"></i></button>
						
					</div>
				
			</div>
	        </div>      
			
			<div class="modal-body-box">
					<div class="modal-trailer-info-box">
						<div style="max-width:60%;">
							<div class="modal-trailer-feature">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box "><img class="content-limit" width="25px" height="25px"></div>
								<div class="modal-trailer-feature-box contentSeason"></div>
								<div class="modal-feature-border modal-trailer-feature-box">HD</div>
							</div>

							<div id="content-info" class="modal-trailer-text">
								

							</div>
						</div>
						<div class="modal-trailer-etc"> 
							<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div>
				       		<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div>
				       		<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-feature"></span></div>
						</div>
					</div>
			
					<div style="position: relative;">
					<!-- 드라마 콘텐츠일 경우 회차 정보 표시 -->
					<%-- <c:if test="${isYseries}"> --%>
			        <div class="modal-series">
			        	<div class="modal-series-title">
			        		<h3>회차</h3>
			        		<div class="series-select-box">
			        		</div>
			        	</div>
			        	<div class="trailer-series-section-box-wrapper"></div>	        								        	
				        </div>
				       <%--  </c:if> --%>
				       
				       <div class="similar-contents-box">
				       		<h3 style="margin-bottom:2%">비슷한 콘텐츠</h3>
				       		<c:set var="wallpaperNo" value="4" /> <!-- 비슷한 콘텐츠 수 받아오기(12개 고정) -->
				       		<div style="display:flex; flex-wrap:wrap;">
				       			
				       			<c:forEach var="i" begin="1" end="${wallpaperNo}" step="1">
				       				
											<div class="similar-contents-detail-box">
					       					<div class="similar-contents-detail-img-box">
					       						<img class="similar-contents-detail-img"src="https://occ-0-988-1007.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABWbhnfZaOzPIyEiVP-se8Ijsy4-W38jRqFzWQ_y9EXrd3iCyOlhsIJ1v30XBp_xdXQJTBo9TQeLs5iLJcHSN4SnqAZXshQnahJXpBwm_XsEJdrRmoRJDrGGd1biF.jpg?r=a95" >
					       						<button class="btn btn-outline-light modal-etc-btn modal-wallpaper-play-btn" style="display:none;"><i class="fas fa-play"></i></button>
					       					</div>
					       					<div class="similar-contents-detail-text-box">
					       						<div style="display:flex;">
					       							<div>
					       							<div class="modal-feature-percent-text"><span>64%</span><span>일치</span></div>
					       							<div>2020</div>
						       						</div>
						       						<button class="btn btn-outline-light modal-etc-btn modal-wallpaper-plus-btn"><i class="fas fa-plus"></i></button>
					       						</div>
					       						<div class="modal-wallpaper-text">
					       							세상을 차단하고 방 안에 틀어박힌 10대 소년. 현수가 세상 밖으로 나온다. 인간이 괴물로 변했다. 그래도 살아야 한다. 아직은 사람이니까. 이웃들과 함께 싸워야 한다.
					       						</div>
					       					</div>
					       				</div>
					       			
					       				
									
				       			</c:forEach>
				       			
				       		</div>
				       		
				       </div>
				       
				       <div style="position: absolute;width: 100%;">
				       <div class="modal-second-gradation-box">&ensp;&ensp;</div>
				       <div class="modal-contents-detail-info" >
				       		
				       		<div class="modal-contents-detail-btn" style="display:flex;">
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-more-button "><i class="fas fa-chevron-down"></i></button>
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-less-button " style="display:none;"><i class="fas fa-chevron-up"></i></button>
					       	</div>
				       		<h3 style="margin-bottom:2%">작품이름 상세 정보</h3>
				       		<div style="font-size:0.8rem;">
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">감독:</span><span>aa</span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div><br>
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">각본:</span><span></span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div><br>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-cast"></span></div><br>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">관람 등급:</span><img class="content-limit" width="25px" height="25px"></div>				       				       			
				       		</div>
				       </div>
				      </div>
				       
			      </div>
		      </div>
		     
		     
	      </div>
	    </div>
	  </div>
	</div>
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
