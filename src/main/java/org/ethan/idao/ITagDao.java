package org.ethan.idao;

import java.util.List;

import org.ethan.bean.Tag;

public interface ITagDao extends IBaseDao<Tag> {
	
	public Tag getTagByName(String tagName);
	
	public List<String> getAllTagsName();

}
