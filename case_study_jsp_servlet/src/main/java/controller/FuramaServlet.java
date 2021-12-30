package controller;

import bean.Customer;
import bean.CustomerType;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FuramaServlet", urlPatterns = {"","/furama"})
public class FuramaServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser =request.getParameter("actionUser");
        if (actionUser == null){
            actionUser = "";
        }
        try {
            switch (actionUser) {
                case "createCustomer":
                    insertCustomer(request, response);
                    break;
                case "edit":
                    break;
                default:
                    showHome(request, response);
            }
        } catch (SQLException ex){
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser =request.getParameter("actionUser");
        if (actionUser == null){
            actionUser = "";
        }
        try {
            switch (actionUser) {
                case "customer":
                    showCustomerList(request, response);
                    break;
                case "createCustomer":
                    showInsertCustomer(request, response);
                    break;
                case "edit":
                    break;
                default:
                    showHome(request, response);
            }
        } catch (SQLException ex){
            throw new ServletException(ex);
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customerList.jsp");
        dispatcher.forward(request, response);
    }

    private void showInsertCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("insertCustomer.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Integer typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Byte gender = Byte.parseByte(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address);
        customerService.insertCustomer(customer);

        RequestDispatcher dispatcher = request.getRequestDispatcher("insertCustomer.jsp");
        dispatcher.forward(request, response);
    }
}
