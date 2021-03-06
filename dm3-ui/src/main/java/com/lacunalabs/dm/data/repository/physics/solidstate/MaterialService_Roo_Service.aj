// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialService;
import java.math.BigInteger;
import java.util.List;

privileged aspect MaterialService_Roo_Service {
    
    public abstract long MaterialService.countAllMaterials();    
    public abstract void MaterialService.deleteMaterial(Material material);    
    public abstract Material MaterialService.findMaterial(BigInteger id);    
    public abstract List<Material> MaterialService.findAllMaterials();    
    public abstract List<Material> MaterialService.findMaterialEntries(int firstResult, int maxResults);    
    public abstract void MaterialService.saveMaterial(Material material);    
    public abstract Material MaterialService.updateMaterial(Material material);    
}
