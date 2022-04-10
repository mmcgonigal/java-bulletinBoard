<%--
  Created by IntelliJ IDEA.
  User: mina.mcgonigal
  Date: 4/10/22
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--added class--%>
<%@ page import="user.UserDAO" %>
<%--to use js.--%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- letting know that using javabeans --%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_id" />



<html>
<head>

    <title>JSP Bulletin Board</title>
</head>
<body>
<%
    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(user.getUser_id(),user.getUser_password());
%>
<%-- login.jsp 에서 입렵된 아이디와 페스워드가 ,각각 입력된 값으로 loginAction.jsp 에 넘어와서, userDAO 에 있는 login 함수애 넣어서 실행을 해 줌,
 -2 부터 1 까지 각각의 결과에 대한 값들이 위, result 에 담기게 될 것임. --%>
<%
    if (result == 1){
        PrintWriter script  = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    } else if (result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('You have the wrong password')");
        script.println("history.back()"); // going back to prior page ,-->login page
        script.println("</script>");
    }else if (result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('Id does not exist')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('Error')");
        script.println("history.back()");
        script.println("</script>");
    }
%>



</body>
</html>
