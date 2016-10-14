package com.moao.bbs.service;

import com.moao.bbs.bean.TopicComment;
import com.moao.bbs.bean.TopicTitle;
import com.moao.bean.QueryHotUserResult;
import com.moao.bean.QueryResult;
import com.moao.user.bean.User;

public interface IServiceTopic {

	/**
	 * 发表一个主题
	 * @param topicTitle 主题实体
	 * @param topicComment 评论实体
	 * @return
	 */
	public boolean addTopic(TopicTitle topicTitle,TopicComment topicComment);
	/**
	 * 发表评论
	 * @param topicComment 评论实体
	 * @return
	 */
	public boolean addTopicComment(TopicComment topicComment);
	/**
	 * 赞
	 * @param topicCommentid 具体评论的ID
	 * @return
	 */
	public boolean addTopicPraise(int topicCommentid);
	/**
	 * 踩
	 * @param topicCommentid 具体评论的ID
	 * @return
	 */
	public boolean addTopicBad(int topicCommentid);
	/**
	 * 查找主题最后回复的25
	 * @param Startnumber 页数
	 * @return
	 */
	public QueryResult<TopicComment> findTopicTitle(int startnumber);
	/**
	 * 查找积分最高的用户
	 * @param
	 * @return
	 */
	public QueryHotUserResult<User> findHotUser();
	/**
	 * 查找主题的评论
	 * @param topicTitleid 主题id
	 * @param startnumber 开始页数
	 * @return
	 */
	public QueryResult<TopicComment> findComment(int topicTitleid,int startnumber);
}
