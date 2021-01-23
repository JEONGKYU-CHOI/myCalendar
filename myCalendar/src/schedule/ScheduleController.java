package schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.Board;
import board.BoardService;
import board.Page;
import comment.CommentService;
import login.LoginService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService service;
	@Autowired
	private BoardService boardservice;
	@Autowired
	private CommentService commentservice;
	@Autowired
	private LoginService loginservice;
	
	@PostMapping("/afterLogin") 
	public String afterLogin(Model m, int num) {
		List<Schedule> sdList=service.getScheduleList(num); 
		m.addAttribute("sdList", sdList);
		m.addAttribute("num", num);
		return "afterLoginMyCalendar";
	}
	
	@GetMapping("/updateData")
	public String updateData(Model m, int id) {
		Schedule schedule=service.getScheduleById(id);
		m.addAttribute("schedule", schedule);
		return "updateDataForm";
	}
	
	@PostMapping("/updateResult")
	public String updateScheduleData(Model m, Schedule schedule) {
		int rs=service.updateSchedule(schedule);
		m.addAttribute("result", rs);
		return "updateResult";
	}
	
	
	@PostMapping("/deleteData")
	public String deleteScheduleData(Model m, int id) {
		int rs=service.deleteSchedule(id);
		m.addAttribute("result", rs);
		return "deleteResult";
	} 
	     
	@GetMapping("/insertData")
	public String insertData() {
		return "insertDataForm";
	}
	
	@PostMapping("/insertResult")
	public String insertScheduleData(Model m, Schedule schedule) {
		int rs=service.insertSchedule(schedule);
		m.addAttribute("result", rs);
		return "insertResult";
	}
	
	@GetMapping("/popup")
	public String popup() {
		return "popup";
	}
	
	@GetMapping("/send")
	public String popup2(Model m, int id) {
		Schedule schedule=service.getScheduleById(id);
		m.addAttribute("schedule", schedule);
		return "sendToMe";
	}
	
	@GetMapping("/showText")
	public String popup3(Model m, int id) {
		Schedule schedule=service.getScheduleById(id);
		m.addAttribute("schedule", schedule);
		return "showText";
	}

	@GetMapping("/listPage")
	public String selectBoardPage(Model m, @RequestParam(value = "num", defaultValue = "1")int num) {
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(boardservice.selectCount());
		
		List<Board> bList = boardservice.listPage(page.getDisplayPost(), page.getPostNum());
		
 		m.addAttribute("bList", bList);
	
// 		전부 page로 대체가능
//		m.addAttribute("pageNum", page.getPageNum());
//		
//		m.addAttribute("startPageNum", page.getStartPageNum());
//		m.addAttribute("endPageNum", page.getEndPageNum());
//		
//		m.addAttribute("prev", page.getPrev());
//		m.addAttribute("next", page.getNext());
		
		m.addAttribute("page", page);
		m.addAttribute("select", num);
		return "B.page";
	}       
	
}
