<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v6.3.0/css/all.css">

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style type="text/css">

*, *::after, *::before {
    box-sizing: border-box;
}


* {
    padding: 0;
    margin: 0;
}

body {
   font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
   font-size: 14px;
   color: #222222;
}

.container {
	max-width : 1500px;
}

header {
   width : 100%;
   height : 50px;
   display : block;
   z-index: 999;
   position: fixed;
   top: 0;
   left: 0;
}


li, ul {
   list-style: none;
}

.main-body{
	width : 100%;
   padding-top: 49px;
	min-height: 800px;
   position: relative;
}

.main-menu {
   border-collapse : collapse;
   width: 100%;
   height : 100%;
   display: flex;
   justify-content: flex-start;
   position: relative;
   background: #3039a6;
   border : 1px solid black;
}

.main-menu li {
   display : flex;
   align-items : center;
   justify-content: center;
   width: 100px;
}

.main-menu li a {
    color: white;
    text-decoration: none;
}

a {
    color: inherit;
    text-decoration: none;
}


.left-side-bar {
    background: white;
    width: 250px;
    border: 1px solid black;
    float: left;
    position : fixed;
    height : 680px;
    z-index: 998;
    left: 0;	
}

.left-side-bar ul {

    text-align: left;
    padding: 0;
}

.left-side-bar ul > li > a {
    display: block;
    padding: 10px;
    white-space: nowrap;
    margin-top : 3px;
}


.left-side-bar ul > li > a:hover {
    color: white;
    background-color: black;
}

.left-side-bar ul > li > a:first-child {
    font-weight: bold;
}

.main-menu li:last-child {
   width : 150px;
   margin-left: auto;
}

.right-contentbody {
	height : 100%;
	width : 1250px;
   position:absolute;
   left : 250px;
}


/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

/* board */
.board { margin: 20px auto; padding: 40px; width: 100%; }

.title { font-size: 20px; font-weight: bold; padding: 13px 0; }

.table-list thead > tr { background: #f8f9fa; }
.table-list th, .table-list td { text-align: center; }
.table-list td:nth-child(5n+2) {  padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

/* paginate */
.page-navigation { clear: both; padding: 20px 0; text-align: center; }

.paginate {
	text-align: center;
	white-space: nowrap;
	font-size: 14px;	
}
.paginate a {
	border: 1px solid #ccc;
	color: #000;
	font-weight: 600;
	text-decoration: none;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate a:hover, .paginate a:active {
	color: #6771ff;
}
.paginate span {
	border: 1px solid #e28d8d;
	color: #cb3536;
	font-weight: 600;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate :first-child {
	margin-left: 0;
}

.btn {
	color: black;
	border: 1px solid #999999;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	line-height: 15px;
	background-color: white;
}
input[type=text]{
    width: 300px;
    height: 23px;
}

.form-select{ height: 23px;}

</style>

</head>
<body>

<div class="container body-container">



<header>
      <ul class="main-menu">
         
         <li style="width: 250px; color: white;"> 회사 이름 정하기 </li>
         
         <li><a href="#"><i class="fa-solid fa-person-circle-check"></i>전자결재</a></li>
         <li><a href="#"><i class="fa-solid fa-person"></i>인사정보</a></li>
         <li><a href="#"><i class="fa-solid fa-person"></i>인사관리</a></li>
         <li><a href="#"><i class="fa-solid fa-list-check"></i>업무관리</a></li>
         <li><a href="#"><i class="fa-solid fa-calendar-check"></i>일정관리</a></li>
         <li><a href="#"><i class="fa-solid fa-lightbulb"></i>공지사항</a></li>
         <li><a href="#">마이페이지</a></li>
         <li><a href="#"><i class="fa-solid fa-arrow-right-from-bracket"></i></a></li>
      </ul>
</header>

<main class="main-body">
<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="#">문서함</a>
                <a href="#">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="#">&nbsp;임시보관 문서</a>
            <li>
            
            <hr>
            
            <li>
                <a href="#">결재함</a>
                <a href="#">&nbsp;대기</a>
                <a href="#">&nbsp;진행중</a>
                <a href="#">&nbsp;보류</a>
                <a href="#">&nbsp;반려</a>
                <a href="#">&nbsp;완료</a>
            <li>
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="board">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td  class="title" > <h3><span>|</span> 내문서</h3> 
						</td>
						<td  class="title" > <button type="button" class="btn" onclick="searchList();">보관함 이동</button>
														<button type="button" class="btn" onclick="searchList();">다운로드</button>
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >작성자</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >제목</option>
									<option value="content"  ${condition == "content" ? "selected='selected'" : ""} >내용</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="5%;">
							<input type="checkbox" name="chkAll" value="all"> 
						</th> 
						<th> 문서번호 </th>
						<th> 문서종류 </th>
						<th width="50%;"> 제목 </th>
						<th> 작성자 </th>
						<th> 날짜 </th>
						<th> 상태 </th>
		 
					</tr>
				</thead>
				
				<tbody>
						<tr>
							<td>
								<input type="checkbox" name="" value=" ">
							</td>					
							<td>2020-05-0A-00000142</td>
							<td>기안서</td>
							<td>
								<a href=" ">22년도 상반기 영업 매출의 보고</a>
							</td>
							<td>김민교</td>
							<td>2020-05-15(목) 11:30</td>
							<td>승인대기</td>
						</tr>
				<tbody>
				
			</table>
	
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
	
			</div>
		</div>
	
</main>
</div>
</body>
</html>
