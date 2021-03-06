// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeService;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentPhysicalPropertyService;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentService;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import com.lacunalabs.dm.web.MaterialComponentPhysicalPropertyController;
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

privileged aspect MaterialComponentPhysicalPropertyController_Roo_Controller {
    
    @Autowired
    MaterialComponentPhysicalPropertyService MaterialComponentPhysicalPropertyController.materialComponentPhysicalPropertyService;
    
    @Autowired
    PhysicalPropertyTypeService MaterialComponentPhysicalPropertyController.physicalPropertyTypeService;
    
    @Autowired
    MaterialComponentService MaterialComponentPhysicalPropertyController.materialComponentService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.create(@Valid MaterialComponentPhysicalProperty materialComponentPhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, materialComponentPhysicalProperty);
            return "materialcomponentphysicalpropertys/create";
        }
        uiModel.asMap().clear();
        materialComponentPhysicalPropertyService.saveMaterialComponentPhysicalProperty(materialComponentPhysicalProperty);
        return "redirect:/materialcomponentphysicalpropertys/" + encodeUrlPathSegment(materialComponentPhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MaterialComponentPhysicalProperty());
        return "materialcomponentphysicalpropertys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("materialcomponentphysicalproperty", materialComponentPhysicalPropertyService.findMaterialComponentPhysicalProperty(id));
        uiModel.addAttribute("itemId", id);
        return "materialcomponentphysicalpropertys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("materialcomponentphysicalpropertys", materialComponentPhysicalPropertyService.findMaterialComponentPhysicalPropertyEntries(firstResult, sizeNo));
            float nrOfPages = (float) materialComponentPhysicalPropertyService.countAllMaterialComponentPhysicalPropertys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("materialcomponentphysicalpropertys", materialComponentPhysicalPropertyService.findAllMaterialComponentPhysicalPropertys());
        }
        return "materialcomponentphysicalpropertys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.update(@Valid MaterialComponentPhysicalProperty materialComponentPhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, materialComponentPhysicalProperty);
            return "materialcomponentphysicalpropertys/update";
        }
        uiModel.asMap().clear();
        materialComponentPhysicalPropertyService.updateMaterialComponentPhysicalProperty(materialComponentPhysicalProperty);
        return "redirect:/materialcomponentphysicalpropertys/" + encodeUrlPathSegment(materialComponentPhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, materialComponentPhysicalPropertyService.findMaterialComponentPhysicalProperty(id));
        return "materialcomponentphysicalpropertys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MaterialComponentPhysicalPropertyController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MaterialComponentPhysicalProperty materialComponentPhysicalProperty = materialComponentPhysicalPropertyService.findMaterialComponentPhysicalProperty(id);
        materialComponentPhysicalPropertyService.deleteMaterialComponentPhysicalProperty(materialComponentPhysicalProperty);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/materialcomponentphysicalpropertys";
    }
    
    void MaterialComponentPhysicalPropertyController.populateEditForm(Model uiModel, MaterialComponentPhysicalProperty materialComponentPhysicalProperty) {
        uiModel.addAttribute("materialComponentPhysicalProperty", materialComponentPhysicalProperty);
        uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findAllPhysicalPropertyTypes());
        uiModel.addAttribute("materialcomponents", materialComponentService.findAllMaterialComponents());
        uiModel.addAttribute("uncertaintytypes", Arrays.asList(UncertaintyType.values()));
    }
    
    String MaterialComponentPhysicalPropertyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
