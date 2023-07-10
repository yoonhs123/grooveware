<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% 50%;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	border-radius: 4px
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.winnerList-container {
	display: grid;
	grid-gap: 5px;
	grid-template-columns: repeat(4, auto);
}

.winnerList-container .item {
	border: 1px solid #333;
	border-radius: 3px;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.right-contentbody2 {
	width: 75%;
	position: absolute;
	left: 28%;
	padding: 3% 8%;
	background: #f3f3f34a;
}

.myForm .flexBox {
	display: flex;
	justify-content: space-between;
}

.approval-member {
	display: inline-block;
	width: 130px;
	height: 130px;
	padding: 3px;
	float: left;
}

.approval-member2 {
	display: inline-block;
	width: 90px;
	height: 130px;
	padding: 3px;
	float: left;
}

.approval-member label {
	display: block;
	width: 50px;
	height: 50px;
}

.approval-member img {
	display: block;
	width: 100%;
	height: 100%;
}

</style>


<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<div class="left-side-bar">

	<ul>
		<li><a href="${pageContext.request.contextPath}/approval/write">문서작성</a>
		</li>

            <li>
                <a>문서함</a>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=1">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=0">&nbsp;임시보관 문서</a>
                <a href="${pageContext.request.contextPath}/approval/listImportant?important=1">&nbsp;중요 문서</a>
            <li>
            
            
            <li>
                <a>결재함</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/1">&nbsp;대기문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/2">&nbsp;진행중 문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/3">&nbsp;반려문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/4">&nbsp;완료문서</a>
            <li>
	</ul>
</div>

<div class="left-menu" style="">

	<ul>
		<li><a href="#">즐겨찾기</a> <a
			href="${pageContext.request.contextPath}/approval/write"><i
				class="fa-regular fa-file-lines icon"></i>기안서</a> <a
			href="${pageContext.request.contextPath}/approval/writeHoliday"><i
				class="fa-regular fa-file-lines icon"></i>연차휴가</a>
		<li>
		<li><a href="#">일반 결재 문서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>계약확인서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>공문서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>기안서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>사유서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>시말서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>업무보고서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>업무협조전</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>위임장</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>인장요청서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>증명보고서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>인사발령</a>
		<li>
	</ul>
</div>


<div class="">
	<div class="right-contentbody2">
		<form name="myForm" method="post" class="myForm"
			enctype="multipart/form-data">
			<div class="board1">
				<div class="title_container">
					<table class="table" style="margin-bottom: 20px;">
						<tr>
							<td class="title2" width="15%">
								<h2>
									<span>|</span> 기안서
								</h2>
							</td>
							<td class="title" style="padding-left: 30px;">
										

								<button type="button" class="btn2"
									onclick="location.href='${pageContext.request.contextPath}/approval/list';">${mode=='update'?'수정취소':'등록취소'}</button>
								<button type="button" class="btn2"
									onclick="submitContents(this.form, 0);">임시저장</button>
								<button type="button" class="btn2"
									onclick="submitContents(this.form, 1);">제출</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="line_container" style="height: 200px;">
					<div class="table" style="margin-bottom: 15px;">
						<div>
							<div class="title" style="float: left; width: 100%;">
								<span>결재라인</span>
							</div>
						</div>
							<div style="width: 100%; float: left;">
								<div id="forms-receiver-list">
									<button type="button" class=" btn btnReceiverDialog"
										style="margin-top: 30px;">추가</button>

									<c:if test="${mode=='update'}">
										<c:forEach var="vo" items="${listApproval}" varStatus="status">
											<c:choose>
												<c:when test="${not empty listApproval}">
													<span class="approval-member">  
														<div class="img_container">
															<img src="${pageContext.request.contextPath}/resources/images/${vo.emp_picture}"  />
														</div> 
														<span style="font-weight: normal; word-break: keep-all;"></span>
														<div style="width: 100%; float: left;">
															<div class="text_box3">${vo.emp_name }
																<span style="font-weight: normal;">&nbsp;${vo.pos_name }</span>
																<div>${vo.dept_name }</div>
															</div>
															<div class="text_box4">&nbsp;</div>
														</div>
														<input type="hidden" name="emp_nos" value="${vo.emp_no}" />
														<input type="hidden" name="history_emp_nos" value="${vo.emp_no}" />
													</span>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:if>

								</div>
							</div>

					</div>
				</div>


			</div>
			<div class="board3">
				<div class="line_container2">
					<div>
						<div>
							<div>
								<label>제목 </label>
							</div>
							<p class="ap_pBox">
								<input type="text" name="doc_name" class="form-control1"
									style="width: 100%;" value="${dto.doc_name }">
							</p>
						</div>

						<div>
							<div class="flexBox">
								<div class="leftBox" style="margin-right: 55px">
									<label>기안구분 </label>
								</div>
								<div class="leftBox">
									<label>긴급여부 </label>
								</div>
							</div>
							<div class="flexBox">

								<div class="leftBox">
									<p class="ap_pBox">
										<label for="draft1"> <input type="radio"
											name="draft_category" id="draft1" checked value="0"
											${dto.draft_category == 0 ? 'checked' : ''} />품의서
										</label> <label for="draft2"> <input type="radio"
											name="draft_category" id="draft2" value="1"
											${dto.draft_category == 1 ? 'checked' : ''} />기안서
										</label>
									</p>
								</div>
								<div class="leftBox">
									<p class="ap_pBox">
										<label for="draft1"> <input type="radio" name="urgent"
											id="draft1" checked value="0"
											${dto.urgent == 0 ? 'checked' : ''} />일반
										</label> <label for="draft2"> <input type="radio"
											name="urgent" id="draft2" value="1"
											${dto.urgent == 1 ? 'checked' : ''} />긴급
										</label>
									</p>
								</div>
							</div>

							<div class="flexBox">
								<div class="leftBox">
									<label>기안일자 </label>
								</div>
								<div class="leftBox">
									<label>처리기한 </label>
								</div>
							</div>
							<div class="flexBox ap_pBox">

								<div class="leftBox">
									<p>
										<input type="date" name="draft_date" class="form-control1"
											value="${dto.draft_date }" />
									</p>
								</div>
								<div class="leftBox">
									<input type="date" name="draft_deadline" class="form-control1"
										value="${dto.draft_deadline }" />
								</div>

							</div>

							<div class="flexBox">
								<div class="leftBox">
									<label>기안부서 </label>
								</div>
								<div class="leftBox">
									<label>기안담당 </label>
								</div>
							</div>
							<div class="flexBox ap_pBox">
								<div class="leftBox">
									<input type="text" name="" class="form-control1"
										readonly="readonly" value="${sessionScope.member.dept_name}" />
								</div>
								<div class="leftBox">
									<input type="text" name="" class="form-control1"
										readonly="readonly" value="${sessionScope.member.emp_name}" />
								</div>
							</div>

						</div>
						<div class="leftBox">
							<label>내용 </label>
						</div>
						<textarea name="draft_content" id="ir1" class="form-control"
							style="width: 93%; padding: 7px 5px; height: 400px;">${dto.draft_content}</textarea>
					</div>
				</div>
			</div>
			<div class="board1">
				<div class="file_container">
					<div>
						<div class="title3">
							<span> 첨부파일</span>
						</div>
					</div>
					<div class="file_container2">
						<div class="table table-border table-form">
							<div>
								<input type="file" name="selectFile" multiple="multiple"
									class="form-control1">
							</div>

							<c:if test="${mode=='update'}">
								<c:forEach var="vo" items="${listFile}">
									<div id="f${vo.file_no}" class="img-box">
										<div>
											<a href="javascript:deleteFile('${vo.file_no}');"> <i
												class="fa-solid fa-trash-can"></i>
											</a> ${vo.original_filename}
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="board4 confirm">
				<input type="hidden" name="doc_status" value="${dto.doc_status }">
				<button type="button" class="btn2"
					onclick="location.href='${pageContext.request.contextPath}/approval/list';">${mode=='update'?'수정취소':'등록취소'}</button>
	
				<button type="button" class="btn2"
					onclick="submitContents(this.form, 0);">임시저장</button>
				<button type="button" class="btn2"
					onclick="submitContents(this.form, 1);">제출</button>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="doc_no" value="${dto.doc_no}">
					<input type="hidden" name="page" value="${page}">
					
				</c:if>

			</div>
		</form>
	</div>

</div>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});

	function submitContents(elClickedObj, doc_status) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			if (!check()) {
				return;
			}

			elClickedObj.doc_status.value = doc_status;

			elClickedObj.submit();

		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움 ';
		var nFontSize = 12;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>


