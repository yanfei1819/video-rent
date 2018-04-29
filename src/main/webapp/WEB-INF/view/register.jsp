<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <title>视频租赁管理系统</title>
    <link href="${pageContext.request.contextPath}/static/styles/login.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPath">
<div class="login">
    <div class="message">system of video manage</div>
    <div id="darkbannerwrap"></div>
    <form method="post" id="userFormRegister">
        <input name="action" value="login" type="hidden"/>
        <input name="name" placeholder="username" required="" type="text"/>
        <hr class="hr15"/>
        <input name="password" placeholder="password" required="" type="password"/>
        <hr class="hr15"/>
        <input value="register" style="width:100%;" type="submit" id="submitRegister"/>
    </form>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>

<script>
    var $urlPath = $('#urlPath').val();

    $("#submitRegister").click(function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $urlPath + "/user/addUser",
            data: $('#userFormRegister').serialize(),
            success: function (data) {

                if (data && data === 1) {
                    window.location.href = $urlPath + '/user/loginBegin'
                } else {
                    alert(data);
                }
            }
        })
    })


</script>
</body>
</html>