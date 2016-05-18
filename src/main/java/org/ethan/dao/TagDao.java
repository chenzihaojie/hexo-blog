package org.ethan.dao;

import java.util.List;

import org.ethan.bean.Tag;
import org.ethan.idao.ITagDao;
import org.springframework.stereotype.Repository;

@Repository("tagDao")
public class TagDao extends BaseDao<Tag> implements ITagDao {

	@Override
	public Tag getTagByName(String tagName) {
		return (Tag) super.getSession().createQuery("from Tag where name = :name").setParameter("name", tagName).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllTagsName() {
		return super.getSession().createSQLQuery("select name from t_tag").list();
	}

}
