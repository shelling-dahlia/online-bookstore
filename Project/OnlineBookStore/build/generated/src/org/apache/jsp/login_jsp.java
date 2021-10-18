package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login JSP</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"style_login.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("        <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body id=\"LoginForm\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"login-form\">\n");
      out.write("                <div class=\"main-div\">\n");
      out.write("                    <div class=\"panel\">\n");
      out.write("                        <h2>Login</h2>\n");
      out.write("                        <p>Please enter your username and password</p>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <form id=\"Login\" method=\"POST\" action=\"dispatchercontroller\">\n");
      out.write("                        <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty UERROR}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <font color=\"red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${UERROR.incorrectMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</font><br/>\n");
      out.write("                        </c:if>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" name=\"txtUserId\" class=\"form-control\" value=\"\" placeholder=\"Username\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"password\" name=\"txtPassword\" class=\"form-control\" value=\"\" placeholder=\"Password\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"google\">\n");
      out.write("                            <a href=\"https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8081/DevlogsPrj/logingoogle&response_type=code\n");
      out.write("               &client_id=627419276955-6305n3qcpeo1klqjgjk3b7dk1158es9j.apps.googleusercontent.com&approval_prompt=force\">Login With Google</a>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <input type=\"submit\" value =\"Login\" class=\"btn btn-primary\" name=\"btAction\"/>\n");
      out.write("                        <div class=\"register\">\n");
      out.write("                            <font color=\"grey\">Don't have account ? Register <a href=\"dispatchercontroller?btAction=Register\">here !!</a></font>\n");
      out.write("                        </div>\n");
      out.write("                        <p class=\"other\"><span>OR</span><p>\n");
      out.write("                            <input type=\"submit\" name = \"btAction\" value =\"ShoppingOnline\" class=\"btn btn-primary\"/>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
