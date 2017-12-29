package test.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class HomeAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<String> news= new ArrayList<>();
		Date dt= new Date();	
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy년 MM 월 dd 일");
		SimpleDateFormat sdf2= new SimpleDateFormat("hh시 mm 분 ss 초 a");
		news.add(sdf.format(dt).toString());
		news.add(sdf2.format(dt).toString());
		
		request.setAttribute("news", news);
		
		return new ActionForward("/views/home.jsp"); 
	}

}
