<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
 
</style>
			<div>
			<div class="dContainer">

				<div class="item">
					<div class="desc-area commuteBox">
						<span class="title fontColor ">인사</span> <span class="title">&nbsp;출퇴근기록</span>
						<div class="commuteCon">
							<div class="center">2023.06.13(화)</div>
							<div style="font-size: 50px">14:40:35</div>
							<div class="center">
								<span>출근</span> <span class="bold" style="margin-right: 15px;">출근전</span>
								<span>퇴근</span> <span class="bold">퇴근전</span>
							</div>
						</div>
					</div>
					<div class="desc-area commuteBox2">
						<div class="divBox">
							<p class="title">출근하기</p>
							<i class="fa-solid fa-circle-arrow-right fa-2xl"
								style="float: right; width: 40px;"></i>
							<p style="margin-bottom: 10px;">Have a nice day</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="desc-area commuteBox">
						<span class="fontColor title" style="font-size: 18px;">내 휴가통계</span>

						<div style="margin-top: 30px;">
							<c:forEach var="n" begin="1" end="3">
								<div class="list-item">
									<div class="fontColor">연차휴가</div>
									<div class="minibox">총 15일 사용 1일 잔여 14일</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="desc-area commuteBox">
						<span class="fontColor title" style="font-size: 18px;">전자결재</span>

						<div style="margin-top: 30px;">
							<c:forEach var="n" begin="1" end="4">
								<div class="list-item">
									<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
									<div  class="minibox2">
									<span>문서 #2342345</span>
									<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
									</div>								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="desc-area commuteBox">
						<span class="fontColor title" style="font-size: 18px;">프로젝트 현황</span>

						<div style="margin-top: 30px;">
							<c:forEach var="n" begin="1" end="4">
								<div class="list-item">
									<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
									<div  class="minibox2">
									<span>문서 #2342345</span>
									<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="desc-area commuteBox">
						<span class="fontColor title" style="font-size: 18px;">전체 공지사항</span>

						<div style="margin-top: 30px;">
							<c:forEach var="n" begin="1" end="4">
								<div class="list-item">
									<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
									<div class="minibox">댓글 0 최고관리자 2023.06.05</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="desc-area commuteBox">
						<span class="fontColor title" style="font-size: 18px;">부서 공지사항</span>

						<div style="margin-top: 30px;">
							<c:forEach var="n" begin="1" end="4">
								<div class="list-item">
									<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
									<div  class="minibox2">
									<span>문서 #2342345</span>
									<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
									</div>								
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			</div>
