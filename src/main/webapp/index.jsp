<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head><title>Hello</title></head>
<body bgcolor="white">
<img src="images/duke.waving.gif"> 

<fmt:requestEncoding value="UTF-8"/>

<fmt:setBundle basename="LocalStrings" var="resourceBundle" scope="page"/>

<h2><fmt:message key="greeting_message" bundle="${resourceBundle}"/></h2>
<form method="get">
<input type="text" name="username" size="25">
<p></p>
<input type="submit" value="Submit">
<input type="reset" value="Reset">
</form>

<c:if test="${not empty param['username']}">
    <%@include file="response.jsp" %>
</c:if>


      <div>   
         <h2>This was made with a CloudBees Clickstart</h1>
         <p>You have successfully deployed a GlassfishV3 application</p>

         <h2>To make changes to your application:</h2>
            <p>
               Make sure you have an ssh public key setup on <a href="https://grandcentral.cloudbees.com/user/ssh_keys">Cloudbees</a>
            </p>
            <p>
               Next, clone the git repository: 
            </p>   
            <p>
               <code>git clone ssh://git@git.cloudbees.com/<script>document.write(location.hostname.split(".")[1])</script>/<script>document.write(location.hostname.split(".")[0])</script>.git</code>
            </p> 
            <p>
               Make your changes and then push to the git repo, for example
            </p>
            <p>
               <code>git push origin master</code>
            </p>   
            <p>
               This will trigger a build and deploy cycle on cloudbees - done !
            </p>
       </div> 

</body>
</html>
