package com.moao.web.util;

import java.util.regex.Pattern;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;

import com.moao.user.bean.User;
import com.moao.user.service.IServiceUser;

public class ChickRegister {
	private static final Log log = 
			LogFactory.getLog(ChickRegister.class);

	private final static String mailboxCheck="^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
	private final static String nicknameCheck="[\u4e00-\u9fa5]+";
	//过滤 ‘
	//ORACLE 注解 --  /**/
	//关键字过滤 update ,delete 
	private static String sqlreg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"
					+ "(\\b(select|update|and|or|delete|insert|trancate|" +
					"char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";
	@Resource(name="serviceuser") IServiceUser serviceUser;
	/**
	 * 检测是否为空
	 * 不为空返回true
	 * @param str
	 * @return boolean
	 */
	public static boolean ChickEmpty(String str){
		Boolean boo=false;
		if(!str.trim().equals("")){
			boo=true;
		}
		return boo;
	}
	/**
	 * 检测邮箱格式是否正确
	 * 正确为true
	 * @param str
	 * @return boolean
	 */
	public static boolean ChickMail(String str){
		Boolean boo=false;
		Pattern regex=Pattern.compile(mailboxCheck);
		if(regex.matcher(str).matches()){
			log.info("注册的邮箱地址为：|"+str+"|，验证成功。");
			boo=true;
		}
		if(boo == false){log.info("注册的邮箱地址为：|"+str+"|，验证失败。");}
		return boo;
	}

	/**
	 * 检测是否为汉字,并且在1到6之间
	 * 为汉字就为true
	 * sql检测开启
	 * @param str
	 * @return boolean
	 */
	public static  boolean ChickChinaChar(String str){
		Boolean boo=false;
		Pattern sqlPattern = Pattern.compile(sqlreg, Pattern.CASE_INSENSITIVE);
		if (sqlPattern.matcher(str).find()) {
			log.error("注册的昵称未能通过滤器：nicename=" + str);
			boo = false;
		}else{
			boo = true;
		}
//		Pattern regex=Pattern.compile(nicknameCheck);
//		if(regex.matcher(str).matches()&&str.length()>=1&&str.length()<=6){
//			boo=true;
//		}
		return boo;
	}
	/**
	 * 检测密码是否8<=pass<=14个字符
	 * 正确为true
	 * @return 
	 */
	public static  boolean ChickPassword(String str){
		Boolean boo=false;
		if(8<=str.length()&&str.length()<=14){
			boo=true;
		}
		return boo;
	}
	/**
	 * 检测注册是否为空 false不为空
	 * @param mail
	 * @param password
	 * @param agpassword
	 * @param nickname
	 * @return
	 */
	public static  boolean ChickUser(User user){
		Boolean boo=false;
		if(ChickMail(user.getMailbox())){
			if(ChickEmpty(user.getPassword())&&user.getPassword().equals(user.getAgainpassword())&&ChickChinaChar(user.getNickname())){
				log.info("新用户注册成功：nickname="+user.getNickname()+",mailbox="+user.getMailbox());
				boo=true;
			}
		}
		return boo;
	}
}
