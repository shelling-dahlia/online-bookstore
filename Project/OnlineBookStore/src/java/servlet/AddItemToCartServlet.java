/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import servlet.sessionmodel.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static common.Config.*;
import data.dao.ProductDao;
import data.dto.ProductDto;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlet.error.AddToCartError;

public class AddItemToCartServlet extends HttpServlet {

    private void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String selectedCategories = req.getParameter("cboCategory");
        boolean hasError = false;
        AddToCartError error = null;
        try {
            HttpSession session = req.getSession(true);
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }
            String txtProductName = req.getParameter("txtProductName");
            String txtProductId = req.getParameter("txtProductId");
            String txtQuantity = req.getParameter("txtProductQuantity");
            String txtPrice = req.getParameter("txtProductPrice");

            error = new AddToCartError(txtProductId);
            log("ProductId: " + txtProductId);
            int quantity = Integer.parseInt(txtQuantity);
            ProductDao dao = new ProductDao();
            int maxQuantity = dao.getProductQuantity(txtProductId);

            if (maxQuantity < quantity) {
                hasError = true;
                error.setOverQuantity();
            }

            if (!hasError) {
                double price = Double.parseDouble(txtPrice);
                cart.addItemToCart(txtProductId, txtProductName, quantity, price);
                session.setAttribute("CART", cart);
            }
        } catch (NumberFormatException ex) {
            hasError = true;
            error.setIncorectQuantity();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddItemToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddItemToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (hasError) {
                log("Error!");
                req.setAttribute("UERROR", error);
                if (selectedCategories != null) {
                    req.setAttribute("cboCategory", selectedCategories);
                }
                req.getRequestDispatcher(getShoppingOnlineUrl()).forward(req, res);
            } else {
                if (selectedCategories == null) {
                    res.sendRedirect(getShoppingOnlineUrl());
                } else {
                    res.sendRedirect(getShoppingOnlineUrl() + "&cboCategory=" + selectedCategories);
                }
            }
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
