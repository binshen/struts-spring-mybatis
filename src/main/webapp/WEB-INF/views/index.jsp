<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${site_name}</title>
    <link href="/styles/reset.css" rel="stylesheet" type="text/css" />
    <link href="/styles/index/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page">
    <div class="header box">
        <h1><a href="/">${site_name}</a></h1>
    </div>
    <div class="main box">
        <div class="box">
            <div class="box todos">
                <h2 class="box">待办事项</h2>
                <ul>
                    <c:forEach var="todo" items="${todoList}">
                        <c:choose>
                            <c:when test="${todo.finished == 1}">
                                <li>
                                    <del>${todo.title}</del>&nbsp;
                                    <a href="/todo!finish.do?id=${todo.id}&status=0">恢复</a>,
                                    <a href="/todo!edit.do?id=${todo.id}">修改</a>,
                                    <a href="/todo!delete.do?id=${todo.id}" onclick="return confirm('删除以后不能恢复的，确定？')">删除</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="finished">
                                    ${todo.title}&nbsp;
                                    <a href="/todo!finish.do?id=${todo.id}&status=1">完成</a>,
                                    <a href="/todo!edit.do?id=${todo.id}">修改</a>,
                                    <a href="/todo!delete.do?id=${todo.id}" onclick="return confirm('删除以后不能恢复的，确定？')">删除</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </ul>
            </div>

            <div class="box post">
                <h2>新增</h2>
                <form action="/todo!add.do" method="post" id="post_new">
                    <p><input type="text" name="title" class="long_txt" /></p>
                    <p><input type="submit" class="submit" value="添加" /></p>
                </form>
            </div>

        </div>
    </div>
    <div class="foot">
        Copyright&copy; ${site_name}
        <a href="http://cnodejs.org/">CNode</a>
        <br />
        修改自 <a href="http://simple-is-better.com/news/309">simple-todo: 一个简易的 todo 程序 - web.py 中文教程</a>
        from <a href="http://simple-is-better.com/">Python.cn(news, jobs)</a>
    </div>
</div>
</body>
</html>