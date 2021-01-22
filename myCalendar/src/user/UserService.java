package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public List<User> getUserList(){
		return userMapper.selectAllUser();
	}
	
	public User getUserById(String userId) {
		return userMapper.selectUserById(userId);
	}
	
	public User getUserByEmail(String email) {
		return userMapper.selectUserByEmail(email);
	}
	
	public User updateTogetUser(String userId) {
		return userMapper.updateToUserById(userId);
	}
	
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
	

}
