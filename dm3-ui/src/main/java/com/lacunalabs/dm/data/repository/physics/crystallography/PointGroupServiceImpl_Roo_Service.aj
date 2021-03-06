// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.PointGroup;
import com.lacunalabs.dm.data.repository.physics.crystallography.PointGroupRepository;
import com.lacunalabs.dm.data.repository.physics.crystallography.PointGroupServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PointGroupServiceImpl_Roo_Service {
    
    declare @type: PointGroupServiceImpl: @Service;
    
    declare @type: PointGroupServiceImpl: @Transactional;
    
    @Autowired
    PointGroupRepository PointGroupServiceImpl.pointGroupRepository;
    
    public long PointGroupServiceImpl.countAllPointGroups() {
        return pointGroupRepository.count();
    }
    
    public void PointGroupServiceImpl.deletePointGroup(PointGroup pointGroup) {
        pointGroupRepository.delete(pointGroup);
    }
    
    public PointGroup PointGroupServiceImpl.findPointGroup(BigInteger id) {
        return pointGroupRepository.findOne(id);
    }
    
    public List<PointGroup> PointGroupServiceImpl.findAllPointGroups() {
        return pointGroupRepository.findAll();
    }
    
    public List<PointGroup> PointGroupServiceImpl.findPointGroupEntries(int firstResult, int maxResults) {
        return pointGroupRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PointGroupServiceImpl.savePointGroup(PointGroup pointGroup) {
        pointGroupRepository.save(pointGroup);
    }
    
    public PointGroup PointGroupServiceImpl.updatePointGroup(PointGroup pointGroup) {
        return pointGroupRepository.save(pointGroup);
    }
    
}
