package login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginMapper loginmapper;
	
	//login 
	public Login selectLogin(Login login) {
		 return loginmapper.selectLogin(login);
	}
}
