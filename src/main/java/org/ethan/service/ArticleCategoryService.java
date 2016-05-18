package org.ethan.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleCategory;
import org.ethan.dao.ArticleCategoryDao;
import org.ethan.dao.ArticleDao;
import org.ethan.dao.CategoryDao;
import org.ethan.iservice.IArticleCategoryService;
import org.springframework.stereotype.Service;

@Service
public class ArticleCategoryService implements IArticleCategoryService {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Resource
	private ArticleCategoryDao articleCatagoryDao;
	@Resource
	private ArticleDao articleDao;
	@Resource
	private CategoryDao categoryDao;

	@Override
	public void add(ArticleCategory ac) {
		articleCatagoryDao.add(ac);
	}

	@Override
	public void delete(int id) {
		articleCatagoryDao.delete(id);
	}

	@Override
	public void update(ArticleCategory ac) {
		articleCatagoryDao.update(ac);
	}

	@Override
	public ArticleCategory load(int id) {
		return articleCatagoryDao.load(id);
	}
	
	@Override
	public ArticleCategory getArticleCategoryByAid(int aid) {
		return articleCatagoryDao.getArticleCategoryByAid(aid);
	}

	@Override
	public List<Article> getArticlesByCategoryName(String categoryName) {
		int cid = categoryDao.getCategoryByCategoryName(categoryName).getId();
		List<ArticleCategory> lac = articleCatagoryDao.getArticleCategoryByCid(cid);
		List<Article> la = new ArrayList<Article>();
		Article a = new Article();
		for(ArticleCategory ac:lac){
			a =  articleDao.load(ac.getAid());
			if(a!=null){
				if(!la.contains(a)){
					la.add(a);
				}
			}
		}
        Collections.sort(la, new Comparator<Article>() {
            public int compare(Article o1, Article o2) {
                return String.valueOf(o2.getId()).compareTo(String.valueOf(o1.getId()));
            }
        });
        Collections.sort(la, new Comparator<Article>() {
            public int compare(Article o1, Article o2) {
                try {
					return sdf.parse(o2.getTime()).compareTo(sdf.parse(o1.getTime()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return 0;
            }
        });
		return la;
	}


}
