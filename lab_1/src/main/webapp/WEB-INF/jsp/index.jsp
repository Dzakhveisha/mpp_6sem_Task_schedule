<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
    <title>Tasks</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        <%@include file="/WEB-INF/css/main.css" %>
    </style>
</head>

<body>
<h1 class="mx-auto">My task List</h1>

<div id="tasks" class="d-flex flex-column justify-content-center m-3">
    <button id="btnNew" class="btn btn-outline-success my-3"
            onclick="window.location.href = '${pageContext.request.contextPath}/taskList/showNewTask'">
        Create new Task
    </button>
    <div id="filtering" class="d-flex justify-content-around m-1">
        <a class="link-dark" href="${pageContext.request.contextPath}/taskList">All tasks </a>
        <a class="link-dark" href="${pageContext.request.contextPath}/taskList/filter?status=AWAIT">AWAIT tasks </a>
        <a class="link-dark" href="${pageContext.request.contextPath}/taskList/filter?status=EXPIRED">EXPIRED tasks </a>
        <a class="link-dark" href="${pageContext.request.contextPath}/taskList/filter?status=DONE">DONE tasks </a>
    </div>
    <c:forEach items="${tasks}" var="task">
        <div class="my-2 border border-secondary">
            <div class="task row d-flex justify-content-between align-items-center my-2">
                <h3 class=" taskName col-2">${task.name}</h3>
                <p class=" taskDesc col-6">${task.description}</p>
                <div class=" col-1">
                    <p><b>deadline:</b> ${task.deadlineDateString}</p>
                    <p><b>status:</b> ${task.status}</p>
                </div>
                <div class="col-1">
                    <button class="btn btn-success m-1">
                    <span class="material-icons"
                          onclick="window.location.href = '${pageContext.request.contextPath}/taskList/done?id=${task.id}'">
                        done</span>
                    </button>
                    <button class="btn btn-light m-1"
                            onclick="window.location.href = '${pageContext.request.contextPath}/taskList/delete?id=${task.id}'">
                        <span class="material-icons">delete</span>
                    </button>
                </div>
                <c:if test="${task.fileName != null}">
                    <div class="files">
                        <span> Additional file: </span>
                        <a href="${pageContext.request.contextPath}/taskList/downloadFile?filename=${task.fileName}"> ${task.fileName}</a>
                    </div>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>

</body>
</html>