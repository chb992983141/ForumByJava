package com.moao.bbs.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moao.bbs.bean.TopicComment;
import com.moao.bbs.bean.TopicTitle;
import com.moao.bbs.service.IServiceTopic;
import com.moao.bbs.service.impl.ServiceTopicImpl;
import com.moao.bean.PromptResult;
import com.moao.bean.QueryHotUserResult;
import com.moao.bean.QueryResult;
import com.moao.user.action.ActionUser;
import com.moao.user.bean.User;
import com.moao.vote.bean.VoteComment;
import com.moao.vote.service.IVoteCommentService;
import com.moao.vote.service.impl.VoteCommentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("actionBBS")@Scope("prototype")
public class ActionBBS extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final Logger logger = Logger.getLogger(ActionBBS.class.getName());
	private TopicTitle topicTitle;
	private TopicComment topicComment;
	@Resource(name="promptResult") private PromptResult promptResult;
	@Resource(name="serviceTopic")private IServiceTopic SericeTopic;
	private QueryResult<TopicComment> queryResult;
	private QueryHotUserResult<User> queryHotUserResult;
	private String [] voteoption=null;
	@Resource(name="voteCommentService")private IVoteCommentService voteservice=null;
	/**
	 * 发表主题
	 * @return
	 */
	public String bulidTopic(){
		User landinguser=(User) ActionContext.getContext().getSession().get("landinguser");
		topicTitle.setUserid(new User(landinguser.getId()));
		if(topicTitle.getTopicRank()==10){
			topicComment.setUserid(new User(landinguser.getId()));
			boolean flag= SericeTopic.addTopic(topicTitle, topicComment);
			if(flag){
				promptResult.setImagename(6);
				promptResult.setTitle("成功");
				promptResult.setMessage("发帖成功");
			}
		}
		if(topicTitle.getTopicRank()==11){
			List<VoteComment> votelist=new ArrayList<VoteComment>();
			for(String option:voteoption){
				if(!option.equals("")){
					VoteComment vote=new VoteComment();
					vote.setVoteoptionname(option);
					vote.setVoteoptionsum(0);
					votelist.add(vote);
				}
			}
			voteservice.addVoteOption(topicTitle, votelist);
			promptResult.setImagename(6);
			promptResult.setTitle("成功");
			promptResult.setMessage("投票发布成功");
		}
		
		return "message";
	}
	/**
	 * 得到主题
	 * @return
	 */
	public String topicTitle(){
		if(queryResult!=null&&queryResult.getNowpage()>1){
			queryResult=SericeTopic.findTopicTitle(queryResult.getNowpage());
		}else{
			queryResult=SericeTopic.findTopicTitle(1);
		}
		return "index";
	}
	/**
	 * 得到热门斑竹
	 * 
	 */
	public String hotUser(){
		System.out.println("hot user...");
		queryHotUserResult = SericeTopic.findHotUser();
		return "index";
	}
	
	/**
	 * 添加评论
	 * @return
	 */
	public String addComment(){
		User landinguser=(User) ActionContext.getContext().getSession().get("landinguser");
		topicComment.setUserid(new User(landinguser.getId()));
		topicComment.setTopictitleid(topicTitle);
		if(SericeTopic.addTopicComment(topicComment)){
			topicTitle.setId(topicTitle.getId());
			return SUCCESS;
		}
		promptResult.setImagename(8);
		promptResult.setTitle("错误");
		promptResult.setMessage("评论失败了");
		return "message";
	}
	/**
	 * 添加赞
	 * @return
	 */
	public String addPraise(){
		int topicCommentid = topicComment.getId();
		int topicTitleid = topicTitle.getId();
		if(SericeTopic.addTopicPraise(topicCommentid)){
			topicTitle.setId(topicTitleid);
			return SUCCESS;
		}
		promptResult.setImagename(8);
		promptResult.setTitle("错误");
		promptResult.setMessage("【赞~(≧▽≦)~】失败了");
		return "message";
	}
	/**
	 * 添加踩
	 * @return
	 */
	public String addBad(){
		int topicCommentid = topicComment.getId();
		int topicTitleid = topicTitle.getId();
		if(SericeTopic.addTopicBad(topicCommentid)){
			topicTitle.setId(topicTitleid);
			return SUCCESS;
		}
		promptResult.setImagename(8);
		promptResult.setTitle("错误");
		promptResult.setMessage("【赞~(≧▽≦)~】失败了");
		return "message";
	}
	
	/**
	 * 得到评论
	 * @return
	 */
	public String metter(){
		int id=topicTitle.getId();
		int nowpage;
		if(queryResult==null||queryResult.getNowpage()==0){
			nowpage=1;
		}else{
			nowpage=queryResult.getNowpage();
		}
		if(id>0){
			queryResult=SericeTopic.findComment(id,nowpage);
		}
		return "metter";
	}
	public PromptResult getPromptResult() {
		return promptResult;
	}
	public void setPromptResult(PromptResult promptResult) {
		this.promptResult = promptResult;
	}
	public TopicTitle getTopicTitle() {
		return topicTitle;
	}
	public void setTopicTitle(TopicTitle topicTitle) {
		this.topicTitle = topicTitle;
	}
	public QueryResult<TopicComment> getQueryResult() {
		return queryResult;
	}
	public void setQueryResult(QueryResult<TopicComment> queryResult) {
		this.queryResult = queryResult;
	}
	public TopicComment getTopicComment() {
		return topicComment;
	}
	public void setTopicComment(TopicComment topicComment) {
		this.topicComment = topicComment;
	}
	public String[] getVoteoption() {
		return voteoption;
	}
	public void setVoteoption(String[] voteoption) {
		this.voteoption = voteoption;
	}
	public void setVoteservice(VoteCommentService voteservice) {
		this.voteservice = voteservice;
	}
	public QueryHotUserResult<User> getQueryHotUserResult() {
		return queryHotUserResult;
	}
	public void setQueryHotUserResult(QueryHotUserResult<User> queryHotUserResult) {
		this.queryHotUserResult = queryHotUserResult;
	}

}
