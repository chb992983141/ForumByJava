package com.moao.vote.service;

import java.util.List;

import com.moao.bbs.bean.TopicTitle;
import com.moao.bean.QueryResult;
import com.moao.vote.bean.VoteComment;

public interface IVoteCommentService {
	public abstract boolean addVoteOption(TopicTitle topicTitle,List<VoteComment> votelist);
	public abstract QueryResult<VoteComment> getVoteOption(int voteid);
}