<!-- 모달 -->
<div id="myDialogModal" class="modal">
	<div class="modal-content">
		<form name="nameForm" method="post">
			<div style="border-bottom: 1px solid #ced4da; padding-bottom: 10px;">
				<button type="button" class="btn btnClose" style="float: right;">
					<span class="close">&times;</span>
				</button>
				<h3 style="margin-bottom: 20px;">이름 검색</h3>
				<input type="text" name="keyword" id="keyword"
					placeholder="이름을 입력하세요" class="form-control" style="height: 26px;">
				<button type="button" class="btn btnReceiverFind">검색</button>
			</div>
			<table class="table table-border table-form">
				<tbody>
					<tr>
						<td height="50%">
							<div
								style="height: 150px; border: 1px solid black; border-radius: 4px"
								class="dialog-receiver-list">
								<ul></ul>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right">
							<button type="button" class="btn btnAdd">추가</button>
							<button type="button" class="btn btnClose">닫기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<script type="text/javascript">
	<c:if test="${mode=='update'}">
	function deleteFile(file_no) {
		let url = "${pageContext.request.contextPath}/approval/deleteFile";
		$.post(url, {
			file_no : file_no
		}, function(data) {
			$("#f" + file_no).remove();
		}, "json");
	}
	</c:if>
</script>

