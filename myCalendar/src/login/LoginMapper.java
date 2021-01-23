package login;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {
	
	//login
	@Select("select * from newuser where id=#{id} and password=#{password}")
	public Login selectLogin(Login login);
}
