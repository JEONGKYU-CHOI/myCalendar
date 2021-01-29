package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import board.Board;

import board.BoardService;
import board.Page;
import comment.Comment;
import comment.CommentService;


@Controller
@RequestMapping(value = "/board", produces = "application/json; charset=utf8")
public class BoardController {

	@Autowired
	private BoardService boardservice;
	@Autowired
	private CommentService commentservice;

	        
//	board
	       
	//insert
	@GetMapping("/insertform")
	public String insert() {

		return "B.insertBoard";
	}
	           
	@PostMapping("/insert")
	public String insertBoard(Model m, RedirectAttributes rttr, @RequestParam(value = "num", defaultValue = "1")int num, Board board) {
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
		boardservice.insertBoard(board);
//		boardservice.insertBoardImg(board);
		rttr.addFlashAttribute("result", "registerOK");
		
//		return "B.page";
		return "redirect:/board/listPage";
	}
	
	@PostMapping("/insertcomment")
	@Transactional
	public String commentInsert(Model m, @RequestParam(value = "num", defaultValue = "1")int num, Comment comment) {
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
		commentservice.isnertComment(comment);
		System.out.println(comment);
		return "B.page";
	} 
		 
	@GetMapping("/check")
	public String check(Model m, int id) {
		Board board = boardservice.selectById(id);
		m.addAttribute("board", board);
		System.out.println(board+"1");
		return "B.check";        
	}      
	    
	@GetMapping("/update")
	public String update(Model m, int id, String boardPassword) {
		Board board = boardservice.selectBoard(id, boardPassword);
		m.addAttribute("board", board);
		System.out.println(board+"2");
		return "B.updateBoard";
	}              
	   
	@PostMapping("/update")
	public String updateBoard(Model m, Board board, @RequestParam(value = "num", defaultValue = "1")int num) {
		boardservice.Boardupdate(board);
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(boardservice.selectCount());
		
		List<Board> bList = boardservice.listPage(page.getDisplayPost(), page.getPostNum());
		
 		m.addAttribute("bList", bList);

		m.addAttribute("page", page);
		m.addAttribute("select", num);
		return "B.page";
	}          
	             
	// 댓글     
	                     
	@GetMapping("/check1")
	public String check1(Model m, int id) {
		Comment comment = commentservice.selectById(id);
		m.addAttribute("comment", comment);
		return "B.check1";
	}
	      
	@GetMapping("/update1")
	public String update1(Model m, int id, String commentPassword) {
		
		Comment comment = commentservice.selectComment(id, commentPassword);
		m.addAttribute("comment", comment);
		System.out.println(comment + "1번");
		return "B.updateComment";
	}
	        
	@PostMapping("/update1")     
	public String updateBoard1(Model m, Comment comment, @RequestParam(value = "num", defaultValue = "1")int num) {
		System.out.println(comment + "2번");
		commentservice.updateComment(comment);
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(boardservice.selectCount());
		
		List<Board> bList = boardservice.listPage(page.getDisplayPost(), page.getPostNum());
		
 		m.addAttribute("bList", bList);

		m.addAttribute("page", page);
		m.addAttribute("select", num);
		return "B.page";
	}
	     
	
	@GetMapping("/delete")
	public String delete(Model m, int id) {
		Board board = boardservice.selectById(id);
		m.addAttribute("board", board);
		System.out.println(board);
		return "B.deleteBoard";
	}
	
	@PostMapping("/delete")
	@Transactional
	public String deleteBoard(Model m, @Param("id") int id, @Param("boardPassword") String boardPassword, @RequestParam(value = "num", defaultValue = "1")int num) {
		boardservice.deleteBoard(id, boardPassword);
		commentservice.deleteComment(id);
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
	  
	         
	@GetMapping("delete1")
	public String delete1(Model m, int id) {
		Comment comment = commentservice.selectById(id);
		m.addAttribute("comment", comment);
		System.out.println(comment);
		return "B.deleteComment";
	}    
	
	@PostMapping("deletecomment")
	public String deleteComment(Model m, @Param("id") int id, @Param("commentPassword") String commentPassword) {
		commentservice.deleteComment1(id, commentPassword);
		Board board = boardservice.selectById(id);
		m.addAttribute("board", board);
		System.out.println(board);
		List<Comment> cList = commentservice.selectBoardId(id);
		m.addAttribute("cList", cList);
		System.out.println(cList);   
		
		return "B.selectOne";
	}
	
	@GetMapping("/one")      
	@Transactional  
	public String selectOne(Model m, int id) {
		Board board = boardservice.selectById(id);
		m.addAttribute("board", board);
		System.out.println(board);
		boardservice.BoardView(id);
		List<Comment> cList = commentservice.selectBoardId(id);
		m.addAttribute("cList", cList);
		System.out.println(cList);
		
		return "B.selectOne";
	}
//	@GetMapping("/title")
//	public String Title(Model m, Board board, String boardTitle) {
//
//		
//		List<Board> TList = boardservice.selectTitle(boardTitle);
//		m.addAttribute("TList", TList);
//
//		return "B.titleList";
//	}
	
	@GetMapping("/title")
	@Transactional
	public String listSearch(Model m, Board board, @RequestParam(value = "boardTitle", required = false, defaultValue = "")String boardTitle, @RequestParam(value = "num", defaultValue = "1")int num) {
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(boardservice.countTitle(boardTitle));
		
		page.setBoardTitle(boardTitle);
//		page.setBoardTitle(boardservice.listTitle(displayPost, postNum, boardTtile));
		List<Board> TList = boardservice.listTitle(page.getDisplayPost(), page.getPostNum(), boardTitle);
		m.addAttribute("TList", TList);
		     
		m.addAttribute("page", page);
		m.addAttribute("select", num);          
		
//		m.addAttribute("boardTitle", boardTitle);
//		System.out.println(TList);
		return "B.titleList";
	} 
	
//	@GetMapping("/oneform")
//	public String selectform(Model m, int id) {
//		Board board = boardservice.selectById(id);
//		
//		m.addAttribute("board", board);
//		
//		return "B.selectform";
//	}
	
//	@GetMapping("/onecomment")
//	public String selectComment(Model m, int id) {
//		Comment comment = commentservice.selectById(id);
//		m.addAttribute("comment", comment);
//		System.out.println(comment + "3번");
//		return "B.commentform";
//	}
	
	//page
	
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
	
	//이미지
	
	
	
//	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
//	@ResponseBody
//	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
//		
//		JsonObject jsonObject = new JsonObject();
//		
//		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//				
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		
//		return jsonObject;
//	}
	
//	@GetMapping("/login")
//	public String login1() {
//		return "B.login";
//	}

//	@PostMapping("/login")
//	public String login(Login login, HttpServletRequest req, RedirectAttributes rttr) {
//		
//		HttpSession session = req.getSession();
//		Login login1 = loginservice.selectLogin(login);
//		System.out.println(login1);
//		if(login == null) {
//			session.setAttribute("member", null);
//			rttr.addFlashAttribute("msg", false);
//		}else {
//			session.setAttribute("member", login1);
//		}
//		return "redirect:/board/listPage";
//	}
//	
////	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	@GetMapping("/logout")
//	public String logout(HttpSession session) throws Exception{
//		
//		session.invalidate();
//		
//		return "redirect:/board/listPage";
//}  
}
        