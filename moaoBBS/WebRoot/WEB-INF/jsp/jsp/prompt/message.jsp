<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>提示</title>
	
  </head>
  
  <body>
    标题：${promptResult.title }<br>
    内容:${promptResult.message }<br>
 <A href="javascript:history.go(-1)">返回上一页</A>&nbsp;|&nbsp;<A href="javascript:window.close()">返回首页</A>
  </body>
</html>
