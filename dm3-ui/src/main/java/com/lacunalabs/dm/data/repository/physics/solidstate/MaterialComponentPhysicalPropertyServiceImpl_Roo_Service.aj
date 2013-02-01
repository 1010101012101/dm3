// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentPhysicalPropertyRepository;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentPhysicalPropertyServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MaterialComponentPhysicalPropertyServiceImpl_Roo_Service {
    
    declare @type: MaterialComponentPhysicalPropertyServiceImpl: @Service;
    
    declare @type: MaterialComponentPhysicalPropertyServiceImpl: @Transactional;
    
    @Autowired
    MaterialComponentPhysicalPropertyRepository MaterialComponentPhysicalPropertyServiceImpl.materialComponentPhysicalPropertyRepository;
    
    public long MaterialComponentPhysicalPropertyServiceImpl.countAllMaterialComponentPhysicalPropertys() {
        return materialComponentPhysicalPropertyRepository.count();
    }
    
    public void MaterialComponentPhysicalPropertyServiceImpl.deleteMaterialComponentPhysicalProperty(MaterialComponentPhysicalProperty materialComponentPhysicalProperty) {
        materialComponentPhysicalPropertyRepository.delete(materialComponentPhysicalProperty);
    }
    
    public MaterialComponentPhysicalProperty MaterialComponentPhysicalPropertyServiceImpl.findMaterialComponentPhysicalProperty(BigInteger id) {
        return materialComponentPhysicalPropertyRepository.findOne(id);
    }
    
    public List<MaterialComponentPhysicalProperty> MaterialComponentPhysicalPropertyServiceImpl.findAllMaterialComponentPhysicalPropertys() {
        return materialComponentPhysicalPropertyRepository.findAll();
    }
    
    public List<MaterialComponentPhysicalProperty> MaterialComponentPhysicalPropertyServiceImpl.findMaterialComponentPhysicalPropertyEntries(int firstResult, int maxResults) {
        return materialComponentPhysicalPropertyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MaterialComponentPhysicalPropertyServiceImpl.saveMaterialComponentPhysicalProperty(MaterialComponentPhysicalProperty materialComponentPhysicalProperty) {
        materialComponentPhysicalPropertyRepository.save(materialComponentPhysicalProperty);
    }
    
    public MaterialComponentPhysicalProperty MaterialComponentPhysicalPropertyServiceImpl.updateMaterialComponentPhysicalProperty(MaterialComponentPhysicalProperty materialComponentPhysicalProperty) {
        return materialComponentPhysicalPropertyRepository.save(materialComponentPhysicalProperty);
    }
    
}