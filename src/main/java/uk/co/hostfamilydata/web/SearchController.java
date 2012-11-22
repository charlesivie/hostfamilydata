package uk.co.hostfamilydata.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import uk.co.hostfamilydata.service.SearchService;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/search")
	public ModelAndView get(@RequestParam(value = "queryString", defaultValue = "") String queryString) {

		ModelAndView modelAndView = new ModelAndView("admin/search");

		if (!isBlank(queryString)) {
			modelAndView.addObject("hostFamilies", searchService.search(queryString));
		}

		return modelAndView;
	}


}
