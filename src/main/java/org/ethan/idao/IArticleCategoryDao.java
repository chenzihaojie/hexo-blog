package org.ethan.idao;

import java.util.List;

import org.ethan.bean.ArticleCategory;

public interface IArticleCategoryDao extends IBaseDao<ArticleCategory> {
	
	public ArticleCategory getArticleCategoryByAid(int aid);
	
	public List<ArticleCategory> getArticleCategoryByCid(int cid);

}
