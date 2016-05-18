package org.ethan.idao;

import java.util.List;

import org.ethan.bean.ArticleTag;

public interface IArticleTagDao extends IBaseDao<ArticleTag> {
	
	public List<ArticleTag> getArticleTagByAid(int aid);
	
	public List<ArticleTag> getArticleTagByTid(int tid);

}
