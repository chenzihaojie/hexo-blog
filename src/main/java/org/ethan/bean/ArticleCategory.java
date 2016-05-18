package org.ethan.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_article_category")
public class ArticleCategory {
	
	//1.主键id
	private int id;
	//2.文章的id
	private int aid;
	//3.分类的id
	private int cid;
	
	public ArticleCategory() {
		super();
	}

	public ArticleCategory(int aid, int cid) {
		super();
		this.aid = aid;
		this.cid = cid;
	}
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(unique=true)
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "ArticleCategory [id=" + id + ", aid=" + aid + ", cid=" + cid
				+ "]";
	}
}
