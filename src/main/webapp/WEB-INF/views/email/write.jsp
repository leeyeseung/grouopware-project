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
        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/email/receivelist">
          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
        </a>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed " data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
 	 	  <li>
            <a href="${pageContext.request.contextPath}/email/sendlist">
              <span>전체</span>
            </a>
          </li>
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

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>