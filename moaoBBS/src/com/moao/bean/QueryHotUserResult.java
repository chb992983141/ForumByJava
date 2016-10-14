package com.moao.bean;

import java.io.Serializable;
import java.util.List;

public class QueryHotUserResult<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 结果集
	 */
	private List<T> resultlist;
	/**
	 * 总记录数
	 */
	private long totalnum;
	public List<T> getResultlist() {
		return resultlist;
	}
	public void setResultlist(List<T> resultlist) {
		this.resultlist = resultlist;
	}
	public long getTotalnum() {
		return totalnum;
	}
	public void setTotalnum(long totalnum) {
		this.totalnum = totalnum;
	}
	
}
