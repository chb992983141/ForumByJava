<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="titlematter">
	<div class="titletop">
		<table class="table1" width="980" border="0" height="36px">
			<tr>
				<td width="5%">&nbsp;</td>
				<td width="55%">主题</td>
				<td width="15%">作者</td>
				<td width="10%">回复/查看</td>
				<td width="15%">最后发表</td>
			</tr>
		</table>
	</div>
	<div class="tmatter">
		<table id="table2" width="980" height="25px" border="0">
		<c:forEach var="art" items="${queryResult.resultlist}">
				<tr>
					<td width="5%"><li class="titleimg"><img
							src="${pageContext.request.contextPath }/images/bbs/pagerank/tl1.gif" />
					</li>
					</td>
					<td width="55%"><h4 id="spill">
							<a href="${art.topictitleid.id }">${art.topictitleid.topic }</a>
						</h4>
					</td>
					<td width="18%" class="spillname">
						<li><a href="#" class="name">${art.topictitleid.userid.nickname }</a></li>
						<li class="date" id="time">${art.topictitleid.releaseTime }</li></td>
					<td width="10%" class="spilloth">
						<li class="huifu">${art.topictitleid.answerNum }</li>
						<li class="date">${art.topictitleid.chickNum }</li></td>
					<td width="12%" class="spilllase">
						<li><a href="#" class="name">${art.userid.nickname }</a></li>
						<li class="date" id="time">${art.answertime }</li></td>
				</tr>
		</c:forEach>
		</table>
	</div>
</div>