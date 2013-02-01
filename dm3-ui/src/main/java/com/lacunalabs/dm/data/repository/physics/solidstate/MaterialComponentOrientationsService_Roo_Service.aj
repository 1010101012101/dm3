// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentOrientations;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentOrientationsService;
import java.math.BigInteger;
import java.util.List;

privileged aspect MaterialComponentOrientationsService_Roo_Service {
    
    public abstract long MaterialComponentOrientationsService.countAllMaterialComponentOrientationses();    
    public abstract void MaterialComponentOrientationsService.deleteMaterialComponentOrientations(MaterialComponentOrientations materialComponentOrientations);    
    public abstract MaterialComponentOrientations MaterialComponentOrientationsService.findMaterialComponentOrientations(BigInteger id);    
    public abstract List<MaterialComponentOrientations> MaterialComponentOrientationsService.findAllMaterialComponentOrientationses();    
    public abstract List<MaterialComponentOrientations> MaterialComponentOrientationsService.findMaterialComponentOrientationsEntries(int firstResult, int maxResults);    
    public abstract void MaterialComponentOrientationsService.saveMaterialComponentOrientations(MaterialComponentOrientations materialComponentOrientations);    
    public abstract MaterialComponentOrientations MaterialComponentOrientationsService.updateMaterialComponentOrientations(MaterialComponentOrientations materialComponentOrientations);    
}