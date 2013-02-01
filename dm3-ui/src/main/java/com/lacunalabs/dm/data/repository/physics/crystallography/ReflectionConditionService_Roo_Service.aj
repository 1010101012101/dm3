// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition;
import com.lacunalabs.dm.data.repository.physics.crystallography.ReflectionConditionService;
import java.math.BigInteger;
import java.util.List;

privileged aspect ReflectionConditionService_Roo_Service {
    
    public abstract long ReflectionConditionService.countAllReflectionConditions();    
    public abstract void ReflectionConditionService.deleteReflectionCondition(ReflectionCondition reflectionCondition);    
    public abstract ReflectionCondition ReflectionConditionService.findReflectionCondition(BigInteger id);    
    public abstract List<ReflectionCondition> ReflectionConditionService.findAllReflectionConditions();    
    public abstract List<ReflectionCondition> ReflectionConditionService.findReflectionConditionEntries(int firstResult, int maxResults);    
    public abstract void ReflectionConditionService.saveReflectionCondition(ReflectionCondition reflectionCondition);    
    public abstract ReflectionCondition ReflectionConditionService.updateReflectionCondition(ReflectionCondition reflectionCondition);    
}