<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>moao注册</title>
	<link href="css/register.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/css/user/register.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var params;
		var urlaction;
		var op;
		$(".chick").click(function(){
			$(this).attr("src","/moaoBBS/user/operate!getvalidate?a="+Math.random());
		});
		$(".validate").blur(function() {
			op=$(this);
			if(op.attr("id")=="mailbox"){
				params= {
						"user.mailbox" : op.val()
					};
				urlaction="${pageContext.request.contextPath }/Chick/CheckEmail";
			}
		});
		Chickajax(op,params,urlaction);
	});
	function Chickajax(op,params,urlaction){
		$.ajax({
			type : "POST",
			url : urlaction,
			data : params,
			dataType : "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
			success : function(json) {
				var obj = $.parseJSON(json); //使用这个方法解析json
				var state_value = obj.result; //result是和action中定义的result变量的get方法对应的
				$(op).nextAll("div .vall").html("<img src='${pageContext.request.contextPath }/images/system/system"+obj.imagename+".jpg' />"+obj.message).show(1000);
			}, 
			error : function(json) {
				alert("json=" + json);
				return false;
			}
		});
	}
	</script>
  </head>
  <body>
  <div class="allpage">
    <div class="maintop">
        	<div><a href="${pageContext.request.contextPath }/#"><img alt="" src="${pageContext.request.contextPath }/images/user/reg_logo.png" /><br /></a></div>
        	<div class="top">
        	<span><a href="#">返回首页</a></span>
            <h3>用户注册</h3>
            <div/>
    </div>
      
	<div class="middle">
   			<div class="left">
            	<form action="${pageContext.request.contextPath }/user/register.action" method="post">
            	<s:token/>
            	<ul>
                	<li><label>邮箱：</label><input id="mailbox" class="validate"  type="text" name="user.mailbox"/><div class="vall">[什么是moao通行证]</div></li>
                    
                    <li><label>密码：</label><input class="validate" type="password" name="user.password"/><div class="vall">4-12个字符</div></li>
                    
                    <li><label>确认密码：</label><input class="validate" type="password" name="password2"/><div class="vall"></div></li>
                    
                    <li><label>昵称：</label><input class="validate" type="text" name="user.nickname" id="nick"/><div class="vall"></div></li>
                    
                    <li><label>验证码：</label><input type="text" name="yzm" id="pass"/><div class="vall"><img class="chick" src="${pageContext.request.contextPath }/user/operate!getvalidate" title="点击更换"/><div/></li>
                    <li class="butt"><label>&nbsp;</label><input type="submit" value="注册"></input><input type="button" value="取消" id="but"></input></li>
                </ul>
             </form>
            </div>
            <div class="right">
              <h3>如果您已是注册用户，请<a href="#">登录</a>&gt;</h3>
            	<ul>
                	<li>在moao，你可以</li>
                    <li><span>·</span>看看这...moao</li>
                    <li><span>·</span>看看那...moao</li>
                    <li><span>·</span>再看看这..moao</li>
                    <li><span>·</span>再看看那..moao</li>
                </ul>
            </div>    
	</div>	
</div>
<%@include file="../common/end.jsp" %>
  </body>
</html>
