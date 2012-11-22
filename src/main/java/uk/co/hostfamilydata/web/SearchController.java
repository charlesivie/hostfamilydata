package uk.co.hostfamilydata.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import uk.co.hostfamilydata.dao.HostFamilyRepository;
import uk.co.hostfamilydata.service.SearchService;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
    @Autowired
    private HostFamilyRepository hostFamilyRepository;

    @RequestMapping(value = "/search")
	public ModelAndView get(
            @RequestParam(value = "queryString", defaultValue = "") String queryString,
            @RequestParam(value = "hostFamilyId", defaultValue = "0") long hostFamilyId) {

		ModelAndView modelAndView = new ModelAndView("admin/search");

		if (!isBlank(queryString)) {
			modelAndView.addObject("hostFamilies", searchService.search(queryString));
		}

        if(hostFamilyId > 0) {
			modelAndView.addObject("hostFamily", hostFamilyRepository.findOne(hostFamilyId));
        }

        modelAndView.addObject("queryString", queryString);

		return modelAndView;
	}

    @RequestMapping(value = "/search/new")
    public ModelAndView get(@RequestParam(value = "queryString", defaultValue = "") String queryString) {

        return get(queryString, 0);
    }


}
