package org.ethan.iservice;

import java.util.List;

import org.ethan.bean.Category;

public interface ICategoryService {
	
	public void add(Category c);
	
	public void delete(int id);
	
	public void update(Category c);
	
	public Category load(int id);
	
	public List<Category> listAllCategory();
	
	public Category getCategoryByCategoryName(String categoryName);
	
	public List<String> getAllCategoryName();
}
