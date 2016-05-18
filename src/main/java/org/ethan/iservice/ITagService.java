package org.ethan.iservice;

import java.util.List;

import org.ethan.bean.Tag;


public interface ITagService {
	
	public void add(Tag t);
	
	public void delete(int id);
	
	public void update(Tag t);
	
	public Tag load(int id);
	
	public List<Tag> listAllTag();
	
	public Tag getTagByName(String tagName);
	
	public List<String> getAllTagsName();
	
}
