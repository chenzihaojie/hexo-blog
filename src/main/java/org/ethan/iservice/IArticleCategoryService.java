package org.ethan.iservice;

import java.util.List;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleCategory;

public interface IArticleCategoryService {
	
	public void add(ArticleCategory ac);
	
	public void delete(int id);
	
	public void update(ArticleCategory ac);
	
	public ArticleCategory load(int id);
	
	public ArticleCategory getArticleCategoryByAid(int aid);
	
	public List<Article> getArticlesByCategoryName(String categoryName);


}
