package com.moao.bbs.service.impl;

import javax.persistence.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.moao.bbs.bean.TopicComment;
import com.moao.bbs.bean.TopicTitle;
import com.moao.bbs.service.IServiceTopic;
import com.moao.bean.QueryHotUserResult;
import com.moao.bean.QueryResult;
import com.moao.dao.base.DaoSupport;
import com.moao.user.bean.User;

@Transactional
@Service("serviceTopic")
public class ServiceTopicImpl extends DaoSupport implements IServiceTopic {

	public boolean addTopic(TopicTitle topicTitle,TopicComment topicComment) {
		User user= em.find(User.class, topicTitle.getUserid().getId());
		user.setIntegral(user.getIntegral()+1);
		user.setContribute(user.getContribute()+5);
		em.merge(user);
		em.persist(topicTitle);
		topicComment.setTopictitleid(topicTitle);
		em.persist(topicComment);
		return true;
	}
	public boolean addTopicComment(TopicComment topicComment) {
		try{
			User user=em.find(User.class, topicComment.getUserid().getId());
			TopicTitle topicTitle=em.find(TopicTitle.class, topicComment.getTopictitleid().getId());
			//添加贡献度
			//添加回复+1
			topicTitle.setAnswerNum(topicTitle.getAnswerNum()+1);
			user.setContribute(user.getContribute()+2);
			em.merge(user);
			em.persist(topicComment);
//			this.save(topicComment);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	public boolean addTopicPraise(int topicCommentid) {
		try{
			TopicComment topicC=em.find(TopicComment.class, topicCommentid);
			//赞+1
			topicC.setPraise(topicC.getPraise()+1);
			em.merge(topicC);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	public boolean addTopicBad(int topicCommentid) {
		try{
			TopicComment topicC=em.find(TopicComment.class, topicCommentid);
			//踩+1
			topicC.setBad(topicC.getBad()+1);
			em.merge(topicC);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<TopicComment> findTopicTitle(int startnumber) {
		QueryResult<TopicComment> queryResult=new QueryResult<TopicComment>();
		Query query=em.createQuery("select topiccomment from TopicComment topiccomment where topiccomment.answertime in (select max(topiccomment.answertime)from topiccomment group by topiccomment.topictitleid) ORDER BY topiccomment.answertime desc");
		query.setFirstResult((startnumber-1)*25);
		query.setMaxResults(25);
		queryResult.setResultlist(query.getResultList());
		query=em.createQuery("select count(o) from TopicTitle o where o.topicRank>=10");
		queryResult.setTotalrecord((Long) query.getSingleResult());
		queryResult.setNowpage(startnumber);
		return queryResult;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<TopicComment> findComment(int topicTitleid,int startnumber) {
		QueryResult<TopicComment> queryResult=new QueryResult<TopicComment>();
		Query query=em.createQuery("select topiccomment from TopicComment topiccomment where topictitleid="+topicTitleid+" ORDER BY topiccomment.answertime asc");

		query.setFirstResult((startnumber-1)*10);
		query.setMaxResults(10);
		queryResult.setResultlist(query.getResultList());
		query=em.createQuery("select count(o) from TopicComment o where o.topictitleid="+topicTitleid);
		queryResult.setTotalrecord((Long) query.getSingleResult());
		queryResult.setCommentid(topicTitleid);
		queryResult.setNowpage(startnumber);
		return queryResult;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryHotUserResult<User> findHotUser() {
		System.out.println("find hot user impl...");
		QueryHotUserResult<User> queryHostUserResult = new QueryHotUserResult<User>();
		Query query = em.createQuery("select user form User user where user.integral in (select max(user.integral)form user group by user.userid) ORDER BY user.integral desc");
		queryHostUserResult.setResultlist(query.getResultList());
		
		return queryHostUserResult;
	}
}
