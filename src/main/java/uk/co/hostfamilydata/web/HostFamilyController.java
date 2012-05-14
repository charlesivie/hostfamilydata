package uk.co.hostfamilydata.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import uk.co.hostfamilydata.domain.HostFamily;

@RequestMapping("/hostfamilys")
@Controller
@RooWebScaffold(path = "hostfamilys", formBackingObject = HostFamily.class)
public class HostFamilyController {
}
