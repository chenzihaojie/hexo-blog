package org.ethan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.ethan.bean.Article;
import org.ethan.bean.ArticleCategory;
import org.ethan.iservice.IArticleCategoryService;
import org.ethan.iservice.IArticleService;
import org.ethan.iservice.ICategoryService;
import org.ethan.iservice.ITagService;
import org.ethan.util.Page;
import org.ethan.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexCtl {
	
    @Resource
    private IArticleService articleService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private ITagService tagService;
    @Resource
    private IArticleCategoryService articleCategoryService;
	
	@RequestMapping(value={"/","/index"},method=RequestMethod.GET)
	public String index(String q, String everyPage, String pn,HttpSession httpSession,Model model){
		int articletotal = articleService.listAllArticle().size();
		httpSession.setAttribute("articletotal", articletotal);
		
		int categorytotal = categoryService.listAllCategory().size();
		httpSession.setAttribute("categorytotal", categorytotal);
		
		int tagtotal = tagService.listAllTag().size();
		httpSession.setAttribute("tagtotal", tagtotal);
		
        //pn -> everyPage
        int ep = 7; //每页显示多少条
        int cp = 1; //当前第几页
        int totalCount = articletotal;
        if (everyPage != null) {
            ep = Integer.parseInt(everyPage);
        }
        if (pn != null) {
            try {
                cp = (int) Double.parseDouble(pn);
            } catch (NumberFormatException e) {
                cp = 1;
            }
            if (cp <= 0) {
                cp = 1;
            }
            if (cp > Math.ceil(totalCount / ep)) {
                cp = (int) Math.ceil((double) totalCount / (double) ep);
            }
        }

        Page page = PageUtil.createPage(ep, totalCount, cp);
        httpSession.setAttribute("page", page);
		
		List<Article> la = articleService.queryByPage(page);
		model.addAttribute("articles",la);
        
		Map<Integer, String> map = new HashMap<Integer, String>();
		
		for(Article a:la){
			int aid = a.getId();
			System.out.println(aid);
			ArticleCategory ac = articleCategoryService.getArticleCategoryByAid(aid);
			System.out.println(ac);
			System.out.println(ac.getCid());
			int cid = ac.getCid();
			String categoryName = categoryService.load(cid).getName();
			map.put(aid, categoryName);
		}

		model.addAttribute("ac", map);
		
        return "index";
	}

}
