package user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
	
	@Select("select id, password from newuser")
	public List<User> selectAllUser();
	
	@Select("select number, name from newuser where id=#{id}")
	public User selectUserById(String userId);
	
	@Select("select id from newuser where email=#{email}")
	public User selectUserByEmail(String email);
	
	@Select("select id, password from newuser where id=#{id}")
	public User updateToUserById(String userId);

	@Update("update newuser set password=#{password} where id=#{id}")
	public int updateUser(User user);
}
