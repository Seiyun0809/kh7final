<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/adminTopbar.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
    table#noticeTable tbody tr:hover 
    {
        cursor:pointer;
    }
    .card{
    	margin-bottom:15%;
    }
</style>

<script>
	$(function(){
		
	});
</script>
<div class="container-fluid" style="color:#141414;">

    <section class="ftco-section pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section text-gray-800">공지사항</h2>
                </div>
            </div>
            <div class="row card">
                <div class="col-md-12">
                    <div class="card-body table-wrap">
                        <table class="table table-responsive-md table-hover text-center" id="noticeTable" style="width:100%; color:#141414;">
                            <thead>
                                <tr>
                                    <th class="col-md-1">번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th class="col-md-2">작성일</th>
                                    <th class="col-md-1">조회</th>
                                </tr>
                            </thead>
                            
							
                        </table>
                        <div class="col-md-2 offset-md-10 my-3 p-0 text-right">            
							<a onClick="location.href='write'"  class="btn btn-danger">공지글쓰기</a>            
						</div>
                    </div>
                </div>
                <!-- /.container-fluid -->

<script src="${pageContext.request.contextPath}/res/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/res/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/res/js/demo/datatables-notice.js"></script>
                
            </div>
        </div>
        
    </section>
        
    
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>