// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialPhysicalPropertyRepository;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialPhysicalPropertyServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MaterialPhysicalPropertyServiceImpl_Roo_Service {
    
    declare @type: MaterialPhysicalPropertyServiceImpl: @Service;
    
    declare @type: MaterialPhysicalPropertyServiceImpl: @Transactional;
    
    @Autowired
    MaterialPhysicalPropertyRepository MaterialPhysicalPropertyServiceImpl.materialPhysicalPropertyRepository;
    
    public long MaterialPhysicalPropertyServiceImpl.countAllMaterialPhysicalPropertys() {
        return materialPhysicalPropertyRepository.count();
    }
    
    public void MaterialPhysicalPropertyServiceImpl.deleteMaterialPhysicalProperty(MaterialPhysicalProperty materialPhysicalProperty) {
        materialPhysicalPropertyRepository.delete(materialPhysicalProperty);
    }
    
    public MaterialPhysicalProperty MaterialPhysicalPropertyServiceImpl.findMaterialPhysicalProperty(BigInteger id) {
        return materialPhysicalPropertyRepository.findOne(id);
    }
    
    public List<MaterialPhysicalProperty> MaterialPhysicalPropertyServiceImpl.findAllMaterialPhysicalPropertys() {
        return materialPhysicalPropertyRepository.findAll();
    }
    
    public List<MaterialPhysicalProperty> MaterialPhysicalPropertyServiceImpl.findMaterialPhysicalPropertyEntries(int firstResult, int maxResults) {
        return materialPhysicalPropertyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MaterialPhysicalPropertyServiceImpl.saveMaterialPhysicalProperty(MaterialPhysicalProperty materialPhysicalProperty) {
        materialPhysicalPropertyRepository.save(materialPhysicalProperty);
    }
    
    public MaterialPhysicalProperty MaterialPhysicalPropertyServiceImpl.updateMaterialPhysicalProperty(MaterialPhysicalProperty materialPhysicalProperty) {
        return materialPhysicalPropertyRepository.save(materialPhysicalProperty);
    }
    
}
