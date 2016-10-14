package com.junit;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.moao.bbs.bean.TopicComment;
import com.moao.bbs.bean.TopicTitle;
import com.moao.user.bean.User;
import com.moao.user.service.IServiceUser;
import com.moao.vote.bean.VoteComment;
import com.moao.vote.service.IVoteCommentService;

import junit.framework.TestCase;

public class TestOfvote extends TestCase {
	
	public void testvote(){
		ApplicationContext ctx=new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/applicationContext/applicationContext.xml");
		IVoteCommentService iVoteCommentService= (IVoteCommentService) ctx.getBean("voteCommentService");
		TopicTitle topictitle=new TopicTitle();
		User user=new User();
		user.setId(1);
		TopicComment topicComment=new TopicComment();
		topicComment.setCommentContent("内容");
		topicComment.setUserid(user);
		topictitle.setTopic("测试第1个VOTE");
		topictitle.setUserid(user);
		String[] voteoption={"asd","asd","3asdasd"};
		List<VoteComment> votelist=new ArrayList<VoteComment>();
		for(String option:voteoption){
			if(!option.equals("")){
				VoteComment vote=new VoteComment();
				vote.setVoteoptionname(option);
				vote.setVoteoptionsum(0);
				votelist.add(vote);
			}
		}
		
		iVoteCommentService.addVoteOption(topictitle, votelist);
	}
	public void date() throws ParseException{
		ApplicationContext ctx=new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/applicationContext/applicationContext.xml");
		IServiceUser ser=(IServiceUser) ctx.getBean("serviceuser");
		User user= ser.selUserInfo(1);
		System.out.println(user.getRegistertime());
	}
}
