<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <div class="mybody">
   		<div class="board-insaManage-home">
   			<div class="title_container">
   				<table class="table" style="margin-bottom: 20px">
   					<tr>
   						<td class="title"> <h2><i class="bi bi-person-fill"></i>인사관리</h2>
   						<td align="right">
   							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} > 이름 </option>
									<option value="m_id"  ${condition == "m_id" ? "selected='selected'" : ""} > 사원번호 </option>
									<option value="dept"  ${condition == "dept" ? "selected='selected'" : ""} > 부서 </option>
									<option value="position"  ${condition == "position" ? "selected='selected'" : 	""} > 직위 </option>
								</select>
								<input type="text" name="keyword" value="" class="insaManageHome">
								<button type="button" class="btn-insaManage-home" onclick="searchList();">검색</button>
							</form>
						</td>
   					</tr>
   				</table>
   				<table class="table table-border table-list insa-home">
   					<thead>
   					<tr>
   						<th> 번호 </th>
   						<th width="10%"> 사원번호 </th>
   						<th width="5%"> 부서 </th>
   						<th width="5%"> 성명 </th>
   						<th width="5%"> 직위 </th>
   						<th width="5%"> 직책 </th>
   						<th width="15%"> 소속회사 </th>
   						<th width="10%"> 담당업무 </th>
   						<th width="14%"> 입사일 </th>
   						<th width="15%"> 퇴사일 </th>
   						<th width="12%"> 관리 </th>
   					</tr>
   					</thead>
   					
   					<tbody>
   						<tr>
   							<td> 1 </td>
   							<td> 00000001 </td>
   							<td> 인사 </td>
   							<td> 김부장 </td>
   							<td> 부장 </td>
   							<td> 팀장 </td>
   							<td> WHOIS WORKS </td>
   							<td> - </td>
   							<td> 2013.07.03 </td>
   							<td> - </td>
   							<td>
							  <div class="more">
							    <div class="more-menu">
							      <h3 class="dropdown-menu">
							        <i class="bi bi-three-dots-vertical"></i>
							        +
							      </h3>
							      <div class="dropdown-content">
							      	<a href="#"><i class="bi bi-person-fill"></i> 인사관리</a>
							        <a href="#"><i class="bi bi-person-vcard"></i> 인사기록카드</a>
							        <a href="#"><i class="bi bi-person-x-fill"></i> 퇴사</a>
							      </div>
							    </div>
							  </div>
							</td>
   						</tr>
   					</tbody>
   				
   				</table>
   				<div class="page-navigation">
   				1 2 3
   				</div>
   			</div>
   		</div>
   </div>