package org.ethan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleCategory;
import org.ethan.bean.ArticleTag;
import org.ethan.bean.Category;
import org.ethan.bean.Tag;
import org.ethan.iservice.IArticleCategoryService;
import org.ethan.iservice.IArticleService;
import org.ethan.iservice.IArticleTagService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.ethan.util.RegexUtil;
import org.ethan.util.UUIDUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EditCtl {
	
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    @Resource
    private IArticleTagService articleTagService;
    @Resource
    private IArticleCategoryService articleCategoryService;
    
    
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String editGet(){
		return "edit";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public String editPost(String title,String mdSource){

		if(mdSource==null||mdSource.trim().equals("")){
			return "error";
		}
		else{
			System.out.println(mdSource);
			
			String regex1 = "#category:([\\S\\s]*)\n#tags";
			String regex2 = "#tags:([\\S\\s]*)\n#summary";
			String regex3 = "#summary:\n([\\S\\s]*)\n#more";
			String regex4 = "#more:\n([\\S\\s]*)";
			
			String category = RegexUtil.getMatcher(regex1, mdSource);
			String tags = RegexUtil.getMatcher(regex2, mdSource);
			String[] ts = tags.split(" ");
			
			List<String> lcn = categoryService.getAllCategoryName();
			Category c = new Category();
			
			if(!lcn.contains(category)){
				c.setName(category);
				categoryService.add(c);
			}
			
			int cid = categoryService.getCategoryByCategoryName(category).getId();
			
			List<Integer> ltid = new ArrayList<Integer>();
					
			List<String> ltn = new ArrayList<String>();
			for(String tag:ts){
				Tag t = new Tag();
				System.out.println(tag);
				ltn = tagService.getAllTagsName();
				System.out.println(ltn);
				if(!ltn.contains(tag)){
					t.setName(tag);
					System.out.println(t);
					tagService.add(t);
				}
				
				ltid.add(tagService.getTagByName(tag).getId());
			}
			
			String summary = RegexUtil.getMatcher(regex3, mdSource);
			String content = summary+"\n"+RegexUtil.getMatcher(regex4, mdSource);
			if(content==null){
				content = summary;
			}
			content = summary+"\n"+RegexUtil.getMatcher(regex4, mdSource);
			
			Article a = new Article();
			a.setTitle(title);
			a.setTime(sdf.format(new Date()));
			String url = UUIDUtil.getUUID();
			a.setUrl(url);
			a.setMdSource(mdSource);
			a.setSummary(summary);
			a.setContent(content);
			articleService.add(a);
			
			int aid = articleService.getArticleByUrl(url).getId();
			
			ArticleCategory ac = new ArticleCategory(aid,cid);
			articleCategoryService.add(ac);
			
			for(int tid:ltid){
				ArticleTag at = new ArticleTag(aid, tid);
				articleTagService.add(at);
			}
			
			return url;
		}
	}
	
}
