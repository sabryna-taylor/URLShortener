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
            function changeText() {
                var change = document.getElementById("button");
                if(change.value === "Shorten URL"){
                    change.value = "Copy";
                }else{
                    change.value = "Shorten URL";
                }
                
            }
        </script>
    </head>
    <body background="${pageContext.request.contextPath}/images/Background Image.png">
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
                              method= "POST" action="shortenUrl"> 
                            <h3>Shorten any URL in less than a second</h3>                     
                            <h4>Make it easier to send and embed links.</h4>
                            <div class="form-group">                              
                                <div class="col-md-8">
                                    <h5 style="float:left;">Link</h5>
                                    <input type="text" class="form-control" name="link" 
                                           placeholder="Type in or paste link here" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <h5 style="float:left;">Shortened URL</h5>
                                    <input type="text" 
                                           class="form-control"
                                           id="shortUrl"
                                           name="view-shortened-url"
                                           align="center"
                                           value="${shortURL}"
                                           title="Press ⌘ + C to copy"
                                           oncopy="alertCopy()"
                                           disabled/>
                                    <br/>
                                </div> 
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p id="submit-button">
                                        <button type="submit" id="button"
                                                name="submit-button"
                                                onclick="changeText()"
                                                value="Shorten URL">
                                            <span style="color:blue;
                                                  font-weight:bold;">
                                                Shorten URL
                                            </span>
                                        </button>

                                    </p>
                                </div>
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
                                <h4>
                                    <a href="tel:+14248293729" class="tel">
                                        +1 424 829 3729
                                    </a>
                                </h4>
                            </td>
                            <td>
                                <img class="img-responsive" src="${pageContext.request.contextPath}/images/Email Icon.png" 
                                     width="25" height="10"> 
                            </td>
                            <td>
                                <h4>
                                    <a href="mailto:thisisatest@gmail.com" style="">
                                        thisisatest@gmail.com
                                    </a>
                                </h4>
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