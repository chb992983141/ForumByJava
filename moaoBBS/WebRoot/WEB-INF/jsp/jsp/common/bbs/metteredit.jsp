<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script charset="utf-8" src="${pageContext.request.contextPath }/js/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/js/kindeditor/lang/zh_CN.js"></script>
<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[id="content1"]', {
					resizeType : 0,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|','bold', 'italic', 'underline','forecolor', 
						 '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons']
				});
			});
</script>
<!-- 编辑器-->
   	<div class="SendMetteredit">
   		<form action="${pageContext.request.contextPath }/bbs/bulidTopic.action" method="post" style="float: left;">
    	<s:token/>
    	<div class="SendTop">
        <p>还可以输入80个字符</p>
        <select name="topicTitle.topicRank">
        <option value="10">普通新帖</option>
        <option value="11">发布投票</option>
        <option value="12">悬赏发帖</option>
        </select>
        <input name="topicTitle.topic"  type="text" />
        </div>
        <div class="edit">
            <li><textarea id="content1" name="topicComment.commentContent" style="width:978px;height:400px;visibility:hidden;"></textarea></li>
            <li class="sendbutton">
            	<ul>
                	<li><input type="submit" value="发&nbsp;表" /></li>
                	<li><input id="cancel" type="button" value="返&nbsp;回" /></li>
                </ul>
            </li>
        <div>
        </form>
    </div>