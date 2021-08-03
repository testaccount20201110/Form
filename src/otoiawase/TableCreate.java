package otoiawase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TableCreate")
public class TableCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TableCreate() {
        super();
    }

    protected void createTable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	Connection conn = null;
    	Statement stmt = null;
    	ResultSet rs = null;
    	String forwardURL = "/InsertData";






















        ServletContext context = getServletContext();
        RequestDispatcher rd = context.getRequestDispatcher(forwardURL);
        rd.forward(request, response);

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		createTable(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		createTable(request,response);
	}
}  
