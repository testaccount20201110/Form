package otoiawase;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertData")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public InsertData() {
		super();
	}

	protected void insertData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {





		try {





		} catch (Exception e) {
			e.printStackTrace();
		} finally {





		}

		String redirectURL = "./complete.jsp";
		response.sendRedirect(redirectURL);

	}




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		insertData(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		insertData(request,response);
	}
}
