// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import com.lacunalabs.dm.data.repository.physics.fundamental.DecimalMultiplierService;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeService;
import com.lacunalabs.dm.data.repository.physics.fundamental.UnitService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.web.PhysicalPropertyTypeController;
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

privileged aspect PhysicalPropertyTypeController_Roo_Controller {
    
    @Autowired
    PhysicalPropertyTypeService PhysicalPropertyTypeController.physicalPropertyTypeService;
    
    @Autowired
    DecimalMultiplierService PhysicalPropertyTypeController.decimalMultiplierService;
    
    @Autowired
    UnitService PhysicalPropertyTypeController.unitService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PhysicalPropertyTypeController.create(@Valid PhysicalPropertyType physicalPropertyType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, physicalPropertyType);
            return "physicalpropertytypes/create";
        }
        uiModel.asMap().clear();
        physicalPropertyTypeService.savePhysicalPropertyType(physicalPropertyType);
        return "redirect:/physicalpropertytypes/" + encodeUrlPathSegment(physicalPropertyType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PhysicalPropertyTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PhysicalPropertyType());
        return "physicalpropertytypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PhysicalPropertyTypeController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("physicalpropertytype", physicalPropertyTypeService.findPhysicalPropertyType(id));
        uiModel.addAttribute("itemId", id);
        return "physicalpropertytypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PhysicalPropertyTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findPhysicalPropertyTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) physicalPropertyTypeService.countAllPhysicalPropertyTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findAllPhysicalPropertyTypes());
        }
        return "physicalpropertytypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PhysicalPropertyTypeController.update(@Valid PhysicalPropertyType physicalPropertyType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, physicalPropertyType);
            return "physicalpropertytypes/update";
        }
        uiModel.asMap().clear();
        physicalPropertyTypeService.updatePhysicalPropertyType(physicalPropertyType);
        return "redirect:/physicalpropertytypes/" + encodeUrlPathSegment(physicalPropertyType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PhysicalPropertyTypeController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, physicalPropertyTypeService.findPhysicalPropertyType(id));
        return "physicalpropertytypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PhysicalPropertyTypeController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PhysicalPropertyType physicalPropertyType = physicalPropertyTypeService.findPhysicalPropertyType(id);
        physicalPropertyTypeService.deletePhysicalPropertyType(physicalPropertyType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/physicalpropertytypes";
    }
    
    void PhysicalPropertyTypeController.populateEditForm(Model uiModel, PhysicalPropertyType physicalPropertyType) {
        uiModel.addAttribute("physicalPropertyType", physicalPropertyType);
        uiModel.addAttribute("decimalmultipliers", decimalMultiplierService.findAllDecimalMultipliers());
        uiModel.addAttribute("units", unitService.findAllUnits());
        uiModel.addAttribute("metadatatypes", Arrays.asList(MetaDataType.values()));
    }
    
    String PhysicalPropertyTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
