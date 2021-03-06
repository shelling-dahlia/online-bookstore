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
import data.dao.UserDao;
import java.sql.SQLException;
import static common.Config.*;
import data.dto.UserDto;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import servlet.cookie.BuiltinAuthCookie;
import servlet.error.UpdateUserError;
import servlet.error.errorvalidator.UpdateReqHandler;
import servlet.sessionmodel.UserSessionModel;

/**
 *
 * @author NHULT
 */
public class UpdateUserServlet extends HttpServlet {

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String url = "";
        log("UpdateUserServlet run");
        int errorCode = -1;
        String errorIndex = "";
        HttpSession session = req.getSession();
        UpdateReqHandler reqHandler = new UpdateReqHandler();
        reqHandler.init(req);
        boolean hasError = reqHandler.hasError();
        UpdateUserError error = reqHandler.getError();
        try {
            if (reqHandler.getTxtLastSearchValue() == null) {
                url = getUserInfoUrl();
            } else {
                url = getFullSearchUrl(reqHandler.getTxtLastSearchValue());
            }

            String userRole = reqHandler.getUserRole();
            if (userRole == null || userRole.trim().isEmpty()) {
                userRole = "USER";
            }

            UserSessionModel userSessionModel = (UserSessionModel) session.getAttribute(UserSessionModel.SESSION_KEY);
            String currentUserEmail = userSessionModel.getEmail();
            UserDao dao = new UserDao();

            if (!reqHandler.getTxtRawEmail().equals(reqHandler.getTxtEmail())) {
                UserDto dto = dao.getUser(reqHandler.getTxtEmail());
                if (dto != null) {
                    hasError = true;
                    if (error == null) {
                        error = new UpdateUserError();
                    }
                    error.setEmailDuplicate();
                }
            }
            if (hasError) {
                errorIndex = reqHandler.getTxtRawEmail();
            } else {
                UserDto userDto = new UserDto(reqHandler.getTxtEmail(), true, reqHandler.getTxtSignInMethod(), reqHandler.getTxtFullName(), reqHandler.getTxtPassword(), reqHandler.getTxtPhoneNumber(), reqHandler.getTxtAddress(), userRole);
                UserDto updatedUser = dao.updateUser(reqHandler.getTxtRawEmail(), userDto);
                if (reqHandler.getTxtRawEmail().equals(currentUserEmail)) {
                    userSessionModel.setAddress(updatedUser.getAddress());
                    userSessionModel.setEmail(updatedUser.getEmail());
                    userSessionModel.setPassword(updatedUser.getPassword());
                    userSessionModel.setFullName(updatedUser.getFullName());
                    userSessionModel.setPhoneNumber(updatedUser.getPhoneNumber());
                    String previousRole = userSessionModel.getRole();
                    userSessionModel.setRole(updatedUser.getRole());
                    session.setAttribute(UserSessionModel.SESSION_KEY, userSessionModel);
                    clearCookie(resp, reqHandler.getTxtRawEmail());
                    addNewAuthCookie(resp, reqHandler.getTxtEmail(), reqHandler.getTxtPassword());
                    if (!updatedUser.getRole().equalsIgnoreCase(previousRole)) {
                        url = getSignOutUrl();
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
            errorCode = 500;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
            errorCode = 500;
        } finally {
            if (errorCode > -1) {
                resp.sendError(errorCode);
            } else {
                if (hasError) {
                    req.setAttribute("UERROR", error);
                    req.setAttribute("UERROR_INDEX", errorIndex);
                    req.getRequestDispatcher(url).forward(req, resp);
                } else {
                    resp.sendRedirect(url);
                }
            }
        }
    }

    private void addNewAuthCookie(HttpServletResponse resp, String newEmail, String newPassword) {
        BuiltinAuthCookie authCookie = new BuiltinAuthCookie(newEmail, newPassword);
        Cookie cookie = authCookie.getCookie();
        cookie.setMaxAge(60 * 60);
        resp.addCookie(cookie);
    }

    private void clearCookie(HttpServletResponse resp, String email) {
        Cookie killCookie = new Cookie(email.replace("@", "acong"), "");
        killCookie.setMaxAge(0);
        resp.addCookie(killCookie);
        killCookie.setPath("/");
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
