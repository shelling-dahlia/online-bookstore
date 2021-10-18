package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static common.Config.*;
import data.dao.UserDao;
import data.dto.UserDto;
import java.sql.SQLException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import servlet.cookie.BuiltinAuthCookie;
import servlet.cookie.GoogleAuthCookie;
import servlet.sessionmodel.UserSessionModel;

public class ProcessRequestServlet extends HttpServlet {

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = req.getSession(true);
        UserSessionModel sessionUser = (UserSessionModel) session.getAttribute(UserSessionModel.SESSION_KEY);
        try {
            UserDao userDao = new UserDao();
            BuiltinAuthCookie builtinAuthCookie = new BuiltinAuthCookie();
            GoogleAuthCookie googleAuthCookie = new GoogleAuthCookie();
            boolean buitinParseResult = false;
            boolean ggSignInParseResult = false;
            UserDto userDto = null;

            if (sessionUser == null) {
                Cookie[] cookies = req.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        log("Check cookie");
                        buitinParseResult = builtinAuthCookie.parseFromCookie(cookie);
                        if (buitinParseResult) {
                            userDto = userDao.getUser(builtinAuthCookie.getEmail(), builtinAuthCookie.getPassword());
                            if (userDto != null) {
                                break;
                            }
                        }
                        ggSignInParseResult = googleAuthCookie.parseFromCookie(cookie);
                        if (ggSignInParseResult) {
                            GooglePojo googlePojo = googleAuthCookie.getGooglePojo();
                            userDto = userDao.getUser(googlePojo.getEmail());
                            if (userDto != null) {
                                break;
                            }
                        }
                    }
                }
            }

            if (userDto != null) {
                sessionUser = new UserSessionModel(userDto.getEmail(), userDto.getFullName(), userDto.getPassword(), userDto.getPhoneNumber(), userDto.getAddress(), userDto.getRole(), UserSessionModel.SIGNIN_METHOD.GOOGLE_SIGNIN);
                session.setAttribute(UserSessionModel.SESSION_KEY, sessionUser);
            }

            if (sessionUser != null) {
                if (sessionUser.getRole().equalsIgnoreCase("user")) {
                    url = getShoppingOnlineUrl();
                } else if (sessionUser.getRole().equalsIgnoreCase("admin")) {
                    url = SEARCH_PAGE;
                }
                if (!userDao.getVerifiedEmailState(sessionUser.getEmail())) {
                    url = getVerifiedMailPageUrl();
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProcessRequestServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProcessRequestServlet.class.getName()).log(Level.ERROR, "Error occur due to: " + ex.getMessage());
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
