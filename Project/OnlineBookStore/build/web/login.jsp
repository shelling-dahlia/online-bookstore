<html>
    <head>
        <title>Login JSP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style_login.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body id="LoginForm">
        <div class="container">
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <h2>Login</h2>
                        <p>Please enter your username and password</p>
                    </div>

                    <form id="Login" method="POST" action="dispatchercontroller">
                        <c:if test="${not empty UERROR}">
                            <font color="red">${UERROR.incorrectMessage}</font><br/>
                        </c:if>
                        <div class="form-group">
                            <input type="text" name="txtUserId" class="form-control" value="" placeholder="Username"/>
                        </div>
                        <div class="form-group">
                            <input type="password" name="txtPassword" class="form-control" value="" placeholder="Password"/>
                        </div>
                        <div class="google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8081/DevlogsPrj/logingoogle&response_type=code
               &client_id=627419276955-6305n3qcpeo1klqjgjk3b7dk1158es9j.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                        </div>

                        <input type="submit" value ="Login" class="btn btn-primary" name="btAction"/>
                        <div class="register">
                            <font color="grey">Don't have account ? Register <a href="dispatchercontroller?btAction=Register">here !!</a></font>
                        </div>
                        <p class="other"><span>OR</span><p>
                            <input type="submit" name = "btAction" value ="ShoppingOnline" class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>