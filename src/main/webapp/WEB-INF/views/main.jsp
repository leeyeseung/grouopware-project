<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  	<script>
	  		$(document).ready(function() {
	  			/* 페이지 로드되면 로그인한 사원의 출근정보 가져오기 */
	  			$.ajax({
	  				url : "/webapp/attendanceinfo"
	  				
	  			}).done((data)=>{
	  				let status; 
	  				let clockIn;
	  				let clockOut;
	  				
	  				if(data.status == null){
	  					status = "미출근";
	  				} else{
	  					status = data.status;
	  				}
	  				
	  				if(data.clockIn == null){
	  					clockIn = "-- : -- : --";
	  				} else{
	  					clockIn = data.clockIn;
	  				}
	  				
	  				if(data.clockOut == null){
	  					clockOut = "-- : -- : --";
	  				} else{
	  					clockOut = data.clockOut;
	  				}
	  				 
	  				$("#status").html(status);
	  				$("#clockIn").html(clockIn);
	  				$("#clockOut").html(clockOut);
	  				
	  				/* 출근 정보에 따른 버튼 활성화 유무 */
	  				if(data.clockIn != null && data.clockOut == null){
		  				/* 출근o, 퇴근x
		  				퇴근버튼만 활성화 */
		  				const target1 = document.getElementById('btn-attendance');
						target1.disabled = true;
						target1.setAttribute( 'style', 'opacity: 0.1' )
						
						const target2 = document.getElementById('btn-leave');
						target2.disabled = false;
						target2.removeAttribute( 'style' )
	  				}	
	  					else if(data.clockIn != null && data.clockOut != null){
		  				/* 출근o, 퇴근o or status==휴가
		  				둘다 비활성화 */
		  				const target1 = document.getElementById('btn-attendance');
						target1.disabled = true;
						target1.setAttribute( 'style', 'opacity: 0.1' )
	  				}
	  				
	  			});
	  			
	  		});
	  	</script>
	  	
	  	<!-- menubar background -->
		<div class="row" style="height:300px; background-color:#EEF2F4">
			<div class="row"  style="margin-top:120px" >
				<div  style="padding:0 230px"  >
					
					<!-- menubar -->
					<div class="row">
						
						<div class="col"  >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center bg-light mx-auto" style="width:100px; height:100px">
								<i class=" bi bi-clock fs-1 " ></i>
							</div>
							<div style="text-align:center; margin-top:10px">근태관리</div>
						</div>
					
						<div class="col" >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center bg-light mx-auto" style="width:100px; height:100px">
								<i class=" bi bi-person-video fs-1 " ></i>
							</div>
							<div style="text-align:center;margin-top:10px">인사</div>
						</div>
					
						<div class="col" >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center bg-light mx-auto" style="width:100px; height:100px">
								<i class="bi bi-clipboard-check fs-1 " ></i>
							</div>
							<div style="text-align:center;margin-top:10px">전자결재</div>
						</div>
					
						<div class="col" >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center bg-light mx-auto" style="width:100px; height:100px">
								<i class=" bi bi-envelope-check fs-1 " ></i>
							</div>
							<div style="text-align:center;margin-top:10px">메일</div>
						</div>
					
						<div class="col" >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center bg-light mx-auto" style="width:100px; height:100px">
								<i class=" bi bi-bell fs-1 " ></i>
							</div>
							<div style="text-align:center;margin-top:10px">공지사항</div>
						</div>	
					
					</div><!-- End menubar -->
				</div>
			</div> 	
		</div>
		<!-- End menubar background -->
	  
		<!-- main content -->
		<div id="main" class="main bg-white" style="margin:0 200px">
			<section class="section dashboard">
				<div class="row">
					
					<!-- Left side columns -->
					<div class="col-lg-4">
						<!-- attendance Title -->
						<div class="pagetitle">
							<h1>근무확인</h1>
						</div>
			          	<!-- attendance Card -->
			          	<!-- 오늘의 날짜 & 현재 시간을 가져옴 -->
			          	<script>
				          	function setClock(){
				          	    var dateInfo = new Date(); 
				          	    var hour = modifyNumber(dateInfo.getHours());
				          	    var min = modifyNumber(dateInfo.getMinutes());
				          	    var sec = modifyNumber(dateInfo.getSeconds());
				          	    var year = dateInfo.getFullYear();
				          	    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
				          	    var date = dateInfo.getDate();
				          	    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
				          	    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
				          	}
				          	function modifyNumber(time){
				          	    if(parseInt(time)<10){
				          	        return "0"+ time;
				          	    }
				          	    else
				          	        return time;
				          	}
				          	window.onload = function(){
				          	    setClock();
				          	    setInterval(setClock,1000); //1초마다 setClock 함수 실행
				          	}
			          	</script>
			          	<div class="card info-card sales-card "  style="height:330px; ">
			           		<div class="card-body mt-4">
					            <div class="mb-3"> 
					            	<!-- 오늘날짜 -->
									<h5 id="date"></h5>
					            </div>
				                <div class="d-flex">
				                	<!-- 현재시간 -->
				                	<div><h2 id="time"></h2></div>
				                	<!-- 출근 상태 -->
				                	<div class="mt-2 mx-2"><span id="status" class="badge bg-danger"></span></div>
				                </div>
								
								<!-- 출퇴근 버튼 -->
								<div>
									<script>
									function setClock2(){
										console.log("setClock2() 실행");
						          	    var dateInfo = new Date(); 
						          	    var hour = modifyNumber1(dateInfo.getHours());
						          	    var min = modifyNumber1(dateInfo.getMinutes());
						          	    var sec = modifyNumber1(dateInfo.getSeconds());
						          	    document.getElementById("clockOut").innerHTML = hour + ":" + min  + ":" + sec;
						          	    console.log(hour);
						          	}
									function setClock1(){
						          	    var dateInfo = new Date(); 
						          	    var hour = modifyNumber1(dateInfo.getHours());
						          	    var min = modifyNumber1(dateInfo.getMinutes());
						          	    var sec = modifyNumber1(dateInfo.getSeconds());
						          	    document.getElementById("clockIn").innerHTML = hour + ":" + min  + ":" + sec;
						          	    console.log(hour);
						          	}
						          	function modifyNumber1(time){
						          	    if(parseInt(time)<10){
						          	        return "0"+ time;
						          	    }
						          	    else
						          	        return time;
						          	}
									function btnAtt(){
										console.log("btnAtt()실행")
										$.ajax({
											url:"/webapp/attendance"
											
										}).done((data)=>{
											console.log(data);
											$("#status").html(data.status);
											setClock1();
											
										});
										const target1 = document.getElementById('btn-attendance');
										target1.disabled = true;
										target1.setAttribute( 'style', 'opacity: 0.1' )
										
										const target2 = document.getElementById('btn-leave');
										target2.disabled = false;
										target2.removeAttribute( 'style' )
									}
									function btnLeave()  {
										console.log("btnLeave()실행")
										$.ajax({
											url:"/webapp/leave"
											
										}).done((data)=>{
											console.log(data);
											setClock2();
											
										});
										const target1 = document.getElementById('btn-leave');
										target1.disabled = true;
										target1.setAttribute( 'style', 'opacity: 0.1' )
									}
									</script>
									
									<div class="row">
										<!-- 출근하기 버튼 -->
										<div class="col border-end" style="text-align:center" >
											<input 
											id="btn-attendance"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/attbtn.png" 
											width="100"
											onclick="btnAtt()"
											/>
										    <div>출근하기</div> 
										    <div id="clockIn"></div>
										</div><!-- End 출근하기 버튼 -->
										
										<!-- 퇴근하기 버튼 -->
										<div class="col" style="text-align:center">
											<input 
											id="btn-leave"
											disabled 
											style="opacity: 0.1"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/leavebtn.png" 
											width="100"
											onclick="btnLeave()" 
											/>
											<div>퇴근하기</div>
											<div id="clockOut"></div>
										</div><!-- End퇴근하기 버튼 -->
									</div>
								
								</div><!-- End 출퇴근 버튼 -->
			            	
			            	</div>
		        		</div><!-- End attendance Card -->
					
							<!-- schedule Title -->
							<div class="pagetitle">
								<h1>캘린더</h1>
							</div>
							<!-- schedule Card -->
							<div class="card recent-sales overflow-auto">
								<div class="card-body">
									<div class="sec_cal">
										<div class="cal_nav">
											<a href="javascript:;" class="nav-btn go-prev">prev</a>
											<div class="year-month"></div>
											<a href="javascript:;" class="nav-btn go-next">next</a>
										</div>
									  
										<div class="cal_wrap">
											<div class="days">
												<div class="day">MON</div>
												<div class="day">TUE</div>
												<div class="day">WED</div>
												<div class="day">THU</div>
												<div class="day">FRI</div>
												<div class="day">SAT</div>
												<div class="day">SUN</div>
											</div>
											<div class="dates"></div>
										</div>
									</div>
								</div>
							</div>
						<!-- End attendance Card -->
					</div><!-- End Left side columns -->
					
					<!-- Right side columns -->
					<div class="col-lg-8">
						<!-- mail Title -->
						<div class="pagetitle">
							<h1>메일함</h1>
						</div>
						<!-- mail card -->
						<div class="card">
							<div class="card-body">
						        <!-- mail Tabs -->
							    <ul class="nav nav-tabs nav-tabs-bordered" id="mailTab" role="tablist">
								    <li class="nav-item" role="presentation">
								    	<button class="nav-link active" id="receive-tab" data-bs-toggle="tab" data-bs-target="#mail-receive" type="button" role="tab" aria-controls="receive" aria-selected="true">받은 메일함</button>
								    </li>
								    <li class="nav-item" role="presentation">
								    	<button class="nav-link" id="send-tab" data-bs-toggle="tab" data-bs-target="#mail-send" type="button" role="tab" aria-controls="send" aria-selected="false">보낸 메일함</button>
								    </li>
							    </ul>
						    	
						    	<!-- mail content -->
								<div class="tab-content pt-2" id="mailTabContent">
									
									<!-- 받은 메일함 -->
									<div class="tab-pane fade show active" id="mail-receive" role="tabpanel" aria-labelledby="receive-tab">
										<table class="table table-borderless datatable">
											
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">보낸사람</th>
													<th scope="col">내용</th>
													<th scope="col">Price</th>
													<th scope="col">Status</th>
												 </tr>
											</thead>
										  
											<tbody>
												<tr>
													<th scope="row"><a href="#">#2457</a></th>
													<td>Brandon Jacob</td>
													<td><a href="#" class="text-primary">At praesentium minu</a></td>
													<td>$64</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2147</a></th>
													<td>Bridie Kessler</td>
													<td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
													<td>$47</td>
													<td><span class="badge bg-warning">Pending</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2049</a></th>
													<td>Ashleigh Langosh</td>
													<td><a href="#" class="text-primary">At recusandae consectetur</a></td>
													<td>$147</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2644</a></th>
													<td>Angus Grady</td>
													<td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
													<td>$67</td>
													<td><span class="badge bg-danger">Rejected</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2644</a></th>
													<td>Raheem Lehner</td>
													<td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
													<td>$165</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
											</tbody>
										</table>
									</div><!-- End 받은 메일함 -->
									
									<!-- 보낸 메일함 -->
									<div class="tab-pane fade" id="mail-send" role="tabpanel" aria-labelledby="send-tab">
										<table class="table table-borderless datatable">
											
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">보낸 날짜</th>
													<th scope="col">Product</th>
													<th scope="col">Price</th>
													<th scope="col">Status</th>
												 </tr>
											</thead>
										  
											<tbody>
												<tr>
													<th scope="row"><a href="#">#2457</a></th>
													<td>Brandon Jacob</td>
													<td><a href="#" class="text-primary">At praesentium minu</a></td>
													<td>$64</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2147</a></th>
													<td>Bridie Kessler</td>
													<td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
													<td>$47</td>
													<td><span class="badge bg-warning">Pending</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2049</a></th>
													<td>Ashleigh Langosh</td>
													<td><a href="#" class="text-primary">At recusandae consectetur</a></td>
													<td>$147</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2644</a></th>
													<td>Angus Grady</td>
													<td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
													<td>$67</td>
													<td><span class="badge bg-danger">Rejected</span></td>
												</tr>
												<tr>
													<th scope="row"><a href="#">#2644</a></th>
													<td>Raheem Lehner</td>
													<td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
													<td>$165</td>
													<td><span class="badge bg-success">Approved</span></td>
												</tr>
											</tbody>
										</table>
									</div><!--End 보낸 메일함 -->
								</div><!--End mail content -->
							</div>
						</div><!--End mail Card --> 
					
					
						<!-- notice Title -->
						<div class="pagetitle">
							<h1>메일함</h1>
						</div>
						<!-- notice card -->
						<div class="card">
							<div class="card-body">
								<!-- notice Tabs -->
								<ul class="nav nav-tabs nav-tabs-bordered" id="noticeTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="home" aria-selected="true">공지사항</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="happy-tab" data-bs-toggle="tab" data-bs-target="#happy" type="button" role="tab" aria-controls="profile" aria-selected="false">사내 경조사</button>
									</li>
								</ul>
						
								<!-- notice content -->
								<div class="tab-content pt-2" id="noticeTabContent">
							
									<!-- 공지사항 -->
									<div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="notice-tab">
										<div class="news">
											<div class="post-item clearfix">
												<img src="${pageContext.request.contextPath}/resources/assets/img/news-1.jpg" alt="">
											    <h4><a href="#">공지사항</a></h4>
											    <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
											</div>
										
											<div class="post-item clearfix">
												<img src="${pageContext.request.contextPath}/resources/assets/img/news-2.jpg" alt="">
											    <h4><a href="#">Quidem autem et impedit</a></h4>
											    <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
											</div>
										
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-3.jpg" alt="">
											    <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
											    <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
											</div>
										
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-4.jpg" alt="">
											    <h4><a href="#">Laborum corporis quo dara net para</a></h4>
											    <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
											</div>
											
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-5.jpg" alt="">
											    <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
											    <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
											</div>
										
										</div>
									</div><!-- End 공지사항 -->
						
									<!-- 사내 경조사 -->
									<div class="tab-pane fade" id="happy" role="tabpanel" aria-labelledby="happy-tab">
										<div class="news">
											<div class="post-item clearfix">
												<img src="${pageContext.request.contextPath}/resources/assets/img/news-1.jpg" alt="">
											    <h4><a href="#">경사났다</a></h4>
											    <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
											</div>
										
											<div class="post-item clearfix">
												<img src="${pageContext.request.contextPath}/resources/assets/img/news-2.jpg" alt="">
											    <h4><a href="#">Quidem autem et impedit</a></h4>
											    <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
											</div>
										
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-3.jpg" alt="">
											    <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
											    <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
											</div>
										
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-4.jpg" alt="">
											    <h4><a href="#">Laborum corporis quo dara net para</a></h4>
											    <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
											</div>
											
											<div class="post-item clearfix">
											    <img src="${pageContext.request.contextPath}/resources/assets/img/news-5.jpg" alt="">
											    <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
											    <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
											</div>
										
										</div>
									</div><!--End 사내 경조사  -->
								</div><!--End notice content -->
							</div>
						</div><!--End notice Card --> 
					</div><!-- End Right side columns -->
				</div>
			</section>
		</div><!-- End #main -->
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	  	
	  	<!-- 추가한 링크 -->
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/schedule.js"></script>
	</body>
</html>