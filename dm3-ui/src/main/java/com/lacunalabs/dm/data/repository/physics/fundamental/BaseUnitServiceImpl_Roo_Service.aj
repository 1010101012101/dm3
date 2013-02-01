// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnit;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitRepository;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BaseUnitServiceImpl_Roo_Service {
    
    declare @type: BaseUnitServiceImpl: @Service;
    
    declare @type: BaseUnitServiceImpl: @Transactional;
    
    @Autowired
    BaseUnitRepository BaseUnitServiceImpl.baseUnitRepository;
    
    public long BaseUnitServiceImpl.countAllBaseUnits() {
        return baseUnitRepository.count();
    }
    
    public void BaseUnitServiceImpl.deleteBaseUnit(BaseUnit baseUnit) {
        baseUnitRepository.delete(baseUnit);
    }
    
    public BaseUnit BaseUnitServiceImpl.findBaseUnit(BigInteger id) {
        return baseUnitRepository.findOne(id);
    }
    
    public List<BaseUnit> BaseUnitServiceImpl.findAllBaseUnits() {
        return baseUnitRepository.findAll();
    }
    
    public List<BaseUnit> BaseUnitServiceImpl.findBaseUnitEntries(int firstResult, int maxResults) {
        return baseUnitRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void BaseUnitServiceImpl.saveBaseUnit(BaseUnit baseUnit) {
        baseUnitRepository.save(baseUnit);
    }
    
    public BaseUnit BaseUnitServiceImpl.updateBaseUnit(BaseUnit baseUnit) {
        return baseUnitRepository.save(baseUnit);
    }
    
}