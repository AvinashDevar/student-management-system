package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Admin;
import dto.Student;

@WebServlet("/Logins")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name=req.getParameter("name");
		String pass=req.getParameter("pass");
		String roll=req.getParameter("role");
		Dao d=new Dao();
		PrintWriter out = resp.getWriter();
		
		if(roll.equals("admin")) {
			Admin a=d.adminLogin(name, pass);
			if(a!=null) {
				resp.setContentType("text/html");
				out.print("Admin Login Successfully...");
				HttpSession hs=req.getSession();
				List<Admin>a1=d.fetchAllAdmins();
				for(Admin a2:a1) {
					if(a2.getEmail().equals(name)&&a2.getPass().equals(pass)) {
						int aid = a2.getId();
						String aname = a2.getName();
						String aemail = a2.getEmail();
						String apassword = a2.getPass(); 
						
						hs.setAttribute("aid", aid);
						hs.setAttribute("aname",aname );
						hs.setAttribute("aemail",aemail );
						hs.setAttribute("apassword", apassword);	
					}
				}
				RequestDispatcher re=req.getRequestDispatcher("/AdminDash.jsp");
				re.forward(req, resp);
			}else {
				HttpSession hs=req.getSession();
				hs.setAttribute("msg", "Admin Login Failed");
				RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			}
			
		}
		if(roll.equals("user")) {
			Student s=d.studentLogin(name, pass);
			if(s!=null) {
				resp.setContentType("text/html");
				out.print("Student Login Successfully...");
					
				HttpSession hs = req.getSession();
				List<Student> list=d.fetchAllStudents();
				for(Student s1: list) {
					if(s1.getEmail().equals(name)&&s1.getPass().equals(pass)) {
						int sid = s1.getId();
						String sname = s1.getName();
						String semail = s1.getEmail();
						String scourse = s.getCourse();
						String spassword = s1.getPass();
						
						hs.setAttribute("sid", sid);
						hs.setAttribute("sname",sname );
						hs.setAttribute("semail",semail );
						hs.setAttribute("scourse",scourse );
						hs.setAttribute("spassword", spassword);	
					}	
				}
				RequestDispatcher rd = req.getRequestDispatcher("/Studentdash.jsp");
				rd.forward(req, resp);
				
			}else {
				HttpSession hs=req.getSession();
				hs.setAttribute("msg", "Student Login Failed");
				RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			}
			
		}
		
		
		
	}

}
