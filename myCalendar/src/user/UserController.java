package user;
//수정본

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.ParseInfo;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//아이디 중복체크 컨트롤러
	@RequestMapping(value="/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		return userService.userIdCheck(id);
	}
	
	//01 회원가입 컨트롤러 - 회원 등록 페이지로 이동함.
	@GetMapping("/add")
	public String addUser() {
		System.out.println("성공");
		return "A.userReg";
		
	}
	
	//02. 회원 등록 처리후 -- 회원 등록결과로 감.
	@PostMapping("/add")
	public String addUser(User user) {
		//public String addUser(@ModelAttribute User user)로 폼에서 입력한 데이터 가져올 수도 있음.
		System.out.println("출력되라");
		userService.addUser(user);
			return "A.result";
	}
	
	
	//03 회원 상세 정보 조회
	@GetMapping("/viewUser")
	public String getUser(@RequestParam("number") int number, Model m) {
		
		System.out.println("조회하고자하는 회원번호:" +number);
		System.out.println("in selectOne method");
		m.addAttribute(userService.getUser(number));
				
		return "A.userView";
	}

		
	//04. 회원 정보 수정 처리
	@GetMapping("/update")
	public String userUpdate() {
		return "A.updateUserForm";
	}
	
	@PostMapping("/update")
	public String userUpdate(@ModelAttribute User user, Model model) {
		userService.updateUser(user);
		return "A.userView";
	}
			

	//05.삭제
	@RequestMapping("/delete")
	public String userDeleteView(@RequestParam(value="number", required=true) int number) {
		userService.deleteUser(number);
		return "A.deleteView";
	}
		
	//06.로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "A.login";
	}
	
	
	@RequestMapping(value="/loginUser", method = RequestMethod.POST)
	public String loginUser(User user, Model model, HttpSession session) {
		
		User result=userService.loginUser(user);
		
		if(result==null) {
			model.addAttribute("message", "아이디 또는 패스워드가 올바르지 않습니다.");
			return "A.login";
		}else {
			session.setAttribute("loginId", result.getId());
			session.setAttribute("loginNumber", result.getNumber());
			return "A.main";
		}
		
	}
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(User user, Model model, HttpSession session) {
		System.out.println((String)session.getAttribute("loginId"));
		return "A.main";
	}
	

	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(User user, Model model, HttpSession session) {
		session.invalidate();
		return "A.login";
	}
	
	//07. KAKAO 로그인
	//카카오 Email주소로 디비의 이메일주소와 비교하여 가입했는지 여부 확인하는 컨트롤러
	
		@RequestMapping(value="/emailCheck", method = RequestMethod.POST)
		@ResponseBody
		public int emailCheck(@RequestParam("email") String email) {
			return userService.userEmailCheck(email);
		}
		
		
		//카카오로 로그인하기 눌렀으나 회원가입 안되어있는 경우임.
		//kakao email 가지고 회원가입 컨트롤러 - 회원 등록 페이지로 이동함.
		@GetMapping("/kakaoAdd")
		public String kakaoAddUser(@RequestParam("email") String email, Model m) throws Exception {
		
			m.addAttribute("email", email);
			System.out.println(email);
			
			return "A.kakaoUserReg";
			
		}
		
		//회원 등록 처리후 -- 회원 등록결과로 이동.
		@PostMapping("/kakaoAdd")
		public String kakaoAddUser(User user) {
			//public String addUser(@ModelAttribute User user)로 폼에서 입력한 데이터 가져올 수도 있음.
			System.out.println("출력되라");
			userService.addUser(user);
				return "A.result";
		}

		//카카오 이메일로 이미 회원가입이 되어있는 경우
		@RequestMapping(value="/kakaoLogin", method = RequestMethod.POST)
		public String kakaoLogin(User user, Model model, HttpSession session) {
			
			User result=userService.kakaoLogin(user);
			
			if(result==null) {
				model.addAttribute("message", "아이디 또는 패스워드가 올바르지 않습니다.");
				return "A.login";
			}else {
				session.setAttribute("loginId", result.getId());
				session.setAttribute("loginNumber", result.getNumber());
				return "A.main";
			}
			
		}
		
		@GetMapping("/findId")
		public String find() {
			return "findIdForm";
		}
		
		@PostMapping("/findResult")
		public String findId(Model m, String email) {
			User findUser=userService.getUserByEmail(email);
			m.addAttribute("findUser", findUser);
			return "findResult";
		}
		
		@GetMapping("/changePw")
		public String change() {
			return "changePwForm";
		}
		
		@PostMapping(value="/changeResult")
		public String changePwFirst(Model m, String id) {
			User selectUser=userService.updateTogetUser(id);
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
			int rs=userService.updateUserPw(user);
			m.addAttribute("result", rs);
			return "A.login";
		}
	
}
