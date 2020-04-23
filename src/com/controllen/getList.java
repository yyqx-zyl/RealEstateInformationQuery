package com.controllen;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pojo.Estate;
import com.pojo.Pager;
import com.service.EstateService;
import com.service.UsersService;


/**
 * Servlet implementation class getList
 */
@WebServlet("/getList")
public class getList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hmtl;UTF-8");
		
		//1、获得applicationContext对象
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext-myatis.xml");
	   
		//2、通过bean获得service
		EstateService es=(EstateService) ctx.getBean("EstateService");
		
		//获得主页面的当前页
		String pageIndex=request.getParameter("pageIndex");
		String text=request.getParameter("text");
		String type=request.getParameter("type");
		System.out.println("text"+text+",,type"+type);
		//如果pageIndex为空
		int currpage=1;//当前页
		//创建分页对象
		Pager pg=new Pager();
		//获得数据总条数
		int totalCount=es.getCount();
		pg.setTotalCount(totalCount);
		if (pageIndex==null || "".equals(pageIndex)) {
			currpage=1;
		}else {
			int pIndex=Integer.parseInt(pageIndex);
		if (pIndex<=0) {
			currpage=1;
		}else if (pIndex>pg.getTotalPages()) {
			currpage=pg.getTotalPages();
		}else {
			currpage=pIndex;
			}
		}
		pg.setCurrPage(currpage);
		int start=(currpage-1)*pg.getPageSize();//?有点模糊
		List pageLists=es.getEstateList(type, text,start,pg.getPageSize());
		pg.setPageLists(pageLists);
		if (pageLists!=null) {
			request.getSession().setAttribute("pg",pg);
		}else {
			String msg="暂无数据！！！";
			request.getSession().setAttribute("wu",msg);
		}
		response.sendRedirect("index2.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
