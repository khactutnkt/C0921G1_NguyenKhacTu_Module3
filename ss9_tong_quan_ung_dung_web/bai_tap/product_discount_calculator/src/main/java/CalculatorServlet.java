import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("product");
        String priceStr = request.getParameter("price");
        String percentStr = request.getParameter("percent");
        float price = Float.parseFloat(priceStr);
        float percent = Float.parseFloat(percentStr);
        float discountAmount = price * percent * 0.01f;
        float discountPrice = price - discountAmount;
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
