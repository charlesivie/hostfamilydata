package uk.co.hostfamilydata.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import uk.co.hostfamilydata.dao.HostFamilyRepository;
import uk.co.hostfamilydata.domain.HostFamily;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class HostFamilyController {

	@Autowired
	private HostFamilyRepository hostFamilyRepository;

	@RequestMapping(value = "/hostFamily/{id}", method = RequestMethod.GET)
	public ModelAndView get(@PathVariable("id") long id) {

		ModelAndView modelAndView = new ModelAndView("admin/hostFamily");
		HostFamily hostFamily = hostFamilyRepository.findOne(id);

		modelAndView.addObject("hostFamily", hostFamily);
		modelAndView.addObject("hostFamilies", hostFamilyRepository.findAll(new Sort(Sort.Direction.ASC, "lastName")));

		return modelAndView;
	}

	@RequestMapping(value = "/hostFamily", method = RequestMethod.GET)
	public ModelAndView get() {
		ModelAndView modelAndView = new ModelAndView("admin/hostFamily", "hostFamily", new HostFamily());
		modelAndView.addObject("hostFamilies", hostFamilyRepository.findAll(new Sort(Sort.Direction.ASC, "lastName")));
		return modelAndView;
	}


    @RequestMapping(value = "/hostFamily/confirmed/{id}", method = RequestMethod.GET)
    public ModelAndView getConfirmed(@PathVariable("id") long id) {

        ModelAndView modelAndView = new ModelAndView("admin/hostFamilyConfirmed");
        HostFamily hostFamily = hostFamilyRepository.findOne(id);

        modelAndView.addObject("hostFamily", hostFamily);
        modelAndView.addObject("hostFamilies", hostFamilyRepository.findByConfirmed(true, new Sort(Sort.Direction.ASC, "lastName")));

        return modelAndView;
    }

    @RequestMapping(value = "/hostFamily/confirmed", method = RequestMethod.GET)
    public ModelAndView getConfirmed() {
        ModelAndView modelAndView = new ModelAndView("admin/hostFamilyConfirmed", "hostFamily", new HostFamily());
        modelAndView.addObject("hostFamilies", hostFamilyRepository.findByConfirmed(true, new Sort(Sort.Direction.ASC, "lastName")));
        return modelAndView;
    }

	@RequestMapping(value = {"/hostFamily", "/hostFamily/{id}"}, method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public String post(@Valid HostFamily hostFamily, BindingResult result, Model model) throws IOException {

		if (!result.hasErrors()) {
			hostFamilyRepository.save(hostFamily);
		}

		model.addAttribute("hostFamilies", hostFamilyRepository.findAll(new Sort(Sort.Direction.ASC, "lastName")));

		return "/admin/hostFamily";
	}



	@RequestMapping(value = "/hostFamily/{id}", method = RequestMethod.DELETE)
	public ModelAndView delete(@PathVariable("id") long id) {
		hostFamilyRepository.delete(id);
		return new ModelAndView("redirect:/hostFamily");
	}

}
