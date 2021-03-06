// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.Unit;
import com.lacunalabs.dm.data.repository.physics.fundamental.UnitRepository;
import com.lacunalabs.dm.data.repository.physics.fundamental.UnitServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UnitServiceImpl_Roo_Service {
    
    declare @type: UnitServiceImpl: @Service;
    
    declare @type: UnitServiceImpl: @Transactional;
    
    @Autowired
    UnitRepository UnitServiceImpl.unitRepository;
    
    public long UnitServiceImpl.countAllUnits() {
        return unitRepository.count();
    }
    
    public void UnitServiceImpl.deleteUnit(Unit unit) {
        unitRepository.delete(unit);
    }
    
    public Unit UnitServiceImpl.findUnit(BigInteger id) {
        return unitRepository.findOne(id);
    }
    
    public List<Unit> UnitServiceImpl.findAllUnits() {
        return unitRepository.findAll();
    }
    
    public List<Unit> UnitServiceImpl.findUnitEntries(int firstResult, int maxResults) {
        return unitRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UnitServiceImpl.saveUnit(Unit unit) {
        unitRepository.save(unit);
    }
    
    public Unit UnitServiceImpl.updateUnit(Unit unit) {
        return unitRepository.save(unit);
    }
    
}
