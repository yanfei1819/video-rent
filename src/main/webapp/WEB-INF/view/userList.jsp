<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
        <h4>user list</h4>
        <div><input type="text" id="search" style="margin: 0;height: 6%"><span style="margin-left: 2%"><a class="btn btn-success" onclick="selectUsersByCondition();">search</a></span></div>
        <div class="add" style="margin-left: 91%"><a class="btn btn-success " onclick="openadd();">add</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>user name</th>
                        <th>mobile</th>
                        <th>role</th>
                        <th>age</th>
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
                <h3 id="myModalLabel">add user</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form1">
                    <input type="text" name="userId" id="userId" style="display:none">
                    <div class="control-group">
                        <label class="control-label" for="userName">name</label>
                        <div class="controls">
                            <input type="text" name="name" id="userName" placeholder="name" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="age">name</label>
                        <div class="controls">
                            <input type="text" name="age" id="age" placeholder="age" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="mobile">mobile</label>
                        <div class="controls">
                            <input type="text" id="mobile" name="mobile" placeholder="mobile" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">address</label>
                        <div class="controls">
                            <input type="text" id="address" name="address" placeholder="address" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">password</label>
                        <div class="controls">
                            <input type="text" id="password" name="password" placeholder="password" style="height: 30px">
                        </div>
                    </div>
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
        selectUsers();
    });

    function selectUsersByCondition() {
        var $urlPath = $('#urlPathUser').val();
        var condition = $('#search').val();
        $.ajax({
            url: $urlPath + "/user/findAllByCondition?mobile="+condition,
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var user = list[i];

                    html += "<tr>" +
                        "<td>" + user.userId + "</td><td>" + user.name + "</td><td>" + user.mobile + "</td><td>" + user.roleId + "</td><td>" + user.age + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + user.userId + "\");'>modify</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + user.userId + "\");'>delete</a></td>" +
                        "</tr>";
                }
                $("#userListBody").html(html);
            }
        })
    }


    function selectUsers() {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            url: $ctx + "/user/findAll",
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var user = list[i];
                    html += "<tr>" +
                        "<td>" + user.userId + "</td><td>" + user.name + "</td><td>" + user.mobile + "</td><td>" + user.roleId + "</td><td>" + user.age + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + user.userId + "\");'>modify</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + user.userId + "\");'>delete</a></td>" +
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
            url: $ctx +"/user/addUser",
            data: $('#form1').serialize(),
            success: function (data) {
                alert("save success");
                $("#addModal").modal('hide');
                selectUsers();
            }
        })
    }

    function editOpen(userId) {
        var $urlPath = $('#urlPathUser').val();
        // 获取用户数据并放入弹框
        $.ajax({
            type: "get",
            dataType: "json",
            url: $urlPath + "/user/findUserById?userId=" + userId,
            data: {},
            success: function (data) {
                $("#addModal").modal("show");
                $("#add").hide();
                $("#userName").val(data.name);
                $("#password").val(data.password);
                $("#mobile").val(data.mobile);
                $("#address").val(data.address);
                $("#userId").val(data.userId);
            }
        })
    }

    function edit() {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $urlPath + "/user/updateUser",
            data: $('#form1').serialize(),
            success: function () {
                alert("保存成功");
                selectUsers();
                $("#addModal").hide();
            }
        })
    }

    function del(userId) {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $urlPath + "/user/deleteUser?userId=" + userId,
            data: {},
            success: function (data) {
                selectUsers();
            }
        })
    }

</script>
</body>
</html>
