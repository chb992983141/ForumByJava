package com.moao.user.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.moao.dao.base.DaoSupport;
import com.moao.user.action.ActionUser;
import com.moao.user.bean.Invitecode;
import com.moao.user.bean.User;
import com.moao.user.service.IServiceUser;

@Service("serviceuser")
@Transactional
public class ServiceUserImpl extends DaoSupport implements IServiceUser {
	protected static final Logger logger = Logger.getLogger(ServiceUserImpl.class.getName());
	
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public User login(User landinguser) {
		LinkedHashMap<String,String> linkedhashmap=new LinkedHashMap<String,String>();
		linkedhashmap.put("mailbox",landinguser.getMailbox());
		linkedhashmap.put("password",landinguser.getPassword());
		List<User> list=this.find(User.class, linkedhashmap);
		if(list.size()==1){
			User us= list.get(0);
			landinguser.setNickname(us.getNickname());
			landinguser.setPower(us.getPower());
			landinguser.setId(us.getId());
			landinguser.setSex(us.getSex());
			return landinguser;
		}
		return null;
	}
	public boolean register(User user){
		boolean flag=false;
		String checking = null;
		checking =  user.getChecking();
		if(checking != null){
			List<Invitecode> CheckList=new ArrayList<Invitecode>();
			Query query = em.createQuery("select o from Invitecode o where o.invitecode=:invitecode");
			query.setParameter("invitecode", checking);
			try{
				CheckList = query.getResultList();
				 int checkid = CheckList.get(0).getId();
				 int eff = CheckList.get(0).getEffective();
				 Invitecode incode = em.find(Invitecode.class, checkid);
				 incode.setEffective(eff+1);
				 em.merge(incode);
			 }catch (Exception e) {
				 logger.error("邀请码更新[Effective]的过程中出现未知错误，详细原因如下："+e.getMessage().toString());
				 return false;
			 }
		}
		if(user!=null){
			this.save(user);
			flag=true;
		}
		return flag;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public boolean checkMailbox(String mailbox) {
		Query query= em.createQuery("select o from User o where o.mailbox=:mailbox");
		query.setParameter("mailbox", mailbox);
		try{
			query.getSingleResult();
		}catch(Exception e){
			if(e.getMessage().equals("No entity found for query")){
				return false;
			}
		}
		return true;
	}
	/**
	  * 检测邀请码
	  * */
	public boolean checkCode(String chicking) {
		int maxNum = 2;//每个邀请码最多两个人使用
		 List<Invitecode> CheckList=new ArrayList<Invitecode>();
		 Query query = em.createQuery("select o from Invitecode o where o.invitecode=:invitecode");
		 query.setParameter("invitecode", chicking);
		 try{
			 CheckList = query.getResultList();
			 if(CheckList.size()==0){
				 logger.info("邀请码[invitecode="+chicking+"]无效...");
				 return false;
			 }else if(CheckList.size()==1 && CheckList.get(0).getEffective()>=maxNum){
				 logger.info("邀请码[invitecode="+chicking+"]已经注册过了...");
				 return false;
			 }else{
				 /*try{
					 int id = CheckList.get(0).getId();
					 int eff = CheckList.get(0).getEffective();
					 Invitecode incode = em.find(Invitecode.class, id);
					 incode.setEffective(eff+1);
					 em.merge(incode);
				 }catch (Exception e) {
					 logger.error("邀请码更新[Effective]的过程中出现未知错误，详细原因如下："+e.getMessage().toString());
					 return false;
				 }*/
				 return true;
			 }
		 }catch (Exception e) {
			 logger.error("邀请码认证过程中出现未知错误，详细原因如下："+e.getMessage().toString());
			 return false;
		}
	}
	/**
	  * 修改用户信息
	  */
	 public void updUserInfo(User user){
		 em.merge(user);
	 }
	 /**
	  * 查询用户信息
	  */
	 public User selUserInfo(int userid){
		 return em.find(User.class, userid);
	 }
}