<script type="text/javascript">
	function check() {
		const f = document.myForm;
		let str;

		str = f.doc_name.value.trim();
		if (!str) {
			alert("제목을 입력하세요. ");
			f.doc_name.focus();
			return;
		}

		str = f.draft_deadline.value.trim();
		if (!str) {
			alert("처리기한을 입력하세요. ");
			f.draft_deadline.focus();
			return;
		}
		str = f.draft_content.value;
		if (!str || str === "<p><br></p>") {
			alert("내용을 입력하세요. ");
			f.draft_content.focus();
			return false;
		}
		
		<c:if test="${mode=='update'}">
		if($("#forms-receiver-list input[name=emp_nos]").length === 0) {
			alert("결재할 사원를 추가하세요. ");
			return;
		}
		</c:if>
		
		f.action = "${pageContext.request.contextPath}/approval/${mode}";
		return true;
	}
</script>

<script>
	function login() {
		location.href = "${pageContext.request.contextPath}/member/login";
	}

	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status === 403) {
					login();
					return false;
				} else if (jqXHR.status === 400) {
					alert("요청 처리가 실패했습니다.");
					return false;
				}

				console.log(jqXHR.responseText);
			}
		});
	}

	$(function() {
	    $(".btnReceiverDialog").click(function() {
	        $("#keyword").val("");
	        $(".dialog-receiver-list ul").empty();
	        $("#myDialogModal").show();
	    });

	    // 대화상자 - 사원 검색 버튼
	    $(".btnReceiverFind").click(function() {
	        let keyword = $("#keyword").val();
	        if (!keyword) {
	            $("#keyword").focus();
	            return false;
	        }

	        let url = "${pageContext.request.contextPath}/approval/listMember";
	        let query = "keyword=" + encodeURIComponent(keyword);

	        const fn = function(data) {
	            $(".dialog-receiver-list ul").empty();
	            searchListMember(data);
	        };
	        ajaxFun(url, "get", query, "json", fn);
	    });

	    function searchListMember(data) {
	        console.log(data)
	        let s;
	        for (let i = 0; i < data.listMember.length; i++) {
	            let emp_name = data.listMember[i].emp_name;
	            let emp_no = data.listMember[i].emp_no;
	            let pos_name = data.listMember[i].pos_name;
	            let dept_name = data.listMember[i].dept_name;
	            let emp_picture = data.listMember[i].emp_picture;

	            s = "<li style='padding: 5px 0px 3px 10px'><input type='checkbox' style='margin-right: 5px;' class='form-check-input' data-emp_no='" + emp_no + "' data-emp_picture='" + emp_picture + "' title='" + emp_no + "'><span>" + emp_name + " " + pos_name + "<span>" + " (" + "</span>";
	            s += "<span>" + dept_name + ")" + "</span></li>";
	            $(".dialog-receiver-list ul").append(s);
	        }
	    }

	    // 대화상자-결재자 추가 버튼
	    $(".btnAdd").click(function() {
	        let len1 = $(".dialog-receiver-list ul input[type=checkbox]:checked").length;
	        let len2 = $("#forms-receiver-list input[name=emp_nos]").length;
	        if (len1 === 0) {
	            alert("추가할 사람을 먼저 선택하세요.");
	            return false;
	        }
	        if (len1 >= 2) {
	            alert("결재자는 한 명만 선택하세요.");
	            return false;
	        }

	        if (len1 + len2 >= 4) {
	            alert("결재자는 최대 3명까지만 가능합니다.");
	            
	            return false;
	        }


	        let b = false;
	        $(".dialog-receiver-list ul input[type=checkbox]:checked").each(function() {
	            let emp_no = $(this).attr("data-emp_no");
	            let emp_picture = $(this).attr("data-emp_picture") != "" ? $(this).attr("data-emp_picture") : "user.png";
	            let emp_name = $(this).next("span").text();
	            let pos_name = $(this).next("span").next("span").text();
	            let dept_name = $(this).next("span").next("span").next("span").text();

	            $("#forms-receiver-list input[name=emp_nos]").each(function() {
	                if ($(this).val() === emp_no) {
	                    alert("이미 등록된 결재자입니다.");
	                    b = true;
	                    return false;
	                }
	            });

	            if (!b) {
	                let s = "";
	                s += "<span class='approval-member'>";
	                s += "<div class='img_container'><img src='${pageContext.request.contextPath}/resources/images/" + emp_picture + "' style='width: 100%; height: 100%;'></div>";
	                s += "<span style='font-weight: normal; word-break: keep-all;'>" + emp_name + "</span></span>";
	                s += "<input type='hidden' name='emp_nos' value='" + emp_no + "'>";

	                $("#forms-receiver-list").append(s);
	            }
	        });


	   
	        $("#myDialogModal").hide();
	    });

	    $(".btnClose").click(function() {
	        $("#myDialogModal").hide();
	    });

	    var mode = "${mode}"; 
        if (mode === "write") {
        	
		    $("body").on("click", ".approval-member", function() {
		        if (!confirm("해당 사원을 제외 하시겠습니까?")) {
		            return false;
		        }
	 
		        $(this).remove();
	 
		    });
        }

        	
	  
	});
</script>



<script type="text/javascript">
    $(function() {
        var mode = "${mode}"; 

        if (mode === "update") {
            $("body").on("click", ".approval-member", function() {
            	
            	 if (!confirm("해당 사원을 제외 하시겠습니까?")) {
     	            return false;
     	         }
            	 
                var $approval_member = $(this);
                var emp_nos = $approval_member.find("input[name='emp_nos']").val();

                console.log(emp_nos);

                var url = "${pageContext.request.contextPath}/approval/deleteMember?page=${page}&doc_no=${dto.doc_no}&emp_no="+emp_nos;
                $.post(url, { emp_nos: emp_nos }, function(data) {
                    $approval_member.remove();

                }, "json");
            });
        }
        
     
    });
</script>

