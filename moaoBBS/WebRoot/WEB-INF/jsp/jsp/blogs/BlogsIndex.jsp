<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional.dtd//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>博客首页</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/css/blogs/blogsindex.css"
	type="text/css"></link>
</head>
<body>
	<!-- 
  <script type="text/javascript"src=" http://v1.jiathis.com/code/jiathis_r.js"charset="utf-8"></script>
   -->
	<!-- 网页top -->
	<jsp:include page="top.jsp"></jsp:include>
	<div class="blogs_main">
		<!-- 网页heard -->
		<jsp:include page="heard.jsp"></jsp:include>
		<div class="blogs_maincenter">
			<div class="blogs_left">
				<div class="person_data">
					<div class="person_data1">
						<h5>头像</h5>
					</div>
					<div>
						<div class="person_data2">
							<a href="#"><img class="icon" src="../images/userpic.png" />
							</a><br /> <a href="#">moao</a>
						</div>
						<div class="person_data3">
							<ul>
								<li><a href="<%=path%>/blogs/photogroup!getFenYe.action"><img
										src="<%=path%>/images/blogs/xiangce.gif" /> 查看相册</a> <a
									href="<%=path%>/blogs/messages!getPaging.action"><img
										src="<%=path%>/images/blogs/message.png" /> 给我留言</a></li>
								<li><a href="<%=path%>/blogs/log!getFenYe.action"><img
										src="<%=path%>/images/blogs/log2.gif" /> 瞧瞧日志</a> <a
									href="<%=path%>/blogs/mood!getFenYe.action"><img
										src="<%=path%>/images/blogs/fenxiang.png" /> 一起分享</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="person_sta">
					<div class="person_data1">
						<h5>统计信息</h5>
					</div>
					<div class="person_data2">

						<ul>
							<p>
								已有<a class="red">301</a>人来访过
							</p>
							<li>积分：<a href="#">10010</a>
							</li>
							<li>经验：<a href="#">1233</a>
							</li>
							<li>金币: <a href="#">215</a>
							</li>
							<li>魅力：<a href="#">454</a>
							</li>
							<li>日志：<a href="#">23</a>
							</li>
							<li>主题：<a href="#">12</a>
							</li>
							<li>分享：<a href="#">--</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="person_record">
					<div class="person_data1">
						<h5>记录</h5>
					</div>

				</div>
			</div>
			<div class="blogs_center">
				<div class="person_da">
					<div class="person_data1">
						<h5>个人资料</h5>
					</div>
					<div class="person_da1">
						<ul>
							<li>性别：男</li>
							<li>年龄：21</li>
							<li>居住地：湖北武汉</li>
							<li>星座：摩羯座</li>
						</ul>
						<span><a href="#">查看全部个人信息</a>
						</span>
					</div>
				</div>
				<div class="person_trends">
					<div class="person_data1">
						<h5>动态-->最新</h5>
					</div>
					<div class="person_trends1">
						<a href="<%=path%>/blogs/photogroup!getFenYe.action"><img
							src="<%=path%>/images/blogs/photo/7.jpg">
						</a>
					</div>
				</div>
				<div class="person_log">
					<div class="person_data1">
						<h5>日志</h5>
					</div>
					<div class="person_log1">
						<ul>
							<s:iterator var="l" value="#request.list">

								<li><span>${l.date}</span><a
									href="<%= path%>/blogs/log!myLog.action?blogsLog.id=${l.id}">${
										l.log_title}</a></li>
							</s:iterator>
						</ul>
					</div>
				</div>
				<div class="person_leaveword">
					<div class="person_data1">
							<a id="a" href="<%=path %>/blogs/messages!getPaging.action"><h5>留言</h5></a>
					</div>
					<div class="person_leaveword1">
						<ul>
							<table width="400">
								<s:iterator var="l" value="#request.mlist">
									<tr>
										<td width="80" valign="top"
											style="text-align:center; border-bottom:1px dashed #CCCCCC;">
											<img class="person_leavewordimg"
											src="<%=path%>/images/blogs/touxiang.png" /></td>
										<td width="370" style="border-bottom:1px dashed #CCCCCC;">
											<div class="person_leaveword3">
												<a href="#"></a>${l.date }
											</div>
											<div class="person_leaveword4">${l.mood }</div></td>
									</tr>
								</s:iterator>
							</table>
						</ul>
					</div>
				</div>
			</div>
			<div class="blogs_right">
				<div class="person_guest">
					<div class="person_data1">
						<a href="<%=path %>/blogs/mood!getFenYe.action"><h5>心情</h5></a>
						<table width="200">
							<s:iterator var="l" value="#request.meslist">
								<tr>
									<td width="80" valign="top"
										style="text-align:center; border-bottom:1px dashed #CCCCCC;">
										<img class="person_leavewordimg"
										src="<%=path%>/images/blogs/touxiang.png" /></td>
									<td class="moodtd">
										<div class="person_leaveword5">
											<a href="#"></a>${l.date }
										</div>
										<div class="person_leaveword6">${l.message }</div>
										</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 网页底部 -->
	<jsp:include page="../common/end.jsp" />
</body>
</html>
