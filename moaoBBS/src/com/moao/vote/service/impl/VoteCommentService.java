package com.moao.vote.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moao.bbs.bean.TopicTitle;
import com.moao.bean.QueryResult;
import com.moao.dao.base.DaoSupport;
import com.moao.vote.bean.VoteComment;
import com.moao.vote.service.IVoteCommentService;

@Transactional
@Service("voteCommentService")
public class VoteCommentService extends DaoSupport implements IVoteCommentService{
	/**
	 * 增加选项
	 * @param comment
	 * @return
	 */
	public boolean addVoteOption(TopicTitle topicTitle,List<VoteComment> votelist){

				em.persist(topicTitle);
				int titleid=topicTitle.getId();
				for(VoteComment comment:votelist){
					comment.setVoteid(titleid);
					em.persist(comment);
				}
				return true;
	}
	/**
	 * 查询对应标题的投票选项
	 * @param comment
	 * @return
	 */
	public QueryResult<VoteComment> getVoteOption(int voteid){
		QueryResult<VoteComment> queryResult=new QueryResult<VoteComment>();
		Query query=(Query) em.createQuery("from VoteComment where voteid=:voteid");
		query.setInteger("voteid", voteid);
		queryResult.setResultlist(query.list());
		return queryResult;
	}
	
}
