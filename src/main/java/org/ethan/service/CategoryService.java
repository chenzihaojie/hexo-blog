package org.ethan.service;

import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Category;
import org.ethan.idao.ICategoryDao;
import org.ethan.iservice.ICategoryService;
import org.springframework.stereotype.Service;

@Service
public class CategoryService implements ICategoryService {
	@Resource
	private ICategoryDao categoryDao;

	@Override
	public void add(Category c) {
		categoryDao.add(c);
	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
	}

	@Override
	public void update(Category c) {
		categoryDao.update(c);
	}

	@Override
	public Category load(int id) {
		return categoryDao.load(id);
	}

	@Override
	public List<Category> listAllCategory() {
		String hql = "from Category";
		return categoryDao.list(hql);
	}

	@Override
	public Category getCategoryByCategoryName(String categoryName) {
		return categoryDao.getCategoryByCategoryName(categoryName);
	}

	@Override
	public List<String> getAllCategoryName() {
		return categoryDao.getAllCategoryName();
	}

}
