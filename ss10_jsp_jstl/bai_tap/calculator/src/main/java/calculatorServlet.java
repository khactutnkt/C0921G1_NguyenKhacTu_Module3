import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculatorServlet", urlPatterns = {"","/calculator"})
public class calculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String number1 = request.getParameter("firstOperand");
        String number2 = request.getParameter("secondOperand");
        String operand = request.getParameter("operand");
        Double firstOperand = Double.parseDouble(number1);
        Double secondOperand = Double.parseDouble(number2);
        Double result_calculator;
        try {
            switch (operand){
                case "+":
                    result_calculator = firstOperand + secondOperand;
                    break;
                case "-":
                    result_calculator = firstOperand - secondOperand;
                    break;
                case "*":
                    result_calculator = firstOperand * secondOperand;
                    break;
                case "/":
                    if (secondOperand != 0){
                        result_calculator = firstOperand / secondOperand;
                    }
                    else {
                        throw new RuntimeException("Error in division by 0");
                    }
                    break;
                default:
                    throw new RuntimeException("Invalid operand");
            }
            String result = number1 + " " + operand + " " + number2 + " = " + result_calculator;
            request.setAttribute("result", result);
            request.getRequestDispatcher("result_calculator.jsp").forward(request,response);
        }catch (Exception e){
            request.setAttribute("result","Error: "+e.getMessage());
            request.getRequestDispatcher("result_calculator.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("calculator_jstl.jsp").forward(request,response);
    }
}
