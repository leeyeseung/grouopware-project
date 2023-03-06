<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  	<!-- =========================sideber=============================== -->
		<aside id="sidebar" class="sidebar">
			<ul class="sidebar-nav" id="sidebar-nav">
			 
				<!--휴가 작성 -->
				<li class="nav-item">
					<a class="btn btn-primary" type="button" href="#" style="width:100%">
					    <i class="bi bi-pencil-square"></i> 
					    <span>휴가 작성</span>
				  	</a>
				</li>
			
				<!--근무 현황 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--휴가 문서 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 문서</span>
					</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span><i class="bi bi-chevron-down ms-auto"></i>
				  	</a>
					<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
						<li>
					    	<a href="#">
					      		<span>공공사업1</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>공공사업2</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>전략사업</span>
					    	</a>
					  	</li>
					  	<li>
				    		<a href="#">
					      		<span>경영관리</span>
					    	</a>
					  	</li>
					</ul>
				</li>
			
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ======================================Main==================================================== -->
		<main id="main" class="main">
			
			<!-- 페이지 제목 -->
			<div class="pagetitle">
				<h1>휴가 문서</h1>
				<nav>
					<ol class="breadcrumb">
				    	<li class="breadcrumb-item"><a href="index.html">근태관리</a></li>
				    	<li class="breadcrumb-item"><a href="index.html">휴가 문서</a></li>
				  	</ol>
				</nav>
			</div>
		
			<!-- 페이지 내용 -->
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<div class="card mt-2">
							<div class="card-body mt-3">
							 	<!-- vacation Tabs -->
								<ul class="nav nav-tabs nav-tabs-bordered" id="vacationTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab" aria-controls="receive" aria-selected="true">처리 문서</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="my-tab" data-bs-toggle="tab" data-bs-target="#myvacation" type="button" role="tab" aria-controls="send" aria-selected="false">나의 휴가</button>
									</li>
								</ul>
								
								<!-- Tap content -->
								<div class="tab-content mt-2" id="mailTabContent">
									
									<!--============================= documents-tab============================================-->
									<div class="tab-pane fade show active" id="documents" role="tabpanel" aria-labelledby="documents-tab">
										
										<!-- 필터링바 -->
										<div class="dropdown d-flex justify-content-end">
											<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
										    	모든문서
										  	</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">모든문서</a></li>
										    	<li><a class="dropdown-item" href="#">대기</a></li>
										    	<li><a class="dropdown-item" href="#">진행</a></li>
										    	<li><a class="dropdown-item" href="#">승인</a></li>
										    	<li><a class="dropdown-item" href="#">반려</a></li>
										  	</ul>
										</div>		
										
										<!-- Table -->
										<table class="table table-hover">
											<thead>
												<tr bgcolor="#EFF4FC">
												    <th scope="col">문서번호</th>
												    <th scope="col">제목</th>
												    <th scope="col">기안자</th>
												    <th scope="col">기안일</th>
												    <th scope="col">상태</th>
											  	</tr>
											</thead>
											<tbody>
											  	<tr>
												    <th scope="row">1</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
												    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
											  	</tr>
											  	<tr>
											    	<th scope="row">2</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
											     	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
											  	</tr>
												<tr>
													<th scope="row">3</th>
												  	<td>휴가 신청</td>
												   	<td>김이사</td>
												   	<td>2023-02-10</td>
												   	<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
												</tr>
												<tr>
													<th scope="row">4</th>
													<td>휴가 신청</td>
													<td>김이사</td>
													<td>2023-02-10</td>
													<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
												</tr>
												<tr>
													<th scope="row">5</th>
													<td>휴가 신청</td>
													<td>김이사</td>
													<td>2023-02-10</td>
													<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
												</tr>
											
											</tbody>
										</table>
										
										<!-- 페이징 필터링 바 -->
										<div class="d-flex justify-content-center">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item">
													  <a class="page-link" href="#" aria-label="Previous">
													    <span aria-hidden="true">«</span>
													  </a>
													</li>
													<li class="page-item"><a class="page-link" href="#">1</a></li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item">
														<a class="page-link" href="#" aria-label="Next">
														  <span aria-hidden="true">»</span>
														</a>
													</li>
												</ul>
											</nav>
										</div>
									
									</div><!--=============================End documents-tab============================================-->
								
									<!--============================= my-tab============================================-->
									<div class="tab-pane fade" id="myvacation" role="tabpanel" aria-labelledby="my-tab">
									 	
									 	<!-- 휴가 현황 -->
									 	<div>
											<Strong>휴가 현황</Strong>
											<div class="row ">
												<div class="col-2 border-end">총 휴가 : 18일</div>
												<div class="col-2 border-end">사용 휴가: 1일</div>
												<div class="col-3">잔여 휴가: 17일(잔여 연차)</div>
											</div>
										</div>
									  
									  	<!--대체휴가 현황 -->
										<div class="mt-5">
											<Strong>대체휴가 현황</Strong>
											<div class="row ">
												<div class="col-2 border-end">지급 : 7일</div>
												<div class="col-3">휴가 종류:경조사(결혼)</div>
											</div>
											
											<div class="row ">
												<div class="col-2 border-end">지급 : 90일</div>
												<div class="col-3">휴가 종류:경조사(출산)</div>
											</div>
										</div>
									
										<!-- 필터링바 -->
										<div class="dropdown d-flex justify-content-between mt-5 mb-2">
											<Strong >휴가 신청 목록</Strong>
											<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
											  모든문서
											</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">모든문서</a></li>
												<li><a class="dropdown-item" href="#">대기</a></li>
												<li><a class="dropdown-item" href="#">처리중</a></li>
												<li><a class="dropdown-item" href="#">처리완료</a></li>
											</ul>
										</div>	
									    
									  	<!-- Table -->
										<table class="table table-hover">
											<thead>
												<tr bgcolor="#EFF4FC">
													<th scope="col">문서번호</th>
													<th scope="col">제목</th>
													<th scope="col">기안자</th>
													<th scope="col">기안일</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody>
												<tr>
											    	<th scope="row">1</th>
											    	<td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
												    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
											  	</tr>
											    <tr>
												    <th scope="row">2</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
											     	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
											  	</tr>
											    <tr>
												    <th scope="row">3</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
												    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
											  	</tr>
											    <tr>
												    <th scope="row">4</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
											      	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
											  	</tr>
											    <tr>
												    <th scope="row">5</th>
												    <td>휴가 신청</td>
												    <td>김이사</td>
												    <td>2023-02-10</td>
												    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
											 	</tr>
											</tbody>
										</table>
										
										<!-- 페이징 필터링 바 -->
										<div class="d-flex justify-content-center">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item">
													  <a class="page-link" href="#" aria-label="Previous">
													    <span aria-hidden="true">«</span>
													  </a>
													</li>
													<li class="page-item"><a class="page-link" href="#">1</a></li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item">
														<a class="page-link" href="#" aria-label="Next">
														  <span aria-hidden="true">»</span>
														</a>
													</li>
												</ul>
											</nav>
										</div>
									
									</div>
									<!--=============================End my-tab============================================-->
								</div>
							</div>
						</div><!-- End Card -->
					</div>
				</div>
			</section>
		</main><!-- ======================================Main==================================================== -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>