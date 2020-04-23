package com.controllen;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pojo.Users;
import com.service.UsersService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersService us ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获得applicationContext对象
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext-myatis.xml");
		//2、通过bean获得service
		us=(UsersService) ctx.getBean("UsersService");
		String msg=request.getParameter("msg");
		
		if ("zhu".equals(msg)) {
			zhuc(request,response);
		}else if ("log".equals(msg)) {
			login(request,response);
		}else if ("remove".equals(msg)) {
			request.getSession().removeAttribute("ulist");
			response.sendRedirect("login.jsp");
		}else if ("cc".equals(msg)) {
			response.sendRedirect("login2.jsp");
		}
		
	}
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardId=request.getParameter("cardId");
		String password=request.getParameter("password");
		
		Users users=new Users();
		users.setCardId(cardId);
		users.setPassword(password);
		
		Users ulist=us.login(users);
		if (ulist!=null) {
			request.getSession().setAttribute("ulist", ulist);
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}

	private void zhuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardId=request.getParameter("cardId");
		String name=request.getParameter("name");
		int gender=Integer.parseInt(request.getParameter("gender"));
		String password=request.getParameter("password");
		
		
		Users user=new Users();
		user.setName(name);
		user.setCardId(cardId);
		user.setGender(gender);
		user.setPassword(password);
		user.setCreateTime(new Date());
		user.setStatus(1);
		
		boolean isOk=us.save(user);
		if (isOk) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("login2.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
