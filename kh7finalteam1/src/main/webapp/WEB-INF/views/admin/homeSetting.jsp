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
	
	.modal-content{
		background-color: #f3f3f3 !important;
	}
	
	.modal-content input{
		border: 1px solid;
	}
</style>

<script>
$(function(){
	var numSlick = 0;
	var homeSliderNo;
	var sliderTitle;
	var contentType;
	var type;
	var keyword;
	
	$('.custom-img-slide').each( function() {
        numSlick++;

        
        $(this).addClass( 'slider-' + numSlick).slick({
        	slide: 'div',		//???????????? ????????? ??? ?????? ex) div, li 
			infinite : true, 	//?????? ?????? ??????	 
			slidesToShow : 6,		// ??? ????????? ????????? ????????? ??????
			slidesToScroll : 6,		//????????? ????????? ????????? ????????? ??????
			speed : 1000,	 // ?????? ?????? ????????? ?????? ?????? ??????????????? ????????? ??????(ms)//?????????????????????
			arrows : true, 		// ????????? ???????????? ????????? ?????? ??????
			//centerMode: true,
			//dots : true, 		// ???????????? ?????? ????????? ?????????????????? ??????
			//pauseOnHover : true,		// ???????????? ??????	??? ????????? ???????????? ???????????? ????????? ??????
			vertical : false,		// ?????? ?????? ???????????? ??????
			//prevArrow : "<button type='button' class='slick-prev slick-btn'>p</button>",		// ?????? ????????? ?????? ??????
			prevArrow : "<img src='../res/img/arrow_left.png' class='arrow-img arrow-img-left'>",		// ?????? ????????? ?????? ??????
			nextArrow : "<img src='../res/img/arrow_right.png' class='arrow-img arrow-img-right'>",		// ?????? ????????? ?????? ??????
			//dotsClass : "slick-dots", 	//?????? ????????? ??????????????????(???) css class ??????
			draggable : false, 	//????????? ?????? ?????? 
			responsive: [ // ????????? ??? ?????? ??????
				
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
 	
 	$("#slider-title").on("propertychange change keyup paste input", function() {
 		if($(this).val() != "" && $(this).val() != false)
 			$("#modal1-next-btn").attr("disabled", false);
 		else
 			$("#modal1-next-btn").attr("disabled", true);
 	});
 	
 	$("#modal1-next-btn").click(function(){
 		sliderTitle = $("#slider-title").val();
 	}); 	
 	 	
 	$("#modal2-next-btn").click(function(){
 		contentType = $("#slider-type option:selected").val();
 	});
 	
 	$("#exampleModalToggle").on("show.bs.modal", function(e){
 		var status = $(e.relatedTarget).attr("data-status");
 		
 		if(status == "update")
 			homeSliderNo = $(e.relatedTarget).attr("data-sliderNo");
 		else if(status == "insert")
 			homeSliderNo = 0;
 		
 	});
 	
 	$("#exampleModalToggle5").on("show.bs.modal", function(e){
 		$("#slider-title").val("");
 	});
 	
 	$("#exampleModalToggle4").on("show.bs.modal", function(e){
 		type = $(e.relatedTarget).attr("data-type");

		if(type === "genre"){
 			$("#exampleModalToggleLabel4").text("?????? ????????? ????????????????");
 			
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
 			$("#exampleModalToggleLabel4").text("?????? ????????? ????????????????");
 			
 			$.ajax({
				url: "${pageContext.request.contextPath}/data/admin/getFeature",
				type: "post",
				dataType: "json",
				success:function(resp){
					$("#modal4-body").empty();
					
					for(var i in resp){
						var template = $("#feature-btn-template").html();
						template = template.replace("{{featureName}}", resp[i].featureName);
						$("#modal4-body").append(template);
					}
					
					$.fn.initFeatureBtn();
				}						
			});
 		}
 	});
 	
 	$("#exampleModalToggle5").on("show.bs.modal", function(e){
 		$("#modal5-back-btn").attr("data-type", type);
 		
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
				$("#modal5-body").empty();
				
				var template = $("#slider-template-header").html();
				template = template.replace("{{sliderTitle}}", resp.sliderTitle);
				
				if(resp.contentList.length <= 0){
					template += '<div style="display: inline-block; color: #141414;"><h4>???????????? ????????? ????????????</h4></div>';
					template += $("#slider-template-footer").html();
					$("#modal5-body").append(template);
					return;
				}			
								
				for(var i in resp.contentList){
					var tempTemplate = $("#slider-template-body").html();
					tempTemplate = tempTemplate.replace("{{contentThumbnail}}", resp.contentList[i].contentThumbnail);
					template += tempTemplate;					
				}
				
				template += $("#slider-template-footer").html();
				$("#modal5-body").append(template);
								
				$('.sample-img-slide').each( function() {			        
			        $(this).addClass( 'slider-sample').slick({
			        	slide: 'div',		//???????????? ????????? ??? ?????? ex) div, li 
						infinite : true, 	//?????? ?????? ??????	 
						slidesToShow : 6,		// ??? ????????? ????????? ????????? ??????
						slidesToScroll : 6,		//????????? ????????? ????????? ????????? ??????
						speed : 1000,	 // ?????? ?????? ????????? ?????? ?????? ??????????????? ????????? ??????(ms)//?????????????????????
						arrows : true, 		// ????????? ???????????? ????????? ?????? ??????
						//centerMode: true,
						//dots : true, 		// ???????????? ?????? ????????? ?????????????????? ??????
						//pauseOnHover : true,		// ???????????? ??????	??? ????????? ???????????? ???????????? ????????? ??????
						vertical : false,		// ?????? ?????? ???????????? ??????
						//prevArrow : "<button type='button' class='slick-prev slick-btn'>p</button>",		// ?????? ????????? ?????? ??????
						prevArrow : '<button class="modal-slider-arrow modal-slider-arrow-left"><i class="fas fa-chevron-left"></i></button>',		// ?????? ????????? ?????? ??????
						nextArrow : '<button class="modal-slider-arrow modal-slider-arrow-right"><i class="fas fa-chevron-right"></i></button>',		// ?????? ????????? ?????? ??????
						//dotsClass : "slick-dots", 	//?????? ????????? ??????????????????(???) css class ??????
						draggable : false, 	//????????? ?????? ?????? 
						responsive: [ // ????????? ??? ?????? ??????
							
						]
			        });			         
				});
 				
 				$(".modal-slider-arrow").css("display", "none");
			}						
		});
 	});
 	
 	$("#exampleModalToggle5").on("shown.bs.modal", function(e){
 		$('.sample-img-slide').resize(); 		
 	});
 	
 	$("#modal5-body").hover(function(){
 		var slickDiv = $(this).find("div.slick-list");
 		var leftBtn = $(".modal-slider-arrow-left");
 		var rightBtn = $(".modal-slider-arrow-right");
 		
 		leftBtn.css("height", slickDiv.height()+"px");
 		leftBtn.css("transform", "translate3d("+(leftBtn.width()+10)*-1+"px, 0px, 0px)");
 		
 		rightBtn.css("height", slickDiv.height()+"px");
 		rightBtn.css("transform", "translate3d("+slickDiv.width()+"px, "+rightBtn.height()*-1+"px, 0px)");
 		
 		$(".modal-slider-arrow").css("display", "block");
 	}, function(){
  		$(".modal-slider-arrow").css("display", "none");
 	});
 	
 	$("#modal5-next-btn").click(function(){
 		$("input[name=homeSliderNo]").val(homeSliderNo);
 		$("input[name=sliderTitle]").val(sliderTitle);
 		$("input[name=contentType]").val(contentType);
 		$("input[name=type]").val(type);
 		$("input[name=keyword]").val(keyword);
 		
 		$("#regit-form").submit();
 	});
 	 	 	
 	$.fn.initGenreBtn = function(){
 		$(".genre-btn").click(function(){
 			if($(this).hasClass("unselected-genre-btn")){
 				$(".selected-genre-btn").each(function(){
 					$(this).removeClass("btn-primary");
 	 	 			$(this).addClass("btn-outline-primary");
 	 	 			$(this).removeClass("selected-genre-btn");
 	 	 			$(this).addClass("unselected-genre-btn");
 				});
 				
 				$(this).removeClass("btn-outline-primary");
 	 			$(this).addClass("btn-primary");
 	 			$(this).removeClass("unselected-genre-btn");
 	 			$(this).addClass("selected-genre-btn");
 	 			
 	 			keyword = $(this).text();
 			}
 			else if($(this).hasClass("selected-genre-btn")){
 				$(this).removeClass("btn-primary");
 	 			$(this).addClass("btn-outline-primary");
 	 			$(this).removeClass("selected-genre-btn");
 	 			$(this).addClass("unselected-genre-btn");
 	 			
 	 			keyword = ""; 	 			
 			}
 			 			
 			var count = 0;
 			$(".selected-genre-btn").each(function(){
 				count++; 				
 			});
 			
 			if(count > 0)
 				$("#modal4-next-btn").attr("disabled", false);
 			else
 				$("#modal4-next-btn").attr("disabled", true);
 		}); 		
 	};
 	
 	$.fn.initFeatureBtn = function(){
 		$(".feature-btn").click(function(){
 			if($(this).hasClass("unselected-feature-btn")){
 				$(".selected-feature-btn").each(function(){
 					$(this).removeClass("btn-primary");
 	 	 			$(this).addClass("btn-outline-primary");
 	 	 			$(this).removeClass("selected-feature-btn");
 	 	 			$(this).addClass("unselected-feature-btn");
 				});
 				
 				$(this).removeClass("btn-outline-primary");
 	 			$(this).addClass("btn-primary");
 	 			$(this).removeClass("unselected-feature-btn");
 	 			$(this).addClass("selected-feature-btn");
 	 			
 	 			keyword = $(this).text();
 			}
 			else if($(this).hasClass("selected-feature-btn")){
 				$(this).removeClass("btn-primary");
 	 			$(this).addClass("btn-outline-primary");
 	 			$(this).removeClass("selected-feature-btn");
 	 			$(this).addClass("unselected-feature-btn");
 	 			
 	 			keyword = ""; 	 			
 			}
 			 			
 			var count = 0;
 			$(".selected-feature-btn").each(function(){
 				count++; 				
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

<script id="feature-btn-template" type="text/template">
<button class="btn btn-outline-primary feature-btn unselected-feature-btn" style="margin: 5px 0;">{{featureName}}</button>
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

<script id="slider-template-header" type="text/template">
<div class="slider-wrapper">
	<div class="container-center slider-box" id="slider1">
		<div class="slider-title">
			<div style="display: inline-block; color: #858796;">{{sliderTitle}}</div>
		</div>		
	  	<div class="sample-img-slide">
</script>

<script id="slider-template-body" type="text/template">
		<div><img class="slider-img" src="{{contentThumbnail}}"></div>
</script>
			
<script id="slider-template-footer" type="text/template">				  
  		</div>
	</div>
</div>
</script>

<div class="container-fluid" style="min-width: 800px; overflow: auto; max-width: 1200px;">
	<div class="container-fluid home-setting-header" >
		<h3>???????????? ?????? ??????????????? ????????? ?????????</h3>
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
								<div class="change-btn-wrapper">
									<a class="btn btn-outline-light" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-status="update" data-sliderNo="${sliderVO.homeSliderNo }">??????</a>
									<form action="deleteHomeSlider" method="post" style="display: inline-block;">
										<input type="hidden" name="homeSliderNo" value="${sliderVO.homeSliderNo }">
										<button class="btn btn-outline-danger home-slider-delete-btn">??????</button>
									</form>	
								</div>														
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
								<div style="display: inline-block; color: #858796;">???????????? Slider</div>
								<div class="change-btn-wrapper"><a class="btn btn-outline-light" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-status="insert">??????</a></div>
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
        <h5 class="modal-title" id="exampleModalToggleLabel">??????????????? ????????? ???????????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<input id="slider-title" type="text" placeholder="???????????? ????????? ???????????????" required="required"
       		style="width: 70%; height: 50px; margin:auto; display: block;">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="modal1-next-btn" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal" disabled>??????</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">????????? ????????? ???????????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <select id="slider-type" style="width: 70%; margin:auto; display: block;">
        	<option value="km">????????????</option>
        	<option value="fm">????????????</option>
        	<option value="kd">???????????????</option>
        	<option value="fd">???????????????</option>
        	<option value="co">??????</option>
        	<option value="an">???????????????</option>
        	<option value="do">???????????????</option>
        </select>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>
        <button class="btn btn-primary" id="modal2-next-btn" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel3">?????? ???????????? ?????????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;" 
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="genre">????????? ??????</button>
      	</div>
      	<div style="width: 70%; margin:auto; display: block;">
      		<button class="btn btn-outline-secondary modal3-next-btn" style="width: 100%; margin: 10px 0;"
      			data-bs-toggle="modal" data-bs-target="#exampleModalToggle4" data-bs-dismiss="modal"
      			data-type="program_feature">???????????? ???????????? ??????</button>
      	</div>
        <div class="modal-footer">
	      	<button class="btn btn-secondary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>	        
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
      	<button class="btn btn-secondary" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>
        <button class="btn btn-primary" id="modal4-next-btn" disabled data-bs-target="#exampleModalToggle5" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle5" aria-hidden="true" aria-labelledby="exampleModalToggleLabel5" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog5">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel5">????????? ?????? ??????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal5-body" >
			
      </div>      
      <div class="modal-footer">
      	<button class="btn btn-secondary" id="modal5-back-btn" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-type="" data-bs-dismiss="modal">??????</button>
      	<form action="homeSetting" method="post" id="regit-form">
      		<input type="hidden" name="homeSliderNo">
      		<input type="hidden" name="sliderTitle">
      		<input type="hidden" name="contentType">
      		<input type="hidden" name="type">
      		<input type="hidden" name="keyword">
        	<button type="submit" class="btn btn-success" id="modal5-next-btn" data-bs-toggle="modal" data-bs-dismiss="modal">??????</button>
        </form>        
      </div>
    </div>
  </div>
</div>


<div style="height: 76px;"></div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>