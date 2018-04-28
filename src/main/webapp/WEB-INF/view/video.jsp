<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index2.css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPathUser">
<div class="container-fluid">
    <div class="row-fluid">
        <h4>视频列表</h4>
        <div><input type="text" id="conditionVideo" style="margin: 0;height: 6%" placeholder="根据视频名称或者类型查询"><span style="margin-left: 2%"><a
                class="btn btn-success" onclick="selectUsersByCondition();">查询</a></span></div>
        <div class="add" style="margin-left: 91%"><a class="btn btn-success " onclick="openadd();">新增</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>视频编号</th>
                        <th>视频名称</th>
                        <th>视频类型</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="userListBody"></tbody>
                </table>
                <div id="page" class="userListBody">

                </div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">添加视频</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="videoForm">
                    <input type="text" name="videoId" id="videoId" style="display:none">
                    <div class="control-group">
                        <label class="control-label" for="videoName">视频名称</label>
                        <div class="controls">
                            <input type="text" name="videoName" id="videoName" placeholder="视频名称" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="videoType">视频类型</label>
                        <div class="controls">
                            <input type="text" id="videoType" name="videoType" placeholder="视频类型" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="releaseDate">发布日期</label>
                        <div class="controls">
                            <input type="text" id="releaseDate" name="releaseDate" placeholder="发布日期"
                                   style="height: 30px">
                        </div>
                    </div>

                    <%--<div class="control-group">--%>
                    <%--<label class="control-label" for="password">密码</label>--%>
                    <%--<div class="controls">--%>
                    <%--<input type="text" id="password" name="password" placeholder="密码" style="height: 30px">--%>
                    <%--</div>--%>
                    <%--</div>--%>

                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="add" onclick="save()">保存</button>
                <button class="btn btn-primary" id="edt" onclick="edit();">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/content.js"></script>

<script>
    $(function () {
        selectVideo();
    });

    function selectUsersByCondition() {
//        var $urlPath = $('#urlPathVideo').val();
        var condition = $('#conditionVideo').val();
        $.ajax({
            url: "/video-rent/video/findAllByCondition?condition=" + encodeURI(encodeURI(condition)),
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var video = list[i];

                    html += "<tr>" +
                        "<td>" + video.videoId + "</td><td>" + video.videoName + "</td><td>" + video.videoType + "</td><td>" + video.releaseDate + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + video.videoId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + video.videoId + "\");'>删除</a></td>" +
                        "</tr>";
                    $("#userListBody").html(html);
                }
            }
        })
    }

    function selectVideo() {
//        var $urlPath = $('#urlPathVideo').val();
        $.ajax({

            url: "/video-rent/video/findAll",
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var video = list[i];

                    html += "<tr>" +
                        "<td>" + video.videoId + "</td><td>" + video.videoName + "</td><td>" + video.videoType + "</td><td>" + video.releaseDate + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + video.videoId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + video.videoId + "\");'>删除</a></td>" +
                        "</tr>";
                    $("#userListBody").html(html);
                }
            }
        })
    }

    // 此处如果用jQuery绑定事件，则获取不到$urlPath
    function save() {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/video-rent/video/addVideo",
            data: $('#videoForm').serialize(),
            success: function (data) {
                alert("保存成功");
                selectVideo();
                $("#addModal").hide();
            }
        })
    }

    function editOpen(videoId) {
        var $urlPath = $('#urlPathUser').val();
        // 获取用户数据并放入弹框
        $.ajax({
            type: "get",
            dataType: "json",
            url: $urlPath + "/video/findVideoById?videoId=" + videoId,
            data: {},
            success: function (data) {
                $("#addModal").modal("show");
                $("#add").hide();
                $("#videoName").val(data.videoName);
                $("#videoType").val(data.videoType);
                $("#releaseDate").val(data.releaseDate);
                $("#videoId").val(data.videoId);
            }
        })
    }

    function edit() {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $urlPath + "/video/updateVideo",
            data: $('#videoForm').serialize(),
            success: function () {
                alert("保存成功");
                selectVideo();
                $("#addModal").hide();
            }
        })
    }

    function del(videoId) {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $urlPath + "/video/deleteVideo?videoId=" + videoId,
            data: {},
            success: function (data) {
                selectVideo();
            }
        })
    }

</script>
</body>
</html>
