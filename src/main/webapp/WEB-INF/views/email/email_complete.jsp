<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
	<body>
	  <%@ include file="/WEB-INF/views/common/header.jsp" %>
 
	  <!-- ======= Sidebar ======= -->
	  <aside id="sidebar" class="sidebar">
	
	    <ul class="sidebar-nav" id="sidebar-nav">
	
	      <li class="nav-item">
	        <a class="btn btn-primary" type="button" href="index.html" style="width:100%">
	          <i class="bi bi-pencil-square"></i> 
	          <span>메일 작성</span>
	        </a>
	      </li><!-- End Dashboard Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed"  href="#">
	          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
	        </a>
	      </li><!-- End Charts Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed " data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="icons-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="#" class="active">
	              <span>미수신 메일</span>
	            </a>
	          </li>
	          <li>
	            <a href="#">
	              <span>수신 메일</span>
	            </a>
	          </li>
	        </ul>
	      </li><!-- End Icons Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="#">
	          <i class="bi bi-star-fill"></i>
	          <span>중요 메일함</span>
	        </a>
	      </li><!-- End Profile Page Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="#">
	          <i class="bi bi-envelope-exclamation"></i>
	          <span>임시저장함</span>
	        </a>
	      </li><!-- End Contact Page Nav -->
	      
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="#">
	          <i class="bi bi-trash3-fill"></i>
	          <span>휴지통</span>
	        </a>
	      </li><!-- End Contact Page Nav -->
	
	    </ul>
	
	  </aside><!-- End Sidebar -->
	
	  <main id="main" class="main">
	
	    <section class="section dashboard">
	      <div class="row">
	
	        <!-- Left side columns -->
	        <!-- 
	        <div class="col-lg-2" style="border-right: 1px solid black;">
	          <div class="row">
	            
	            <div class="col-12">
	              <div>
	              	
	              </div>
	            </div>
	          </div>
	        </div> 
	        -->
	        <!-- End Left side columns -->
	
	        <!-- Right side columns -->
	        
	        	<div class="col-lg-12" >
		         	<div class="card">
		            	<div class="card-body"style="padding-top:200px;padding-bottom:250px">
			        		<div style="text-align:center">
				         		<i class="bi bi-envelope" style="font-size:100px"></i>
				         		<i class="bi bi-list-nested" style="font-size:100px"></i>
			         		</div>
			         		<div style="text-align:center">
			         			<p style="color:grey;font-size:14px">메일이 성공적으로 발송되었습니다!</p>
			         		</div>
			         		<div class="mx-auto" style="width:100px;">
			                	<button class="btn btn-primary w-100" type="submit" style="display:inline-block">홈으로</button>
			            	</div>
				    	</div>
				  	</div>
				</div>
	      </div><!-- End Right side columns -->
	    </section>
	  </main><!-- End #main -->
	
	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	</body>

</html>