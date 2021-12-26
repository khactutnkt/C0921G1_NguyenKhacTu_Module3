import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/customer"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyễn Văn An", "2000-02-02", "Đà Nẵng", "https://www.gannett-cdn.com/media/2021/06/03/USATODAY/usatsports/imageForEntry18-8on.jpg?width=2560"));
        customerList.add(new Customer("Nguyễn Văn Ban", "2000-02-02", "Đà Nẵng", "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_4x3.jpg"));
        customerList.add(new Customer("Nguyễn Văn Can", "2000-02-02", "Đà Nẵng", "https://i.guim.co.uk/img/media/684c9d087dab923db1ce4057903f03293b07deac/205_132_1915_1150/master/1915.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=14a95b5026c1567b823629ba35c40aa0"));
        customerList.add(new Customer("Nguyễn Văn Đan", "2000-02-02", "Đà Nẵng", "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg"));

        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer_list_jstl.jsp").forward(request,response);
    }
}
