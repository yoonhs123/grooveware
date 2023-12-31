<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome/css/all.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/css/highcharts.css" type="text/css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insaInfo.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insaManage.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paginate.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/holidayManageList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/surveyList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myInsa.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workManageList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workManageArticle.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/archive.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/locales-all.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/highcharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/modules/sankey.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/modules/organization.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/modules/exporting.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/Highcharts/code/modules/accessibility.js"></script>
	
</head>

<body>

	<div class="container body-container">
		<tiles:insertAttribute name="header"/>
		
		<main class="main-body">
			<tiles:insertAttribute name="body"/>
		</main>
	
	</div>

</body>
</html>