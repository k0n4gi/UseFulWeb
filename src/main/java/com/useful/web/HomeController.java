package com.useful.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.useful.web.domain.vo.MsgResultVO;
import com.useful.web.service.MsgService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MsgService msgService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/welcom", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<MsgResultVO> voList = msgService.selectAllMsgResult();
		for(MsgResultVO vo : voList) {
			logger.info(vo.getMsg());
		}
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/import/menu", method = RequestMethod.GET)
	public String importMenu(Locale locale, Model model) {
		return "common/menu";
	}

	@RequestMapping(value = "/import/head", method = RequestMethod.GET)
	public String importHead(Locale locale, Model model) {
		return "common/head";
	}
}