/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static common.Config.*;
import static common.Config.Action.*;
import data.dao.ProductDao;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlet.sessionmodel.Cart;

/**
 *
 * @author NHULT
 */
public class UpdateQuantityController extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = VIEW_CART_PAGE;
        boolean hasError = false;
        String incorrectQuantityFormat = null;
        String insufficentQuantity = null;
        String txtQuantity = req.getParameter("txtQuantity");
        String txtId = req.getParameter("txtId");
        try {
            int quantity = Integer.parseInt(txtQuantity);
            ProductDao dao = new ProductDao();
            int maxQuantity = dao.getProductQuantity(txtId);

            if (quantity > maxQuantity) {
                hasError = true;
                insufficentQuantity = "Insufficent quantity";
            }
            
            if (!hasError) {
                log("Update cart quantity");
                Cart cart = (Cart) req.getSession().getAttribute("CART");
                cart.setQuantity(txtId, quantity);
            }

        } catch (NumberFormatException ex) {
            hasError = true;
            incorrectQuantityFormat = "Incorrect Quantity";
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateQuantityController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuantityController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (hasError) {
                req.setAttribute("INSUFFICENT_ERROR", insufficentQuantity);
                req.setAttribute("INCORRECT_QUANTITY", incorrectQuantityFormat);
                req.setAttribute("UERROR_INDEX", txtId);
            }

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
