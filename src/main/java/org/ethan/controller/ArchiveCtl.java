package org.ethan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ethan.bean.Article;
import org.ethan.iservice.IArticleService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArchiveCtl {
    
    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    
    
	@RequestMapping(value="/archives",method=RequestMethod.GET)
	public String archives(HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		
		List<Article> la = articleService.listAllArticle();

		model.addAttribute("articles", la);
		
		List<String> ls = new ArrayList<String>();
		for(Article a: la){
			System.out.println(a.getTime());
			if(!ls.contains(a.getTime().substring(0,4))){
				ls.add(a.getTime().substring(0,4));
			}
		}
		System.out.println(ls);
		model.addAttribute("years", ls);
		
		return "archives";
	}
}
