/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import common.Config;
import data.dao.UserDao;
import data.dto.UserDto;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlet.cookie.BuiltinAuthCookie;
import servlet.error.LoginError;
import servlet.sessionmodel.UserSessionModel;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int errorCode = -1;
        String txtUserId = req.getParameter("txtUserId");
        String txtPassword = req.getParameter("txtPassword");
        UserDao accountDao = new UserDao();
        String url = Config.LOGIN_PAGE;
        boolean hasError = false;
        LoginError error = new LoginError();
        try {
            UserDto result = accountDao.getUser(txtUserId, txtPassword);
            if (result != null) {
                url = Config.DISPATCH_CONTROLLER;
                HttpSession session = req.getSession(true);
                UserSessionModel user = new UserSessionModel(result.getEmail(), result.getFullName(), result.getPassword(), result.getPhoneNumber(), result.getAddress(), result.getRole(), UserSessionModel.SIGNIN_METHOD.BUILTIN);
                session.setAttribute(UserSessionModel.SESSION_KEY, user);
                BuiltinAuthCookie authCookie = new BuiltinAuthCookie(result.getEmail(), result.getPassword());
                Cookie cookie = authCookie.getCookie();
                resp.addCookie(cookie);
                if (!result.isIsVerified()) {
                    url = Config.getVerifiedMailPageUrl();
                }
            } else {
                hasError = true;
                error.setIncorrect();
                url = Config.LOGIN_PAGE;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            errorCode = 500;
            ex.printStackTrace();
            req.setAttribute("mess", "Login failed! Incorrect username or password");
        } catch (Exception ex) {
            errorCode = 500;
            ex.printStackTrace();
        } finally {
            if (hasError) {
                req.setAttribute("UERROR", error);
                req.getRequestDispatcher(url).forward(req, resp);
            } else if (errorCode == -1) {
                resp.sendRedirect(url);
                out.close();
            } else {
                resp.sendError(errorCode);
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
