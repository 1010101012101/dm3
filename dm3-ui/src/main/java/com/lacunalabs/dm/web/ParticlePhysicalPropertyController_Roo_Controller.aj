// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.fundamental.CompositeParticleService;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticlePhysicalPropertyService;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeService;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import com.lacunalabs.dm.web.ParticlePhysicalPropertyController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.Arrays;
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

privileged aspect ParticlePhysicalPropertyController_Roo_Controller {
    
    @Autowired
    ParticlePhysicalPropertyService ParticlePhysicalPropertyController.particlePhysicalPropertyService;
    
    @Autowired
    CompositeParticleService ParticlePhysicalPropertyController.compositeParticleService;
    
    @Autowired
    PhysicalPropertyTypeService ParticlePhysicalPropertyController.physicalPropertyTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ParticlePhysicalPropertyController.create(@Valid ParticlePhysicalProperty particlePhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particlePhysicalProperty);
            return "particlephysicalpropertys/create";
        }
        uiModel.asMap().clear();
        particlePhysicalPropertyService.saveParticlePhysicalProperty(particlePhysicalProperty);
        return "redirect:/particlephysicalpropertys/" + encodeUrlPathSegment(particlePhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ParticlePhysicalPropertyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ParticlePhysicalProperty());
        return "particlephysicalpropertys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ParticlePhysicalPropertyController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("particlephysicalproperty", particlePhysicalPropertyService.findParticlePhysicalProperty(id));
        uiModel.addAttribute("itemId", id);
        return "particlephysicalpropertys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ParticlePhysicalPropertyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("particlephysicalpropertys", particlePhysicalPropertyService.findParticlePhysicalPropertyEntries(firstResult, sizeNo));
            float nrOfPages = (float) particlePhysicalPropertyService.countAllParticlePhysicalPropertys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("particlephysicalpropertys", particlePhysicalPropertyService.findAllParticlePhysicalPropertys());
        }
        return "particlephysicalpropertys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ParticlePhysicalPropertyController.update(@Valid ParticlePhysicalProperty particlePhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particlePhysicalProperty);
            return "particlephysicalpropertys/update";
        }
        uiModel.asMap().clear();
        particlePhysicalPropertyService.updateParticlePhysicalProperty(particlePhysicalProperty);
        return "redirect:/particlephysicalpropertys/" + encodeUrlPathSegment(particlePhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ParticlePhysicalPropertyController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, particlePhysicalPropertyService.findParticlePhysicalProperty(id));
        return "particlephysicalpropertys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ParticlePhysicalPropertyController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ParticlePhysicalProperty particlePhysicalProperty = particlePhysicalPropertyService.findParticlePhysicalProperty(id);
        particlePhysicalPropertyService.deleteParticlePhysicalProperty(particlePhysicalProperty);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/particlephysicalpropertys";
    }
    
    void ParticlePhysicalPropertyController.populateEditForm(Model uiModel, ParticlePhysicalProperty particlePhysicalProperty) {
        uiModel.addAttribute("particlePhysicalProperty", particlePhysicalProperty);
        uiModel.addAttribute("compositeparticles", compositeParticleService.findAllCompositeParticles());
        uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findAllPhysicalPropertyTypes());
        uiModel.addAttribute("uncertaintytypes", Arrays.asList(UncertaintyType.values()));
    }
    
    String ParticlePhysicalPropertyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
