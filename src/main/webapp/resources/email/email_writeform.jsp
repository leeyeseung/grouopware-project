<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>엑사아이엔티 그룹웨어</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  

  <!-- Favicons -->
  <link href="../assets/img/exaint_logo.png" rel="icon">
  
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  
  <!-- 텍스트 에디터 -->
  <!-- <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script> -->
  <script src="../../ckeditor/build/ckeditor.js"></script>
 
  <style>
     .ck-editor__editable { height: 400px; }
     .ck-content { font-size: 12px; }
  </style>
  
  

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Header ======= -->
  	<header id="header" class="header fixed-top d-flex align-items-center">

    	<div class="d-flex align-items-center justify-content-between">
      		<img src="../assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="../index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	</div><!-- End Logo -->
    
		<!-- Dropbar -->
		<div class="menudropbar d-flex align-items-center justify-content-between">
      		<select onchange="if(this.value) location.href=(this.value);" class="form-select" aria-label="Default select example">
        		<option value="index2.html">오피스 홈</option>
        		<option value="vacation_document.html">근태관리</option>
        		<option value="hr.html">인사</option>
        		<option value="approval_list.html">전자결재</option>
        		<option value="email/email_list.html" selected>메일</option>
        		<option value="#">공지사항</option>
      		</select>
    	</div><!-- End Dropbar -->
    
    	<nav class="header-nav ms-auto">
      		<ul class="d-flex align-items-center">
        		<li><img src="../assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" width="40px"></li>
        		<li class="nav-item dropdown pe-4">
          			<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            			<span class="d-none d-md-block dropdown-toggle ps-2" style="font-size: 18px;">이지호</span>
          			</a>
          			<span class=" ps-2">공공사업1 Div / 솔루션 개발팀</span>
          			<!-- End Profile Iamge Icon -->
          			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            			<li class="dropdown-header">
              				<h6>이지호</h6>
              				<span>공공사업1 Div / 솔루션 개발팀</span>
            			</li>
            			<li>
              				<hr class="dropdown-divider">
            			</li>
            
            			<li>
              				<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                				<i class="bi bi-person"></i>
                				<span>My Profile</span>
              				</a>
            			</li>
            			<li>
              				<hr class="dropdown-divider">
            			</li>

			            <li>
			              	<a class="dropdown-item d-flex align-items-center" href="#">
				                <i class="bi bi-box-arrow-right"></i>
				                <span>Sign Out</span>
			              	</a>
			        	</li>
          			</ul><!-- End Profile Dropdown Items -->
        		</li><!-- End Profile Nav -->
      		</ul>
    	</nav><!-- End Icons Navigation -->
  	</header><!-- End Header -->
  
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

  <main id="main" class="main ">
	<section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h2 class="card-title"><b>메일 작성</b></h2>

              <!-- General Form Elements -->
              <form enctype="multipart/form-data">
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">받는 사람</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="receiver">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="title">
                  </div>
                </div>
                
                <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">중요 메일</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="important">
                      <label class="form-check-label" for="gridCheck1">
                      	중요
                      </label>
                    </div>
                  </div>
                </fieldset>
                
                <div class="row mb-3">
                
                  <div class="insert">
        
                  <label class="btn btn-primary btn-sm mb-2" for="input-file">
  						파일선택
				</label>
		        	<input id="input-file" type="file"  onchange="addFile(this);" style="display:none" multiple />
			        <div class="file-list"></div>
				</div>
                </div>
                
                <div class="row mb-3">
                  <div class="col-sm-12">
                    <textarea rows="5" cols="50" id="email-text" name="email-text" style="height:400px;"></textarea>
                    
                    <script>
	                    ClassicEditor
	                    .create(document.querySelector('#email-text'))
	                    .catch(error => {
	                        console.error(error);
	                    });
					</script>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-sm-12" style="text-align:center">
                    <button type="submit" class="btn btn-secondary">임시저장</button>
                    <button type="submit" class="btn btn-primary">보내기</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>
        </div>
      </div>
    </section>
    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/js/jquery.js"></script>
  <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../assets/vendor/echarts/echarts.min.js"></script>
  <script src="../assets/vendor/quill/quill.min.js"></script>
  <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  
   <!-- 파일 다중 업로드  -->
  <script src="../assets/js/file.js"></script>
  
  

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>