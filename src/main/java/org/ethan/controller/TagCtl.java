package org.ethan.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ethan.bean.Article;
import org.ethan.bean.Tag;
import org.ethan.iservice.IArticleService;
import org.ethan.iservice.IArticleTagService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TagCtl {

    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    @Resource
    private IArticleTagService articleTagService;
    
	@RequestMapping(value="/tags",method=RequestMethod.GET)
	public String tags(HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		List<Tag> lt = tagService.listAllTag();
		model.addAttribute("tagCount", lt.size());
		model.addAttribute("tags", lt);
		return "tags";
	}
	
	@RequestMapping(value="/tags/{tagName}",method=RequestMethod.GET)
	public String tagByTagName(@PathVariable String tagName,HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		if(tagName!=""||tagName.trim().equals("")){
			model.addAttribute("tagName",tagName);
			List<Article> la =  articleTagService.getArticlesByTagName(tagName);
			
			model.addAttribute("articles", la);
			return "tag";
		}
		return "error";
		
	}
}
