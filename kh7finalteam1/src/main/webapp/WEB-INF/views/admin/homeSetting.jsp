<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../res/css/home-setting.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<style>
	footer{
		position: fixed;
		width: 100%;
		bottom: 0px;
	}
</style>

<script>
$(function(){
	var numSlick = 0;
	var sliderTitle;
	var contentType;
	var type;
	var keyword = [];
	
	$('.custom-img-slide').each( function() {
        numSlick++;

        
        $(this).addClass( 'slider-' + numSlick).slick({
        	slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 6,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 6,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)//ㅇㄹㄴㅇㄹㄴㅇ
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			//centerMode: true,
			//dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
			//pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			//prevArrow : "<button type='button' class='slick-prev slick-btn'>p</button>",		// 이전 화살표 모양 설정
			prevArrow : "<img src='../res/img/arrow_left.png' class='arrow-img arrow-img-left'>",		// 이전 화살표 모양 설정
			nextArrow : "<img src='../res/img/arrow_right.png' class='arrow-img arrow-img-right'>",		// 다음 화살표 모양 설정
			//dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : false, 	//드래그 가능 여부 
			responsive: [ // 반응형 웹 구현 옵션
				
			]
        });
         
	}); 
	
	$(".slider-wrapper").hover(function(){
		var arrow=$(this).find(".arrow-img-left");
		 
		var X=$(this).find(".slick-slider").offset().left;
		var Y=$(this).find(".slick-slider").offset().top;
		
		var middleY=Y+$(this).find(".slick-slider").height()/2;

		var arrowY=(middleY-arrow.height()/2)-Y;
		
		var minusX= X - 30;

		arrow.css("transform", "translateX(-35px)");	
		arrow.css("top",arrowY+"px"); 
		arrow.css("width","25px");
		arrow.css("visibility","visible");

	},function(){
		var arrow=$(this).find(".arrow-img");
		arrow.css("visibility","hidden");  
	}); 
	
 	$(".slider-wrapper").hover(function(){
		var arrow=$(this).find(".arrow-img-right");
		 
		var X=$(this).find(".slick-slider").offset().left;
		var totalX=$(this).find(".slick-slider").width() + 10;
		var Y=$(this).find(".slick-slider").offset().top;
			
		var middleY=Y+$(this).find(".slick-slider").height()/2;
	
		var arrowWidth=25;
		var arrowY=(middleY-arrow.height()/2)-Y;
		var arrowRight=(arrowWidth/3)*2;
	
		arrow.css("transform", "translateX("+totalX+"px)");
		arrow.css("top",arrowY+"px"); 
		arrow.css("width","25px");
		arrow.css("visibility","visible"); 
	
	},function(){
		var arrow=$(this).find(".arrow-img");
		arrow.css("visibility","hidden");  
	}); 
 	
 	$("#modal1-next-btn").click(function(){
 		sliderTitle = $("#slider-title").val();
 	});
 	
 	$("#modal2-next-btn").click(function(){
 		contentType = $("#slider-type option:selected").val();
 	});
 	
 	$("#modal4-next-btn").click(function(){
 		$(".selected-genre-btn").each(function(){ 			
 			keyword.push($(this).text());
 		}); 		
 	});
 	
 	$("#exampleModalToggle4").on("show.bs.modal", function(e){
 		type = $(e.relatedTarget).attr("data-type");
 		
 		if(type==="cast"){
 			$("#exampleModalToggleLabel4").text("어떤 배우를 찾으시나요?");
 		}
 		else if(type === "genre"){
 			$("#exampleModalToggleLabel4").text("어떤 장르를 찾으시나요? (최대 4개)");
 			
 			$.ajax({
				url: "${pageContext.request.contextPath}/data/admin/getGenre",
				type: "post",
				dataType: "json",
				success:function(resp){
					$("#modal4-body").empty();
					
					for(var i in resp){
						var template = $("#genre-btn-template").html();
						template = template.replace("{{genreName}}", resp[i].genreName);
						$("#modal4-body").append(template);
					}
					
					$.fn.initGenreBtn();
				}						
			});
 		}
 		else if(type === "program_feature"){
 			$("#exampleModalToggleLabel4").text("어떤 특징을 찾으시나요? (최대 4개)");
 		}
 		else if(type === "content"){
 			$("#exampleModalToggleLabel4").text("어떤 제목을 찾으시나요?");
 		} 	
 	});
 	
 	$("#exampleModalToggle5").on("show.bs.modal", function(e){
 		var objParams = {
 			"sliderTitle" : sliderTitle,
 			"contentType" : contentType,
 			"type" : type,
 			"keyword" : keyword
 		};
 		
 		console.log(objParams);
 	
 		
 		$.ajax({
			url: "${pageContext.request.contextPath}/data/admin/getSliderSample",
			type: "post",			
			dataType: "json",
			traditional: true,
			data: {
				sliderTitle : sliderTitle,
	 			contentType : contentType,
	 			type : type,
	 			keyword : keyword
			},
			success:function(resp){
				console.log("suc");
			}						
		});
 	});
 	
 	$.fn.initGenreBtn = function(){
 		$(".genre-btn").click(function(){
 			if($(this).hasClass("unselected-genre-btn")){
 				$(this).removeClass("btn-outline-primary");
 	 			$(this).addClass("btn-primary");
 	 			$(this).removeClass("unselected-genre-btn");
 	 			$(this).addClass("selected-genre-btn");
 			}
 			else if($(this).hasClass("selected-genre-btn")){
 				$(this).removeClass("btn-primary");
 	 			$(this).addClass("btn-outline-primary");
 	 			$(this).removeClass("selected-genre-btn");
 	 			$(this).addClass("unselected-genre-btn");
 			}
 			
 			var count = 0;
 			$(".selected-genre-btn").each(function(){
 				count++;
 				if(count >= 4){
 					$(".unselected-genre-btn").attr("disabled", true);
 				}
 				else{
 					$(".unselected-genre-btn").attr("disabled", false);
 				}
 			});
 			
 			if(count > 0)
 				$("#modal4-next-btn").attr("disabled", false);
 			else
 				$("#modal4-next-btn").attr("disabled", true);
 		}); 		
 	};
});
</script>

