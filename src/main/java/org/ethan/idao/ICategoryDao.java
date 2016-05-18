package org.ethan.idao;

import java.util.List;

import org.ethan.bean.Category;

public interface ICategoryDao extends IBaseDao<Category> {
	
	public Category getCategoryByCategoryName(String categoryName);
	
	public List<String> getAllCategoryName();

}
