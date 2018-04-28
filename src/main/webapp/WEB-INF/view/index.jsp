<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title>视频租赁管理系统</title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index.css" rel="stylesheet"/>
</head>
<body>
<div class="header">
    <img class="logo" src="${pageContext.request.contextPath}/static/images/logo.png"/>
    <label class="logo-title">视频租赁管理系统</label>
    <ul class="inline">
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/client.png"/>&nbsp;&nbsp;欢迎登录视频管理系统
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle mymsg" data-toggle="dropdown" href="#"><img
                    src="${pageContext.request.contextPath}/static/images/32/166.png"/>&nbsp;&nbsp;修改个人信息<b
                    class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="#">修改密码</a></li>
            </ul>
        </li>
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/200.png"/>&nbsp;&nbsp;<a class="loginout" href="#">退出</a>
        </li>
    </ul>
</div>

<div class="nav">
    <ul class="breadcrumb">
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/5025_networking.png"/>
        </li>
        <li><a href="#">首页</a> <span class="divider">>></span></li>
        <li class="active"></li>
    </ul>
</div>

<div class="container-fluid content">
    <div class="row-fluid">
        <div class="span2 content-left">
            <div class="accordion">
                <div class="accordion-group">

                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
                            <img class="left-icon"
                                 src="${pageContext.request.contextPath}/static/images/32/5026_settings.png"/><span
                                class="left-title">视频管理</span>
                        </a>
                    </div>

                    <div id="userManger" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4962_sitemap.png"/><span
                                class="left-body" >用户管理</span>
                        </div>
                    </div>

                    <div>
                        <div class="accordion-inner"  id="goodsManger">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4957_customers.png"/><span
                                class="left-body">视频管理</span>
                        </div>
                    </div>
                    <div>
                        <div class="accordion-inner" id="orderManger">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4992_user.png"/><span
                                class="left-body">消费记录</span>

                        </div>
                    </div>
                    <%--<div>--%>
                        <%--<div class="accordion-inner" id="shoppCarManger">--%>
                            <%--<img class="left-icon-child"--%>
                                 <%--src="${pageContext.request.contextPath}/static/images/32/612.png"/><span--%>
                                <%--class="left-body">购物车管理</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </div>
            </div>
        </div>

        <div class="span10 content-right" id="innerHtml">
            <iframe src="" width="100%" height="98%" marginheight="0"
                    marginwidth="0" frameborder="0" scrolling="auto" allowtransparency="true" id="taskConfigIframe"></iframe>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="foot"></div>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>

    <script>
        $(function () {
            $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/userList');
        });

        function skip(emun) {
            if(emun===1){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/userList');
            }else if(emun===2){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/video');
            }else if(emun===3){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/consume');
            }else{
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/shoppCar');
            }
        }

        $("#userManger").on("click",function () {
            skip(1)
        })

        $("#goodsManger").on("click",function () {
            skip(2)
        })

        $("#orderManger").on("click",function () {
            skip(3)
        })

        $("#shoppCarManger").on("click",function () {
            skip(4)
        })

    </script>
</div>

</body>
</html>
