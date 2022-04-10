<%--
  Created by IntelliJ IDEA.
  User: mina.mcgonigal
  Date: 4/9/22
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    bootstrap--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <title>JSP Bulletin board</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="main.jsp">BulletinBoard</a>
    <a class="navbar-brand text-secondary" href="main.jsp">menu</a>
    <a class="navbar-brand text-secondary" href="bbs.jsp">bulletin board</a>
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            access
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="join.jsp">sign in</a>
            <a class="dropdown-item" href="login.jsp">log in</a>
        </div>
    </div>
</nav>

<div class="container">
    <%--    <div class="col-lg-4"></div>--%>
    <div class="col-lg-12">
        <div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
            <form method="post" action="loginAction.jsp">
                <h3 style="text-align: center;">Log in</h3>
                <br>
                <div class="form-row">
                    <input type="text" class="form-control" id="userID" name="userID" placeholder="id" maxlength="20">
                </div>
                <br>
                <div class="form-row">
                    <input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="password" maxlength="20">
                </div>
                <br>
                <input type="submit" class="btn btn-info form-control" value="login">
            </form>
        </div>
    </div>
</div>

<%--bootstrap--%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>

