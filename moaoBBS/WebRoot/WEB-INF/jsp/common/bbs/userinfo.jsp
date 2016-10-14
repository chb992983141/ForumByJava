<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<!-- 用户信息模块	 -->
<div class="mattertop">
	<div style="float:left; margin-top:5px;">
		<a href="${pageContext.request.contextPath }/#"><img src="${pageContext.request.contextPath }/images/bbs/logo2.png" /></a>
	</div>
	<div class="top">
		<span><c:if test="${landinguser.power!=0 }">
		<c:if test="${landinguser.sex==0 }">
        <img  src="${pageContext.request.contextPath }/images/userPic/little_headpic_woman.png" width="48px;" height="48px;"/>
        </c:if>
        <c:if test="${landinguser.sex==1 }">
		<img src="${pageContext.request.contextPath }/images/userPic/little_headpic_man.png" width="48px;" height="48px;"/>
        </c:if>
        </c:if>
        <c:if test="${landinguser.power==0}">
        <img src="${pageContext.request.contextPath }/images/userPic/little_guest.png" width="48px;" height="48px;"/>
      	</c:if></span>
		
		<div class="top1">
			<ul>
				<li><img
					src="${pageContext.request.contextPath }/images/bbs/icon10.png"/>
					${landinguser.power==0?"- - 游客 - -":landinguser.nickname}
					</li>
				<br/>
				<li></li>
				<li><a href="#">消息</a> |
					<a href="#">通知</a> |
					<a href="#">好友</a> |
					<a href="#">任务</a> |
					<a href="#">个人中心</a> |
				</li>
			</ul>
		</div>
	</div>
</div>