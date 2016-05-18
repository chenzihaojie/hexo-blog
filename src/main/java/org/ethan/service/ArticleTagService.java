package org.ethan.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleTag;
import org.ethan.dao.ArticleDao;
import org.ethan.dao.ArticleTagDao;
import org.ethan.dao.TagDao;
import org.ethan.iservice.IArticleTagService;
import org.springframework.stereotype.Service;

@Service
public class ArticleTagService implements IArticleTagService {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Resource
	private ArticleTagDao articleTagDao;
	@Resource
	private ArticleDao articleDao;
	@Resource
	private TagDao tagDao;
	

	@Override
	public void add(ArticleTag at) {
		articleTagDao.add(at);
	}

	@Override
	public void delete(int id) {
		articleTagDao.delete(id);
	}

	@Override
	public void update(ArticleTag at) {
		articleTagDao.update(at);
	}

	@Override
	public ArticleTag load(int id) {
		return articleTagDao.load(id);
	}
	
	@Override
	public List<ArticleTag> getArticleTagByAid(int aid) {
		return articleTagDao.getArticleTagByAid(aid);
	}

	@Override
	public List<Article> getArticlesByTagName(String tagName) {
		int tid = tagDao.getTagByName(tagName).getId();
		List<ArticleTag> lat = articleTagDao.getArticleTagByTid(tid);
		List<Article> la = new ArrayList<Article>();
		Article a = new Article();
		for(ArticleTag at:lat){
			a =  articleDao.load(at.getAid());
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
