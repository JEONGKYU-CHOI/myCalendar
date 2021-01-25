package user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
//수정본
//현재 클래스를 빈으로 등록
// 아이디랑 비번이 일치하는지 비교를 위해서 map에 저장한다.
//아이디랑 비번이 일치하여 1이면 true를 리턴함.
@Mapper
public interface UserMapper {

		//아이디로 조회
		public User selectOne(int number);
		
		//user id 중복체크
		public int checkOverId(String id);
		
		//user 추가
		public int insertUser(User user);
		
		//user수정
		public int updateUser(User user);
		
		//user삭제
		public int deleteUser(int number);
		
		//login
		public User loginUser(User user);

		//Email 중복체크
		public int checkOverEmail(String email);
		
		//kakao 로그인
		public User kakaoLogin(User user);
		
}
