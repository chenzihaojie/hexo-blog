package org.ethan.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Article;
import org.ethan.idao.IArticleDao;
import org.ethan.iservice.IArticleService;
import org.ethan.util.Page;
import org.springframework.stereotype.Service;

@Service
public class ArticleService implements IArticleService {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Resource
	private IArticleDao articleDao;
	
	@Override
	public void add(Article a) {
		articleDao.add(a);
	}

	@Override
	public void delete(int id) {
		articleDao.delete(id);
	}

	
	@Override
	public void update(Article a) {
		articleDao.update(a);
	}

	@Override
	public Article load(int id) {
		return articleDao.load(id);
	}

	@Override
	public List<Article> listAllArticle() {
		String hql = "from Article order by id desc";
		List<Article> la = articleDao.list(hql);
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

	@Override
	public Article getArticleByUrl(String url) {
		return articleDao.getArticleByUrl(url);
	}

	@Override
	public List<String> listAllUrl() {
		return articleDao.listAllUrl();
	}

	@Override
	public List<Article> queryByPage(Page page) {
		List<Article> la = articleDao.queryByPage(page);
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

	@Override
	public Article getPrevArticle(int currentId) {
		return articleDao.getPrevArticle(currentId);
	}

	@Override
	public Article getNextArticle(int currentId) {
		return articleDao.getNextArticle(currentId);
	}


}