<script id="genre-btn-template" type="text/template">
<button class="btn btn-outline-primary genre-btn unselected-genre-btn" style="margin: 5px 0;">{{genreName}}</button>
</script>

<script id="result-template-header" type="text/template">
<div class="slider-wrapper">
	<div class="container-center slider-box" id="slider1">
		<div class="slider-title">
			<div style="display: inline-block; color: #858796;">{{sliderTitle}}</div>
		</div>		
	  	<div class="custom-img-slide">	
</script>

<script id="result-template-body" type="text/template">
<div><img class="slider-img" src="{{contentThumbnail}}"></div>
</script>
   		
<script id="result-template-footer" type="text/template">			 	  
  		</div>
	</div>
</div>
</script>

<div class="container-fluid" style="min-width: 800px; overflow: auto; max-width: 1200px;">
	<div class="container-fluid home-setting-header" >
		<h3>변경하고 싶은 슬라이더를 선택해 주세요</h3>
	</div>
	
	<div class="container-fluid">
		<div class="mini-browser" >
			<div class="mini-browser-header" >
				<div class="logo-wrapper">
					<img src="../res/img/weflex_logo.png" width="100px;">
				</div>
				<div class="profile-wrapper">
					<img src="../res/img/profile.png" width="30px" style="border-radius: 5px;">
				</div>
			</div>
			
			<div class="background-img-wrapper">
				<div class="background-img">
					<img src="https://assets.nflxext.com/ffe/siteui/vlv3/c0a32732-b033-43b3-be2a-8fee037a6146/eb295b7c-6aa7-4485-a3f5-0c61ee5f1434/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_large.jpg"
						width="100%" height="80%">
					<div class="concord-img-gradient"></div>
				</div>
			</div>
			
			<div class="mini-browser-body" >
				<c:forEach var="sliderVO" items="${sliderList }" varStatus="status">
					<div class="slider-wrapper">
						<div class="container-center slider-box" id="slider1">
							<div class="slider-title">
								<div style="display: inline-block; color: #858796;">${sliderVO.sliderTitle }</div>
								<div class="change-btn-wrapper"><a class="btn btn-outline-light" data-bs-toggle="modal" href="#exampleModalToggle" role="button">변경</a></div>
							</div>		
						  	<div class="custom-img-slide">
						   		<c:forEach var="contentListVO" items="${sliderList[status.index].contentList }" varStatus="stat">
									<div><img class="slider-img" src="${contentListVO.contentThumbnail }"></div>
								</c:forEach> 	  
					  		</div>
						</div>
					</div>
				</c:forEach> 
				
				<c:forEach var="i" begin="1" end="${5 - fn:length(sliderList) }" step="1">
					<div class="slider-wrapper">
						<div class="container-center slider-box" id="slider1">
							<div class="slider-title">
								<div style="display: inline-block; color: #858796;">비어있는 Slider</div>
								<div class="change-btn-wrapper"><a class="btn btn-outline-light" data-bs-toggle="modal" href="#exampleModalToggle" role="button">추가</a></div>
							</div>		
						  	<div class="custom-img-slide">						   		
								<div><img class="slider-img" src="https://assets.nflxext.com/ffe/siteui/vlv3/c0a32732-b033-43b3-be2a-8fee037a6146/eb295b7c-6aa7-4485-a3f5-0c61ee5f1434/KR-ko-20210607-popsignuptwoweeks-perspective_alpha_website_large.jpg" ></div>  
					  		</div>
						</div>
					</div>
				</c:forEach>
			</div>	
			
			<div style="height: 350px;"></div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">슬라이더의 제목을 입력하세요</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<input id="slider-title" type="text" placeholder="슬라이더 제목을 입력하세요" 
       		style="width: 70%; height: 50px; margin:auto; display: block;">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="modal1-next-btn" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">다음</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">영상의 종류를 정해주세요</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <select id="slider-type" style="width: 70%; margin:auto; display: block;">
        	<option value="km">국내영화</option>
        	<option value="fm">해외영화</option>
        	<option value="kd">국내드라마</option>
        	<option value="fd">해외드라마</option>
        	<option value="co">예능</option>
        	<option value="an">애니메이션</option>
        	<option value="do">다큐멘터리</option>
        </select>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="modal2-next-btn" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal">다음</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel3">어떤 영상들을 원하세요?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;"
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="cast">출연진으로 찾기</button>
      	</div>
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;" 
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="genre">장르로 찾기</button>
      	</div>
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;"
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="program_feature">프로그램 특성으로 찾기</button>
      	</div>
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;"
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="content">제목으로 찾기</button>
      	</div>
        
      </div>      
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle4" aria-hidden="true" aria-labelledby="exampleModalToggleLabel4" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel4"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal4-body">
      	        
      </div>      
      <div class="modal-footer">
        <button class="btn btn-primary" id="modal4-next-btn" disabled data-bs-target="#exampleModalToggle5" data-bs-toggle="modal" data-bs-dismiss="modal">다음</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle5" aria-hidden="true" aria-labelledby="exampleModalToggleLabel5" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel5">이렇게 등록 할까요?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal5-body">
			
      </div>      
      <div class="modal-footer">
        <button class="btn btn-success" id="modal5-next-btn" disabled data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal">등록</button>
      </div>
    </div>
  </div>
</div>


<div style="height: 76px;"></div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>