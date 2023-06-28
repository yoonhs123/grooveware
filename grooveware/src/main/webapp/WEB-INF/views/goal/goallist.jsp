<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <style type="text/css">
 /* 부모 컨테이너에 플렉스를 적용하여 요소들을 세로 방향으로 정렬합니다. */
#goalList {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

/* 각 목표 아이템을 감싸는 li 요소에 스타일을 적용합니다. */
#goalList li {
  margin-bottom: 10px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
}

/* 목표 이름을 감싸는 span 요소에 스타일을 적용합니다. */
#goalList li span {
  font-weight: bold;
}

/* 목표 추가 입력 폼을 감싸는 div 요소에 스타일을 적용합니다. */
#addGoalForm {
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
}

/* 목표 추가 입력 폼의 라벨 스타일을 적용합니다. */
#addGoalForm label {
  margin-bottom: 5px;
}

/* 목표 추가 입력 폼의 버튼 스타일을 적용합니다. */
#addGoalForm button {
  margin-top: 5px;
  padding: 5px 10px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#addGoalForm button:hover {
  background-color: #c0c0c0;
}

/* 하위 목표 목록을 감싸는 ul 요소에 스타일을 적용합니다. */
ul[id^="subgoal_"] {
  margin-top: 5px;
  padding-left: 20px;
  list-style-type: none;
}

/* 하위 목표 아이템을 감싸는 li 요소에 스타일을 적용합니다. */
ul[id^="subgoal_"] li {
  margin: 5px 0;
}

/* 하위 목표 삭제 버튼에 스타일을 적용합니다. */
.deleteSubgoal {
  margin-left: 5px;
  padding: 2px 5px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.deleteSubgoal:hover {
  background-color: #c0c0c0;
}

label {
  display: inline-block;
  margin-bottom: 5px;
  font-weight: bold;
}

/* 목표 추가 입력 폼의 입력 필드 스타일을 적용합니다. */
input[type="text"] {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  width: 200px;
  margin-bottom: 10px;
}

/* 목표 추가 버튼의 스타일을 적용합니다. */
#addGoal {
  display: inline-block;
  padding: 5px 10px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#addGoal:hover {
  background-color: #c0c0c0;
}
 
 
 </style>
    <script>
        $(document).ready(function () {
            // 목표 추가
            $('#addGoal').click(function () {
                var goalName = $('#goalName').val();
                var topGoalNo = $('#topGoalNo').val();

                $.post('add', { goalName: goalName, topGoalNo: topGoalNo }, function (data) {
                    $('#goalList').append(data);
                    $('#goalName').val('');
                });
            });

            // 하위 목표 추가
            $(document).on('click', '.addSubgoal', function () {
                var goalNo = $(this).data('goal-no');
                var subgoalName = prompt('하위 목표 이름을 입력하세요.');

                if (subgoalName) {
                    $.post('addsubgoal', { goalNo: goalNo, subgoalName: subgoalName }, function (data) {
                        $('#subgoal_' + goalNo).append(data);
                    });
                }
            });

            // 목표 삭제
            $(document).on('click', '.deleteGoal', function () {
                var goalNo = $(this).data('goal-no');

                $.post('delete', { goalNo: goalNo }, function () {
                    $('#goal_' + goalNo).remove();
                });
            });

            // 하위 목표 삭제
            $(document).on('click', '.deleteSubgoal', function () {
                var goalNo = $(this).data('goal-no');
                var subgoalNo = $(this).data('subgoal-no');

                $.post('deletesubgoal', { goalNo: goalNo, subgoalNo: subgoalNo }, function () {
                    $('#subgoal_' + goalNo + '_' + subgoalNo).remove();
                });
            });
        });
    </script>


    <h1>목표 리스트</h1>

    <h2>목표 추가</h2>
    <label for="goalName">목표 이름:</label>
    <input type="text" id="goalName" name="goalName" required>

    <label for="topGoalNo">상위 목표 번호:</label>
    <input type="text" id="topGoalNo" name="topGoalNo">

    <button id="addGoal">추가</button>

    <h2>목표 목록</h2>
    <ul id="goalList">
        <!-- Thymeleaf를 사용하여 목표 목록을 동적으로 생성합니다. -->
        <c:forEach var="goal" items="${goalList}" varStatus="goalIndex">
            <li id="goal_${goalIndex.index}">
                <span>${goal.name}</span>
                <button class="deleteGoal" data-goal-no="${goalIndex.index}">삭제</button>
                <button class="addSubgoal" data-goal-no="${goalIndex.index}">하위목표 추가</button>
                <ul id="subgoal_${goalIndex.index}">
                    <!-- Thymeleaf를 사용하여 하위 목표 목록을 동적으로 생성합니다. -->
                    <c:forEach var="subgoal" items="${goal.subgoals}" varStatus="subgoalIndex">
                        <li id="subgoal_${goalIndex.index}_${subgoalIndex.index}">
                            <span>${subgoal.name}</span>
                            <button class="deleteSubgoal" data-goal-no="${goalIndex.index}" data-subgoal-no="${subgoalIndex.index}">삭제</button>
                        </li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>