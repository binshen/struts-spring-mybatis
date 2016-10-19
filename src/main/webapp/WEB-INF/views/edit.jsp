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
            <div class="box post">
                <h2>修改</h2>
                <form action="/todo!save.do?id=${todo.id}" method="post">
                    <p><input type="text" name="title" class="long_txt" value="${todo.title}" /></p>
                    <p><input type="submit" class="submit" value="提交" /></p>
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