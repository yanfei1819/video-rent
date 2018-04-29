<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
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
        <h4>video list</h4>
        <div><input type="text" id="conditionVideo" style="margin: 0;height: 6%" placeholder="search list by name or type"><span style="margin-left: 2%"><a
                class="btn btn-success" onclick="selectUsersByCondition();">search</a></span></div>

        <div class="add" style="margin-left: 91%">
            <c:if test="${isLogin == 'true'}"><a class="btn btn-success " onclick="openadd();">add</a> </c:if>
        </div>

        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>video name</th>
                        <th>video type</th>
                        <th>release date</th>
                        <th>operation</th>
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
                <h3 id="myModalLabel">add video</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="videoForm" onsubmit="return false;">
                    <input type="text" name="videoId" id="videoId" style="display:none">
                    <div class="control-group">
                        <label class="control-label" for="videoName">video name</label>
                        <div class="controls">
                            <input type="text" name="videoName" id="videoName" placeholder="video name" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="videoType">video type</label>
                        <div class="controls">
                            <input type="text" id="videoType" name="videoType" placeholder="video type" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="releaseDate">release date</label>
                        <div class="controls">
                            <input type="text" id="releaseDate" name="releaseDate" placeholder="release date"
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
                <button class="btn" data-dismiss="modal" aria-hidden="true">close</button>
                <button class="btn btn-primary" id="add" onclick="save()">save</button>
                <button class="btn btn-primary" id="edt" onclick="edit();">save</button>
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
        if ($isLogin != 'true'){
            alert('please login!')
            return;
        }
        var condition = $('#conditionVideo').val();
        $.ajax({
            url: $ctx + "/video/findAllByCondition?condition=" + encodeURI(encodeURI(condition)),
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
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + video.videoId + "\");'>modify</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + video.videoId + "\");'>delete</a></td>" +
                        "</tr>";
                    $("#userListBody").html(html);
                }
            }
        })
    }

    function selectVideo() {
        $.ajax({

            url: $ctx + "/video/findAll",
            data: {},
            type: "GET",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var video = list[i];

                    html += "<tr>" +
                        "<td>" + video.videoId + "</td><td>" + video.videoName + "</td><td>" + video.videoType + "</td><td>" + video.releaseDate + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + video.videoId + "\");'>modify</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + video.videoId + "\");'>delete</a></td>" +
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
            url: $ctx + "/video/addVideo",
            data: $('#videoForm').serialize(),
            success: function (data) {
                alert("save success");
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
