package com.moao.user.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Entity
public class Invitecode implements Serializable{
	private static final long serialVersionUID = 1L;
	/**
	 * id
	 */
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	/**
	 * 邀请码
	 */
	@Column(length=15)
	private String invitecode;
	/**
	 * 有效性,默认为0：有效
	 * 			1：失效
	 */
	@Column(length=1)
	private Integer effective;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getInvitecode() {
		return invitecode;
	}
	public void setInvitecode(String invitecode) {
		this.invitecode = invitecode;
	}
	public Integer getEffective() {
		return effective;
	}
	public void setEffective(Integer effective) {
		this.effective = effective;
	}
	
}
