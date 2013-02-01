// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Vector2D;
import com.lacunalabs.dm.data.repository.math.geometry.Vector2DRepository;
import com.lacunalabs.dm.data.repository.math.geometry.Vector2DServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Vector2DServiceImpl_Roo_Service {
    
    declare @type: Vector2DServiceImpl: @Service;
    
    declare @type: Vector2DServiceImpl: @Transactional;
    
    @Autowired
    Vector2DRepository Vector2DServiceImpl.vector2DRepository;
    
    public long Vector2DServiceImpl.countAllVector2Ds() {
        return vector2DRepository.count();
    }
    
    public void Vector2DServiceImpl.deleteVector2D(Vector2D vector2D) {
        vector2DRepository.delete(vector2D);
    }
    
    public Vector2D Vector2DServiceImpl.findVector2D(BigInteger id) {
        return vector2DRepository.findOne(id);
    }
    
    public List<Vector2D> Vector2DServiceImpl.findAllVector2Ds() {
        return vector2DRepository.findAll();
    }
    
    public List<Vector2D> Vector2DServiceImpl.findVector2DEntries(int firstResult, int maxResults) {
        return vector2DRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void Vector2DServiceImpl.saveVector2D(Vector2D vector2D) {
        vector2DRepository.save(vector2D);
    }
    
    public Vector2D Vector2DServiceImpl.updateVector2D(Vector2D vector2D) {
        return vector2DRepository.save(vector2D);
    }
    
}