 package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Admin;

@WebServlet("/adminRigi")
public class AdminRegi extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String pass=req.getParameter("pass");
		String email=req.getParameter("email");
		int id=Integer.parseInt(req.getParameter("id"));
		
		PrintWriter out=resp.getWriter();
		Admin a=new Admin();
		a.setEmail(email);
		a.setId(id);
		a.setName(name);
		a.setPass(pass);
		
		Dao d= new Dao();
		try {
			resp.setContentType("text/html");
			out.print("Registeration Successfully...");
			d.saveAdmin(a);
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);
		}catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("/adminr.jsp");
			rd.include(req, resp);
		}
		
	}

}
