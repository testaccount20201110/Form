package otoiawase;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CSVFileWriter")
public class CSVFileWriter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CSVFileWriter() {
	}

	protected void writingCSV(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String forwardURL = "/TableCreate";
		HttpSession session = request.getSession(true);

		Calendar myCal = Calendar.getInstance();
		DateFormat myFormat = new SimpleDateFormat("yyyy_MMdd_km");
		String myName = myFormat.format(myCal.getTime());

		File f = new File("c:\\csv");
		if (!f.exists()) {
			f.mkdirs();
		}

/*		try {
























		} catch (IOException ex) {
			ex.printStackTrace();
		}
*/		ServletContext context = getServletContext();
		RequestDispatcher rd = context.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		writingCSV(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		writingCSV(request, response);
	}

}
