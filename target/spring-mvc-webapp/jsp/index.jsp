<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trim</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/design.css" rel="stylesheet">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function alertCopy() {
                alert("Copied!");
            }
            function highlightText() {
                $('#shortUrl').focus().select();
            }

            function disabledOn() {
                $('#shortUrl').prop('disabled', true);
            }
        </script>
    </head>
    <body background="${pageContext.request.contextPath}/images/Background Image.png"
          onload="highlightText(); disabledOn();" id="b">
        <div class="container">

            <div class="table-responsive">
                <table class="table">
                    <tr>
                    <div class="logo">
                        <img class="img-responsive" src="${pageContext.request.contextPath}/images/Logo.png" 
                             alt="Trim" width="120" height="60"
                             style="position:absolute; top: 45px;"/>
                    </div>    
                    </tr>
                    <tr>
                    <div class="form">
                        <form class="form" role="form" id="shorten-Url" name="shortURL"
                              method= "POST" action="shortenUrl" onsubmit="disabledOff()">
                            <h3 id="url">Shorten any URL in less than a second</h3>                     
                            <h4>Make it easier to send and embed links.</h4>
                            <div class="col-md-8">
                                <h5 style="float:left;">Link</h5>
                                <input type="text" class="form-control" name="link" 
                                       placeholder="Type in or paste link here" required/>
                            </div>
                            <div class="col-md-8">
                                <h5 style="float:left;">Shortened URL</h5>
                                <input type="text" 
                                       class="form-control"                                           
                                       value="<c:out value= "${shortURL}"/>" 
                                       id="shortUrl"
                                       align="center"                                         
                                       title="Press ⌘ + C to copy"
                                       oncopy="alertCopy()"
                                       onload="disabledOn()"/>
                                <br/>
                            </div> 
                            <div class="col-md-12">
                                <p id="submit-button">
                                    <button type="submit" id="button" 
                                            name="submit-button">
                                        <span style="color:blue;
                                              font-weight:bold;" id="changeText">
                                            ${current}
                                        </span>
                                    </button>
                                </p>                           
                            </div>
                        </form>
                    </div>
                    </tr>
                </table>
            </div>

            <div class="footer" style="padding: 30px;"> 
                <div class="table-responsive">
                    <table class="table">
                        <tr> 
                            <td>  
                                <img class="img-responsive" src="${pageContext.request.contextPath}/images/PhoneIcon.png" 
                                     width="25" height="10"> 
                            </td>
                            <td>
                                <u>
                                    <a href="tel:+14248293729" class="tel">
                                        +1 424 829 3729
                                    </a>
                                </u>
                            </td>
                            <td>
                                <img class="img-responsive" src="${pageContext.request.contextPath}/images/Email Icon.png" 
                                     width="25" height="10"> 
                            </td>
                            <td>
                                <u>
                                    <a href="mailto:thisisatest@gmail.com" class="email">
                                        thisisatest@gmail.com
                                    </a>
                                </u>
                            </td>
                            <td>
                                <span class="company">© The Testing Company. All Rights Reserved.</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>