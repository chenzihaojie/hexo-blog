package org.ethan.dao;


import java.util.List;

import org.ethan.bean.ArticleTag;
import org.ethan.idao.IArticleTagDao;
import org.springframework.stereotype.Repository;

@Repository("articleTagDao")
public class ArticleTagDao extends BaseDao<ArticleTag> implements IArticleTagDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleTag> getArticleTagByAid(int aid) {
		return super.getSession().createQuery("from ArticleTag where aid = :aid").setParameter("aid", aid).list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleTag> getArticleTagByTid(int tid) {
		return super.getSession().createQuery("from ArticleTag where tid = :tid").setParameter("tid", tid).list();
	}
	
}