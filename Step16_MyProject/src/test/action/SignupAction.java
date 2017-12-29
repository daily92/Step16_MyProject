package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class SignupAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id= request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		
		UsersDto dto= new UsersDto(id, pwd, email, null);
		UsersDao.getInstance().insert(dto);
		request.setAttribute("id", id);
		
		return new ActionForward("/views/users/signup_result.jsp");
	}

}
