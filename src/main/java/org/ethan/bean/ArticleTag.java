package org.ethan.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_article_tag")
public class ArticleTag {
	
	//1.主键id
	private int id;
	//2.文章的id
	private int aid;
	//3.标签的id
	private int tid;
	
	public ArticleTag() {
		super();
	}
	public ArticleTag(int aid, int tid) {
		super();
		this.aid = aid;
		this.tid = tid;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	
	@Override
	public String toString() {
		return "ArticleTag [id=" + id + ", aid=" + aid + ", tid=" + tid + "]";
	}
}
