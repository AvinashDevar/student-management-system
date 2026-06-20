package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
@WebServlet(value="/deleteStd")
public class DeletStd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sid = Integer.parseInt(req.getParameter("sid"));
		Dao sdao = new Dao();
		sdao.deleteStudent(sid);
		RequestDispatcher rd = req.getRequestDispatcher("/adminprofile.jsp");
		rd.include(req, resp);
	}
	

}
