package board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.Comment;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//전체조회
		public List<Board> selectBoard(){
			return boardMapper.selectAll();
		}
		
		//추가
		public int insertBoard(Board board) {
			return boardMapper.insertBoard(board);
		}
		
//		//img추가
//		public int insertBoardImg(Board board) {
//			return boardMapper.insertBoardImg(board);
//		}
		
		//수정
		public int updateBoard(Board board) {
			return boardMapper.updateBoard(board);
		}
		
		//id 조회
		public Board selectById(int id) {
			return boardMapper.selectById(id);
		}
		
		//삭제
		public int deleteBoard(@Param("id") int id, @Param("boardPassword") String boardPassword) {
			return boardMapper.deleteBoard(id, boardPassword);
		}
		
		//제목 검색
		public List<Board> selectTitle(String boardTitle){
			return boardMapper.selectBybdTitle(boardTitle);
		}
		
		//comment
		
		//댓글 조회
		public List<Comment> selectComment(){
			return boardMapper.CommentAll();
		}
		
		//check
		public Board selectBoard(@Param("id") int id, @Param("boardPassword") String boardPassword) {
			return boardMapper.selectUpdate(id, boardPassword);
		}
		
		//update
		public int Boardupdate(Board board) {
			return boardMapper.Boardupdate(board);
		}
		
		//page
		
		//갯수 구하기
		public int selectCount() {
			return boardMapper.selectCount();
		}
		
		//HashMap
		public List<Board> listPage(int displayPost, int postNum){
			
			HashMap<String, Integer> data = new HashMap<String, Integer>(); 
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);
			
			return boardMapper.listPage(data); 
		}
}
