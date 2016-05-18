package org.ethan.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_article")
public class Article {

    //1.文章的id
    private int id;
    //2.文章的地址
    private String url;
    //3.文章的标题
    private String title;
    //4.文章的发布时间
    private String time;
    //5.文章的阅读次数
    private int readCount;
    //6.文章的markdown源
    private String mdSource;
    //7.文章的摘要
    private String summary;
    //8.文章的正文
    private String content;
    
	public Article() {
		super();
	}


	public Article(int id, String url, String title, String time,
			int readCount, String mdSource, String summary, String content) {
		super();
		this.id = id;
		this.url = url;
		this.title = title;
		this.time = time;
		this.readCount = readCount;
		this.mdSource = mdSource;
		this.summary = summary;
		this.content = content;
	}



	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	@Column(length = 65535,columnDefinition="Text")
	public String getMdSource() {
		return mdSource;
	}
	public void setMdSource(String mdSource) {
		this.mdSource = mdSource;
	}
	
	@Column(length = 65535,columnDefinition="Text")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Column(length = 65535,columnDefinition="Text")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", url=" + url + ", title=" + title
				+ ", time=" + time + ", readCount=" + readCount + ", mdSource="
				+ mdSource + ", summary=" + summary + ", content=" + content
				+ "]";
	}
}