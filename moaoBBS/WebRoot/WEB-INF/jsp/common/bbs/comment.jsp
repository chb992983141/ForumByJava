<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--内容-->
	
   <div class="metternav">
    	<ul>
        <li class="titleli">查看: ${queryResult.resultlist.get(0).topictitleid.chickNum }|回复: ${queryResult.resultlist.get(0).topictitleid.answerNum }</li>
        <li class="titleli1"><a>${queryResult.resultlist.get(0).topictitleid.topic }</a></li>
        </ul>
    </div>
    <div class="metter">
    		<c:forEach var="result" items="${queryResult.resultlist }" varStatus="nowpage">
    		<div class="metter1">
                <div class="li1">
                <div class="show_user_info" style="display:none"></div>
                	<ul>
                    	<li class="li1first"><h3><a href="${pageContext.request.contextPath }/blogs/log?user.id=${result.userid.id}">${result.userid.nickname }</a></h3></li>
                    	<div id="show_user_info" style="display:none;"></div>
                        <li class="headpic">
                        <c:if test="${result.userid.sex ==1}">
                        <img src="${pageContext.request.contextPath }/images/user/userpic_man.png" id="${result.userid.id }" class="mouse_img" width="130" height="130" />
                        </c:if>
                        <c:if test="${result.userid.sex ==0}">
                        <img src="${pageContext.request.contextPath }/images/user/userpic_woman.png" id="${result.userid.id }" class="mouse_img" width="130" height="130" />
                        </c:if>
                        </li>
                        <li class="userinfo">
                        <div>
                        	<ul>
                        	<!-- 判断用户等级 0-4 -->
                        	<c:if test="${result.userid.grade <=4}">
                        	<li>翰林院：侍读</li>
                        	</c:if>
                        	<!-- 判断用户等级 5-20 -->
                        	<c:if test="${result.userid.grade >4 && result.userid.grade <=20 }">
                        	<li>翰林院：侍讲</li>
                        	</c:if>
                        	<!-- 判断用户等级 20+ -->
                        	<c:if test="${result.userid.grade >20}">
                        	<li>翰林院：学士</li>
                        	</c:if>
                            <li><a class="rank"></a></li>
                            <li><label>积分</label>${result.userid.integral }</li>
                            <li><label>魅力</label>${result.userid.charm }</li>
                            <li><label>贡献度</label>${result.userid.contribute }</li>
                            <%-- <li><label>在线时长</label>${result.userid.onlinetime }</li> --%>
                            <li><label></label></li>
                            
                            <li>
                            <label><a class="gettoblogs"></a>私信</label><a class="addfriend"></a>加友
                            </li>
                            <li>
                            <label><a class="call"></a>主页</label><a class="send"></a>邮件
                            </li>
                            </ul>
                        </div>
                        </li>
                    </ul>
                </div>
                <div class="li2">
                	<ul>
                    	<li class="li2first"><span>#${ (queryResult.nowpage-1)*10+nowpage.count}</span><a class="img"></a>&nbsp;发帖时间：${result.answertime }</li>
                        <li class="li2second">
                        <div class="mettermain">
                        	<div class="li2third">
                            ${result.commentContent }
                            </div>
                            <div class="li24">
                            <ul>
                            <!-- <li><a class="answer"></a>说两句</li> 加入用户是否登录的判断-->
                            <li><span>
                            <c:if test="${landinguser.power!=0}">
	        				<a href='javascript:void(0)' onclick='openDialog("reply");' > <img src="${pageContext.request.contextPath }/images/bbs/icon17.png"/>说两句</a>
	        				</c:if>
	        				<c:if test="${landinguser.power==0}">
	        				<a  href="javascript:void(0)" onclick="showPanel();"> <img src="${pageContext.request.contextPath }/images/bbs/icon17.png"/>说两句</a>
	        				</c:if>
                            </span></li>
                            <li><a class="praise"  href="${pageContext.request.contextPath }/bbs/addPraise?topicComment.id=${result.id }&topicTitle.id=${result.topictitleid.id }"></a>[${result.praise }]</li>
                            <li><a class="bad" href="${pageContext.request.contextPath }/bbs/addBad?topicComment.id=${result.id }&topicTitle.id=${result.topictitleid.id }"></a>[${result.bad }]</li>
                            </ul>
                            </div>
                        </div>
                        </li>
                    </ul>
                </div>
            </div>
            </c:forEach>
    </div>