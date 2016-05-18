package org.ethan.service;

import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Tag;
import org.ethan.idao.ITagDao;
import org.ethan.iservice.ITagService;
import org.springframework.stereotype.Service;

@Service
public class TagService implements ITagService {
	@Resource
	private ITagDao tagDao;

	@Override
	public void add(Tag t) {
		tagDao.add(t);
	}

	@Override
	public void delete(int id) {
		tagDao.delete(id);
	}

	@Override
	public void update(Tag t) {
		tagDao.update(t);
		
	}

	@Override
	public Tag load(int id) {
		return tagDao.load(id);
	}

	@Override
	public List<Tag> listAllTag() {
		String hql = "from Tag";
		return tagDao.list(hql);
	}

	@Override
	public Tag getTagByName(String tagName) {
		return tagDao.getTagByName(tagName);
	}

	@Override
	public List<String> getAllTagsName() {
		return tagDao.getAllTagsName();
	}

}
