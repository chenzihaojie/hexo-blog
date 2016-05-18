package org.ethan.iservice;

import java.util.List;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleTag;

public interface IArticleTagService {
	
	public void add(ArticleTag at);
	
	public void delete(int id);
	
	public void update(ArticleTag at);
	
	public ArticleTag load(int id);
	
	public List<ArticleTag> getArticleTagByAid(int aid);
	
	public List<Article> getArticlesByTagName(String tagName);


}
