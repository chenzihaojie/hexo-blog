package org.ethan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ethan.iservice.IArticleService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutCtl {
    
    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about(HttpSession httpSession){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		return "about";
	}
}
