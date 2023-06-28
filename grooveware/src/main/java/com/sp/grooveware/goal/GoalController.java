package com.sp.grooveware.goal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller("goal.goalController")
@RequestMapping("/goal/*")
public class GoalController {

    @Autowired
    private GoalService goalService;

    @RequestMapping(value = "list")
    public String list() {
    	
    	
    	return ".goal.list";
    }
    
    
    @PostMapping("/add")
    @ResponseBody
    public String addGoal(@RequestParam("goalName") String goalName, @RequestParam("topGoalNo") int topGoalNo) {
        Goal goal = new Goal();
        goal.setGoalName(goalName);
        goal.setTopGoalNo(topGoalNo);
        goalService.addGoal(goal);

        return "<li>" + goal.getGoalName() + "</li>";
    }

    /*
    @PostMapping("/addsubgoal")
    @ResponseBody
    public String addSubgoal(@RequestParam("goalNo") int goalNo, @RequestParam("subgoalName") String subgoalName) {
        Subgoal subgoal = new Subgoal();
        subgoal.setSubgoalName(subgoalName);
        subgoal.setGoalNo(goalNo);
        goalService.addSubgoal(subgoal);

        return "<li>" + subgoal.getSubgoalName() + "</li>";
    }
    
    */

    @PostMapping("/delete")
    @ResponseBody
    public void deleteGoal(@RequestParam("goalNo") int goalNo) {
        goalService.deleteGoal(goalNo);
    }

    @PostMapping("/deletesubgoal")
    @ResponseBody
    public void deleteSubgoal(@RequestParam("goalNo") int goalNo, @RequestParam("subgoalNo") int subgoalNo) {
       // goalService.deleteSubgoal(goalNo, subgoalNo);
    }
}