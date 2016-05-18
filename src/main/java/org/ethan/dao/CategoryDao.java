package org.ethan.dao;

import java.util.List;

import org.ethan.bean.Category;
import org.ethan.idao.ICategoryDao;
import org.springframework.stereotype.Repository;

@Repository("categoryDao")
public class CategoryDao extends BaseDao<Category> implements ICategoryDao {

	@Override
	public Category getCategoryByCategoryName(String categoryName) {
		return (Category) super.getSession().createQuery("from Category where name = :name").setParameter("name", categoryName).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategoryName() {
		return super.getSession().createSQLQuery("select name from t_category").list();
	}


}
