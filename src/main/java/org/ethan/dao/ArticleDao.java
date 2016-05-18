package org.ethan.dao;

import java.util.List;

import org.ethan.bean.Article;
import org.ethan.idao.IArticleDao;
import org.ethan.util.Page;
import org.springframework.stereotype.Repository;

@Repository("articleDao")
public class ArticleDao extends BaseDao<Article> implements IArticleDao {

	@Override
	public Article getArticleByUrl(String url) {
		return (Article) super.getSession().createQuery("from Article where url = :url").setParameter("url", url).uniqueResult();
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<String> listAllUrl() {
		return super.getSession().createSQLQuery("select url from t_article").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> queryByPage(Page page) {
        return (List<Article>) super.getSession().createQuery("from Article order by id desc")
                      .setMaxResults(page.getEveryPage()).setFirstResult(page.getBeginIndex()).list();
	}

	
	//文章逆序显示，所以上一条id比现在id大，要找第一个比现在id大的就要升序排列
	@Override
	public Article getPrevArticle(int currentId) {
		return (Article) super.getSession().createQuery("from Article where id > :currentId order by id asc").setParameter("currentId", currentId).setMaxResults(1).uniqueResult();
	}

	//文章逆序显示，所以下一条id比现在小，要找第一个比现在id小的就要降序排列
	@Override
	public Article getNextArticle(int currentId) {
		return (Article) super.getSession().createQuery("from Article where id < :currentId order by id desc").setParameter("currentId", currentId).setMaxResults(1).uniqueResult();
	}
	
	
}