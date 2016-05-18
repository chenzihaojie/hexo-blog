package org.ethan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleCategory;
import org.ethan.bean.ArticleTag;
import org.ethan.iservice.IArticleCategoryService;
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
public class ShowCtl {
    
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
    
	
	@RequestMapping(value="/blog/id/{url}",method=RequestMethod.GET)
	public String blog(@PathVariable String url,HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		System.out.println(url);
		
		if((articleService.listAllUrl().contains(url))){
			
			Article a = articleService.getArticleByUrl(url);
			
			model.addAttribute("article", a);
			
			int aid = a.getId();
			ArticleCategory ac = articleCategoryService.getArticleCategoryByAid(aid);
			int cid = ac.getCid();
			String categoryName = categoryService.load(cid).getName();
			Map<Integer, String> map1 = new HashMap<Integer, String>();
			map1.put(aid, categoryName);
			
			model.addAttribute("ac", map1);
			
			
			List<ArticleTag> lat = articleTagService.getArticleTagByAid(aid);
			Map<Integer, List<String>> map2 = new HashMap<Integer, List<String>>();
			List<String> tname = new ArrayList<String>();
			for(ArticleTag at:lat){
				int tid = at.getTid();
				String tagName = tagService.load(tid).getName();
				tname.add(tagName);
			}
			map2.put(aid, tname);
			model.addAttribute("at", map2);
			
			Article prevArticle = articleService.getPrevArticle(aid);
			Article nextArticle = articleService.getNextArticle(aid);
			
			model.addAttribute("prevArticle",prevArticle);
			model.addAttribute("nextArticle", nextArticle);
			
			return "show";
		}
		else
			return "error";
	}
	
	@RequestMapping(value="/summary/url/{url}",method=RequestMethod.GET)
	public void summary(@PathVariable String url,HttpServletResponse resp){
		Article a = articleService.getArticleByUrl(url);
		System.out.println(a.getMdSource());
		resp.setContentType("text/x-markdown;charset=utf-8");
		try {
			resp.getWriter().write(a.getSummary());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/content/url/{url}",method=RequestMethod.GET)
	public void content(@PathVariable String url,HttpServletResponse resp){
		Article a = articleService.getArticleByUrl(url);
		System.out.println(a.getMdSource());
		resp.setContentType("text/x-markdown;charset=utf-8");
		try {
			resp.getWriter().write(a.getContent());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
