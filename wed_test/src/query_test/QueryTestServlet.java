package query_test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/queryTest")
public class QueryTestServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<html><head><title>Query String test</title></head>");
		out.print("<body>");
		out.print("<h1>method = PST</h1>");
		
		String id = req.getParameter("ID");
		String pw = req.getParameter("PW");
		String name = req.getParameter("Name");
		String[] hobbies = req.getParameterValues("hobby");
		String sex = req.getParameter("gender");
		String bio = req.getParameter("bio");
		
		out.print("ID : " + id + "<br/>");
		out.print("PW : " + pw + "<br/>");
		out.print("Name : " + name + "<br/>");
		out.print("Hobby : ");
		for(int i=0; i<hobbies.length; i++)
			out.print(hobbies[i] + "  ");
		out.print("<br/>");
		out.print("Sex : " + sex + "<br/>");
		out.print("Bio : " + bio + "<br/>");
		out.print("전체 질의 문자열 : " + req.getQueryString());
		
		out.println("</body></html>");
		out.close();
	}
	
	/*
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>Query String test</title></head>");
		out.print("<body>");
		out.print("<h1>method = POST</h1>");
		out.print("</body></html>");
		out.close();
	} */
}