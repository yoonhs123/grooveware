<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="left-side-bar">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="#">&nbsp;휴가관리</a>
                <a href="#">&nbsp;휴가설정</a>
            </li>
        </c:when>
        <c:otherwise>
            <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
        </c:otherwise>
   	 	</c:choose>
	</ul>
</div>

<div class="right-contentbody">
	<div>
	<h1 style="padding-left: 50px;"> <i class="fa-solid fa-network-wired"></i> 조직도</h1>
	</div>
	
	<div>
		<div id="container"></div>
		<div style="float: right;">
			<button type="button" class="">부서추가</button>
		</div>
	</div>
	
</div>


<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/myInsa/organizationItem";
	
	$.getJSON(url, function(data){
		//let trees = [['우리그룹', 'GROOVEWARE'], ['GROOVEWARE', '1']];
		//let nodes = [{id: '우리그룹'}, {id: 'GROOVEWARE'}];
		let trees = [['우리그룹', '0'], ['0', '1']];
		let nodes = [{id: '우리그룹'}, {id: '0', title: 'GROOVEWARE'}];
		
		for(let i = 0; i < data.list.length; i++) {
			let item = data.list[i];
			
			let no = String(item.dept_no);
			let top_no = String(item.top_dept_no);
			let name = item.dept_name;
			
			let tree = [top_no, no];
			let node = {id:no, title:name};
			
			trees.push(tree);
			nodes.push(node);
		}
		
		console.log(trees);
		console.log(nodes);

		Highcharts.chart('container', {
		    chart: {
		        height: 600,
		        inverted: true
		    },

		    title: {
		        text: 'GROOVE WARE'
		    },

		    accessibility: {
		        point: {
		            descriptionFormat: '{add index 1}. {toNode.name}' +
		                '{#if (ne toNode.name toNode.id)}, {toNode.id}{/if}, ' +
		                'reports to {fromNode.id}'
		        }
		    },

		    series: [{
		        type: 'organization',
		        name: 'Highsoft',
		        keys: ['from', 'to'],
		        data: trees,
		        levels: [{
		            level: 0,
		            color: 'silver',
		            dataLabels: {
		                color: 'black'
		            },
		            height: 25
		        }, {
		            level: 1,
		            color: 'silver',
		            dataLabels: {
		                color: 'black'
		            },
		            height: 25
		        }, {
		            level: 2,
		            color: '#980104'
		        }, {
		            level: 4,
		            color: '#359154'
		        }],
		        nodes: nodes,
		        colorByPoint: false,
		        color: '#007ad0',
		        dataLabels: {
		            color: 'white'
		        },
		        borderColor: 'white',
		        nodeWidth: 65
		    }],
		    tooltip: {
		        outside: true
		    },
		    exporting: {
		        allowHTML: true,
		        sourceWidth: 800,
		        sourceHeight: 600
		    }

		});		
		
		
	});
});

</script>