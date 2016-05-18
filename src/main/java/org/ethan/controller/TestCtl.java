package org.ethan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestCtl {
	
    /**
     * 用来测试service
     * @return
     */
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String testService(){
		return "test";
	}

}
