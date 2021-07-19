package otoiawase;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InputCheck")
public class InputCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public InputCheck() {
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {



		HttpSession session = request.getSession(true);

		String family_name = request.getParameter("family_name");

		String first_name = request.getParameter("first_name");

		String email = InputUtil.alphabetChangeHan(request.getParameter("email"));

		String url = InputUtil.alphabetChangeHan(request.getParameter("url"));

		String sex ="";
		sex = request.getParameter("sex");

		String birth_year = InputUtil.numberChangeHan(request.getParameter("birth_year"));

		String birth_month = request.getParameter("birth_month");

		String birth_day = request.getParameter("birth_day");

		String zip1 = InputUtil.numberChangeHan(request.getParameter("zip1"));

		String zip2 = InputUtil.numberChangeHan(request.getParameter("zip2"));

		String address = InputUtil.numberChangeHan(request.getParameter("address"));

		String[] interests = request.getParameterValues("interest");
		String interest = "";

		String inq_kind = request.getParameter("inq_kind");

		String detail = InputUtil.numberChangeHan(request.getParameter("detail"));



		String forwardURL;

		ArrayList<String> errMsgArray = new ArrayList<String>();

		ArrayList<String> errMsgKind = new ArrayList<String>();

		forwardURL = "/confirm.jsp";

		session.setAttribute("family_name", family_name);
		session.setAttribute("first_name",first_name);
		session.setAttribute("email",email );
		session.setAttribute("url",url );
		session.setAttribute("sex", sex);
		session.setAttribute("birth_year",birth_year );
		session.setAttribute("birth_month",birth_month );
		session.setAttribute("birth_day", birth_day);
		session.setAttribute("zip1", zip1);
		session.setAttribute("zip2", zip2);
		session.setAttribute("address",address );
		session.setAttribute("interests", interests);
		session.setAttribute("interest",interest );
		session.setAttribute("inq_kind",inq_kind );
		session.setAttribute("detail",detail );



























		ServletContext context = getServletContext();
		RequestDispatcher rd = context.getRequestDispatcher(forwardURL);
		rd.forward(request, response);

	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
