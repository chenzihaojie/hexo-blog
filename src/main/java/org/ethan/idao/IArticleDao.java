package org.ethan.idao;

import java.util.List;

import org.ethan.bean.Article;
import org.ethan.util.Page;


public interface IArticleDao extends IBaseDao<Article> {

	public Article getArticleByUrl(String url);
	
	public List<String> listAllUrl();
	
    public List<Article> queryByPage(Page page);
    
    public Article getPrevArticle(int currentId);
    
    public Article getNextArticle(int currentId);
    

	
}
