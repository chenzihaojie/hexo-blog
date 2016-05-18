package org.ethan.iservice;

import java.util.List;

import org.ethan.bean.Article;
import org.ethan.util.Page;


public interface IArticleService {

	public void add(Article a);
	
	public void delete(int id);
	
	public void update(Article a);
	
	public Article load(int id);
	
	public List<Article> listAllArticle();
	
	public Article getArticleByUrl(String url);
	
	public List<String> listAllUrl();
	
    public List<Article> queryByPage(Page page);
    
    public Article getPrevArticle(int currentId);
    
    public Article getNextArticle(int currentId);
	
}
