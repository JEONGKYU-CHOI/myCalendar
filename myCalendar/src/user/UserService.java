package user;
//수정본
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	
	@Autowired
    private UserMapper userMapper;
	
	//중복 아이디 체크
	public int userIdCheck(String id) {
		
		return userMapper.checkOverId(id);
	}
	
	//중복 이메일 체크
	public int userEmailCheck(String email) {
		return userMapper.checkOverEmail(email);
	}
	
	public User getUser(int number) {
		return userMapper.selectOne(number);
	}
	//회원 가입 서비스
	public int addUser(User user) {
		return userMapper.insertUser(user);
	}
	

	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
	
	//05. 회원 정보 삭제 처리
	public int deleteUser(int number) {
		return userMapper.deleteUser(number);
	}
	
	//06. 회원 로그인
	public User loginUser(User user) {
		return userMapper.loginUser(user);
	}
	
	//07. 카카오톡 로그인
	public User kakaoLogin(User user) {
		return userMapper.kakaoLogin(user);
	}

	public User getUserByEmail(String email) {
		return userMapper.selectUserByEmail(email);
	}
	
	public User updateTogetUser(String userId) {
		return userMapper.updateToUserById(userId);
	}
	
	public int updateUserPw(User user) {
		return userMapper.updateUserPw(user);
	}

}
