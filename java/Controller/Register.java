package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Student;
@WebServlet("/register")
public class Register extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		PrintWriter out=resp.getWriter();
		
		
		try {
			Student s=new Student();
			s.setName(req.getParameter("name"));
			s.setEmail(req.getParameter("email"));
			s.setId(Integer.parseInt(req.getParameter("id")));
			s.setPass(req.getParameter("pass"));
			String course = req.getParameter("course");
			s.setCourse(course);
			
			int aid=(Integer.parseInt(req.getParameter("aid")));
			
			
			Dao d=new Dao();
			d.rigister(s,aid);
//			out.print("<h1>register succufully</h1>");
			HttpSession hs=req.getSession();
			hs.setAttribute("msg", s.getName()+"  Register succufully");			
			resp.sendRedirect("login.jsp");
		}catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("Error while registering student");
        }
	}
	
	
	

}
