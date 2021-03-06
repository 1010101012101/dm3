// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeRepository;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PhysicalPropertyTypeServiceImpl_Roo_Service {
    
    declare @type: PhysicalPropertyTypeServiceImpl: @Service;
    
    declare @type: PhysicalPropertyTypeServiceImpl: @Transactional;
    
    @Autowired
    PhysicalPropertyTypeRepository PhysicalPropertyTypeServiceImpl.physicalPropertyTypeRepository;
    
    public long PhysicalPropertyTypeServiceImpl.countAllPhysicalPropertyTypes() {
        return physicalPropertyTypeRepository.count();
    }
    
    public void PhysicalPropertyTypeServiceImpl.deletePhysicalPropertyType(PhysicalPropertyType physicalPropertyType) {
        physicalPropertyTypeRepository.delete(physicalPropertyType);
    }
    
    public PhysicalPropertyType PhysicalPropertyTypeServiceImpl.findPhysicalPropertyType(BigInteger id) {
        return physicalPropertyTypeRepository.findOne(id);
    }
    
    public List<PhysicalPropertyType> PhysicalPropertyTypeServiceImpl.findAllPhysicalPropertyTypes() {
        return physicalPropertyTypeRepository.findAll();
    }
    
    public List<PhysicalPropertyType> PhysicalPropertyTypeServiceImpl.findPhysicalPropertyTypeEntries(int firstResult, int maxResults) {
        return physicalPropertyTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PhysicalPropertyTypeServiceImpl.savePhysicalPropertyType(PhysicalPropertyType physicalPropertyType) {
        physicalPropertyTypeRepository.save(physicalPropertyType);
    }
    
    public PhysicalPropertyType PhysicalPropertyTypeServiceImpl.updatePhysicalPropertyType(PhysicalPropertyType physicalPropertyType) {
        return physicalPropertyTypeRepository.save(physicalPropertyType);
    }
    
}
