// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition;
import com.lacunalabs.dm.data.repository.physics.crystallography.ReflectionConditionService;
import com.lacunalabs.dm.web.ReflectionConditionController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ReflectionConditionController_Roo_Controller {
    
    @Autowired
    ReflectionConditionService ReflectionConditionController.reflectionConditionService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ReflectionConditionController.create(@Valid ReflectionCondition reflectionCondition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, reflectionCondition);
            return "reflectionconditions/create";
        }
        uiModel.asMap().clear();
        reflectionConditionService.saveReflectionCondition(reflectionCondition);
        return "redirect:/reflectionconditions/" + encodeUrlPathSegment(reflectionCondition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ReflectionConditionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ReflectionCondition());
        return "reflectionconditions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ReflectionConditionController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("reflectioncondition", reflectionConditionService.findReflectionCondition(id));
        uiModel.addAttribute("itemId", id);
        return "reflectionconditions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ReflectionConditionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("reflectionconditions", reflectionConditionService.findReflectionConditionEntries(firstResult, sizeNo));
            float nrOfPages = (float) reflectionConditionService.countAllReflectionConditions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("reflectionconditions", reflectionConditionService.findAllReflectionConditions());
        }
        return "reflectionconditions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ReflectionConditionController.update(@Valid ReflectionCondition reflectionCondition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, reflectionCondition);
            return "reflectionconditions/update";
        }
        uiModel.asMap().clear();
        reflectionConditionService.updateReflectionCondition(reflectionCondition);
        return "redirect:/reflectionconditions/" + encodeUrlPathSegment(reflectionCondition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ReflectionConditionController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, reflectionConditionService.findReflectionCondition(id));
        return "reflectionconditions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ReflectionConditionController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ReflectionCondition reflectionCondition = reflectionConditionService.findReflectionCondition(id);
        reflectionConditionService.deleteReflectionCondition(reflectionCondition);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/reflectionconditions";
    }
    
    void ReflectionConditionController.populateEditForm(Model uiModel, ReflectionCondition reflectionCondition) {
        uiModel.addAttribute("reflectionCondition", reflectionCondition);
    }
    
    String ReflectionConditionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
