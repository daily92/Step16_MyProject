package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.action.HomeAction;
import test.action.LoginAction;
import test.action.LoginFormAction;
import test.action.LogoutAction;
import test.action.SignupAction;
import test.action.SignupFormAction;
import test.action.UsersDeleteAction;
import test.action.UsersInfoAction;
import test.action.UsersUpdateAction;
import test.action.UsersUpdateFormAction;

public class UserActionFactory {
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory==null){
			factory=new UserActionFactory();
		}
		return factory;
	}
	// 요청처리를 할 Action 객체를 리턴해주는 메소드
	public Action action(String command) {
		Action action=null;
		if(command.equals("/home")) {
			action= new HomeAction();
		}else if(command.equals("/users/signup_form")) {
			action= new SignupFormAction();
		}else if(command.equals("/users/signup")) {
			action= new SignupAction();
		}else if(command.equals("/users/login_form")) {
			action= new LoginFormAction();
		}else if(command.equals("/users/login")) {
			action= new LoginAction();
		}else if(command.equals("/users/logout")) {
			action= new LogoutAction();
		}else if(command.equals("/users/private/info")) {
			action= new UsersInfoAction();
		}else if(command.equals("/users/private/updateform")) {
			action= new UsersUpdateFormAction();
		}else if(command.equals("/users/private/update")) {
			action= new UsersUpdateAction();
		}else if(command.equals("/users/private/delete")) {
			action= new UsersDeleteAction();
		}
		
		
		return action;
	}
}
