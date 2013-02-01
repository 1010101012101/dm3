// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeService;
import com.lacunalabs.dm.shared.physics.crystallography.CrystalIdentifierType;
import com.lacunalabs.dm.web.UnitCellTypeController;
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

privileged aspect UnitCellTypeController_Roo_Controller {
    
    @Autowired
    UnitCellTypeService UnitCellTypeController.unitCellTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UnitCellTypeController.create(@Valid UnitCellType unitCellType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitCellType);
            return "unitcelltypes/create";
        }
        uiModel.asMap().clear();
        unitCellTypeService.saveUnitCellType(unitCellType);
        return "redirect:/unitcelltypes/" + encodeUrlPathSegment(unitCellType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UnitCellTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UnitCellType());
        return "unitcelltypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UnitCellTypeController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("unitcelltype", unitCellTypeService.findUnitCellType(id));
        uiModel.addAttribute("itemId", id);
        return "unitcelltypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UnitCellTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("unitcelltypes", unitCellTypeService.findUnitCellTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) unitCellTypeService.countAllUnitCellTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("unitcelltypes", unitCellTypeService.findAllUnitCellTypes());
        }
        return "unitcelltypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UnitCellTypeController.update(@Valid UnitCellType unitCellType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitCellType);
            return "unitcelltypes/update";
        }
        uiModel.asMap().clear();
        unitCellTypeService.updateUnitCellType(unitCellType);
        return "redirect:/unitcelltypes/" + encodeUrlPathSegment(unitCellType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UnitCellTypeController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, unitCellTypeService.findUnitCellType(id));
        return "unitcelltypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UnitCellTypeController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UnitCellType unitCellType = unitCellTypeService.findUnitCellType(id);
        unitCellTypeService.deleteUnitCellType(unitCellType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/unitcelltypes";
    }
    
    void UnitCellTypeController.populateEditForm(Model uiModel, UnitCellType unitCellType) {
        uiModel.addAttribute("unitCellType", unitCellType);
        uiModel.addAttribute("crystalidentifiertypes", Arrays.asList(CrystalIdentifierType.values()));
    }
    
    String UnitCellTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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