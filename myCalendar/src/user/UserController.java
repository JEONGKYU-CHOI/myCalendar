package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	@GetMapping("/login")
	public String login(Model m) {
		return "loginForm";
	}
	
	@PostMapping("/loginProcess")
	@ResponseBody
	public List<User> loginProcess(Model m) {
		List<User> uList=service.getUserList();
		m.addAttribute("uList", uList);
		return uList;
	}
	
	@GetMapping("/loginProcess")
	public String getResult(Model m, String user) {
		User loginUser=service.getUserById(user);
		m.addAttribute("loginUser", loginUser);
		return "loginResult";
	}
	
	@GetMapping("/findId")
	public String find() {
		return "findIdForm";
	}
	
	@PostMapping("/findResult")
	public String findId(Model m, String email) {
		User findUser=service.getUserByEmail(email);
		m.addAttribute("findUser", findUser);
		return "findResult";
	}
	
	@GetMapping("/changePw")
	public String change() {
		return "changePwForm";
	}
	
	@PostMapping(value="/changeResult")
	public String changePwFirst(Model m, String id) {
		User selectUser=service.updateTogetUser(id);
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<10; i++){ 
			idx=(int)(charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String pw=sb.toString();
		m.addAttribute("selectUser", selectUser);
		m.addAttribute("password", pw);
		return "changeResult";
	}
	
	@PostMapping("/changePwResult")
	public String changePwSecond(Model m, User user) {
		int rs=service.updateUser(user);
		m.addAttribute("result", rs);
		return "loginForm";
	}
	
	@GetMapping("/kakaoLogin")
	public String kakaoLoginPage() {
		return "kakaoLogin";
	}
	
	
}
