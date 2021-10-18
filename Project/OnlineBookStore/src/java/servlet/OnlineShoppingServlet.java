package servlet;

import data.dao.ProductDao;
import data.dto.ProductDto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static common.Config.*;
import data.dto.CategoryDto;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class OnlineShoppingServlet extends HttpServlet {

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        String url = SHOPPING_PAGE;
        try {
            List<ProductDto> products = productDao.getAll();
            List<CategoryDto> categories = productDao.getAllCategories();

            req.setAttribute("SHOPPING_PRODUCT", products);
            req.setAttribute("SHOPPING_CATEGORY", categories);

        } catch (SQLException ex) {
            Logger.getLogger(OnlineShoppingServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OnlineShoppingServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
        } finally {
            req.getRequestDispatcher(url).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
