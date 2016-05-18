package org.ethan.dao;


import java.util.List;

import org.ethan.bean.ArticleCategory;
import org.ethan.idao.IArticleCategoryDao;
import org.springframework.stereotype.Repository;

@Repository("articleCategoryDao")
public class ArticleCategoryDao extends BaseDao<ArticleCategory> implements IArticleCategoryDao {

	@Override
	public ArticleCategory getArticleCategoryByAid(int aid) {
		return (ArticleCategory) super.getSession().createQuery("from ArticleCategory where aid = :aid").setParameter("aid", aid).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleCategory> getArticleCategoryByCid(int cid) {
		return super.getSession().createQuery("from ArticleCategory where cid = :cid").setParameter("cid", cid).list();
	}


	
	
}