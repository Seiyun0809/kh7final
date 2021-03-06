<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 호버시 팝업될 창 -->
        <div class="modal fade hoverModal" id="hoverModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color:#fff">
        <div class="modal-dialog" role="document">
            <div class="modal-content hoverModalBox ">
               
                <div class="modal-header" id="modal-header" style="padding:0;display:flex;border:none;">
                    <iframe class="hoverModalVideo" id="hoverPlayer" src="https://www.youtube.com/embed/6a3vhKbJKAE?autoplay=1&loop=1&mute=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="modal-body " id="modal-body"style=" border:none;">
                    <div class="hover-modal-btn-box">
                    	<form action="play" style="display: inline-block;">
                    		<input type="hidden" name="contentNo" id="hover-modal-play-btn">
                    		<input type="hidden" name="contentSeason" value="-1">
                    		<input type="hidden" name="contentEpisode" value="-1">
                    		<button type="submit" class="btn btn-outline-light hover-modal-etc-btn hover-modal-play-btn"><i class="fas fa-play"></i></button>
                    	</form>
                    	<button class="btn btn-outline-light hover-modal-etc-btn wish-delete-btn" id="modal-check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn wish-insert-btn" id="modal-plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn like-insert-btn modal-thumbs-up" id="thumbs-up-empty2"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn like-delete-btn modal-thumbs-up" id="thumbs-up-full2" style="display:none;"><i class="fas fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light hover-modal-etc-btn hover-modal-more-button" data-bs-toggle="modal" data-bs-target="#detailModal"><i class="fas fa-chevron-down"></i></button>
                    </div>
                    <div>
                    	<div class="modal-trailer-feature" style="margin-top:2%;">
								<div class="modal-feature-percent-text modal-trailer-feature-box"><span>64%</span><span>일치</span></div>
								<div id="content-release" class="modal-trailer-feature-box "></div>
								<div class="modal-trailer-feature-box content-limit"><img id="hover-content-limit" src="" width="25" height="25"> </div>
								<div class="modal-trailer-feature-box" id="hover-content-season"></div>
								<div class="modal-feature-border modal-trailer-feature-box">HD</div>
							</div>
							
                    	<div class="hover-modal-genre">
                    		
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
	     
	      <div class="modal-body main-color" style="padding:0px; border:none;" id="detail-modal-body">
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
							<input type="hidden" name="contentSeason" value="-1">
							<input type="hidden" name="contentEpisode" value="-1">
							<button class="btn btn-light modal-play-btn" ><i class="fas fa-play"></i>&ensp;&ensp;재생</button>
						</form>										
						<button class="btn btn-outline-light modal-etc-btn wish-delete-btn" id="check-btn" style="display:none;"><i class="fas fa-check"></i></button>
						<button class="btn btn-outline-light modal-etc-btn wish-insert-btn" id="plus-btn"><i class="fas fa-plus"></i></button>
						<button class="btn btn-outline-light modal-etc-btn like-insert-btn" id="thumbs-up-empty"><i class="far fa-thumbs-up"></i></button>
						<button class="btn btn-outline-light modal-etc-btn like-delete-btn" id="thumbs-up-full" style="display:none;"><i class="fas fa-thumbs-up"></i></button>
						
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
			       		   <div id="similar-content-wrapper"></div>
				       </div>
				       
				       <div style="position: absolute;width: 100%;">
				       <div class="modal-second-gradation-box">&ensp;&ensp;</div>
				       <div class="modal-contents-detail-info" >
				       		
				       		<div class="modal-contents-detail-btn" style="display:flex;">
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-more-button "><i class="fas fa-chevron-down"></i></button>
					       		<button class="btn btn-outline-light modal-etc-btn wallpaper-less-button " style="display:none;"><i class="fas fa-chevron-up"></i></button>
					       	</div>
				       		<h3 style="margin-bottom:2%"><span id="detail-modal-contentName"></span> 상세 정보</h3>
				       		<div style="font-size:0.8rem;">
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">감독:</span><span>aa</span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">출연:</span><span class="content-cast"></span></div><br>
				       			<!-- <div class="modal-contents-detail-info-text"><span style="color: #777;">각본:</span><span></span></div> -->
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">장르:</span><span class="content-genre"></span></div><br>
				       			<div class="modal-contents-detail-info-text"><span style="color: #777;">영화 특징:</span><span class="content-feature"></span></div><br>
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