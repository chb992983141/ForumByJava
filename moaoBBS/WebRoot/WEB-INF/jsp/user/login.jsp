<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link href="${pageContext.request.contextPath }/css/bbs/login.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	if($("#text").text()==1){
		parent.document.getElementById("Panel").style.display = 'none';
	 	parent.document.getElementById("fade").style.display='none';
	 	parent.location.reload();
	}
	$(".zhanghao").focus(function(){
		$("#prompt").empty();
	});
});
</script>
</head>
<body>
		<c:if test="${landinguser.power!=0}">
        <div style="display:none;" id="text">1</div>
        </c:if>
        <c:if test="${landinguser.power==0}">
        <div style="display:none;" id="text">0</div>
        </c:if>
    <div class="login_main">
    	<div class="cennav">
       <table width="384" border="0" height="150">
       <form action="<s:url action="/user/login.action"></s:url>" id="form1" method="post">
       <s:token/>
       	  <tr>
            <td width="80"></td>
            <td width="300"><div id="prompt">${promptresult.message }</div></td>
          </tr>
          <tr>
            <td>账号</td>
            <td><input name="user.mailbox" type="text" class="zhanghao" /></td>
          </tr>
          <tr>
            <td>密码</td>
            <td><input name="user.password" type="password" class="zhanghao" /></td>
         </tr>
          <tr>
            <td colspan="2"><li class="zhuangtai"><input id="check" type="checkbox" value="" />记住我的登陆状态</li></td>
          </tr>
          <tr>
            <td colspan="2"><span><a href="#"> 忘记密码？</a></span><a href="javascript:void(0)" onclick="document.getElementById('form1').submit()" id="denglu">登 录</a></td>
         </tr>
         <form>
        </table>
      </div>
        <div class="endnav">
        <li>Welcome to the SCUEC forum ! If you do not have an account, please return to the home page click on the registration button to register an account.Thank you.</li>
        </div>
        
    </div>
</body> 
</html>