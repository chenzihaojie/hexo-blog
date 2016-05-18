package org.ethan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ethan.bean.Article;
import org.ethan.bean.Category;
import org.ethan.iservice.IArticleCategoryService;
import org.ethan.iservice.IArticleService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryCtl {
    
    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    @Resource
    private IArticleCategoryService articleCategoryService;
    
    
	@RequestMapping(value="/categories",method=RequestMethod.GET)
	public String categories(HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		
		List<Category> lc = categoryService.listAllCategory();
		model.addAttribute("categoryCount", lc.size());
		List<Article> lac = new ArrayList<Article>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(Category c: lc){
			String categoryName = c.getName();
			lac =  articleCategoryService.getArticlesByCategoryName(categoryName);
			map.put(categoryName,lac.size());
		}
		model.addAttribute("cs", map);
		return "categories";
	}
	
	
	@RequestMapping(value="/categories/{categoryName}",method=RequestMethod.GET)
	public String categoriesByCategoryName(@PathVariable String categoryName,HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		if(categoryName!=""||categoryName.trim().equals("")){
			model.addAttribute("categoryName",categoryName);
			List<Article> la =  articleCategoryService.getArticlesByCategoryName(categoryName);
			model.addAttribute("articles", la);
			return "category";
		}
		return "error";
	}
}
