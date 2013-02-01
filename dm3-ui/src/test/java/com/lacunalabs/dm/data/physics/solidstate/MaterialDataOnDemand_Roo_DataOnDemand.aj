// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.Shape3DDataOnDemand;
import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.data.physics.solidstate.MaterialDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect MaterialDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MaterialDataOnDemand: @Component;
    
    private Random MaterialDataOnDemand.rnd = new SecureRandom();
    
    private List<Material> MaterialDataOnDemand.data;
    
    @Autowired
    private Shape3DDataOnDemand MaterialDataOnDemand.shape3DDataOnDemand;
    
    @Autowired
    MaterialService MaterialDataOnDemand.materialService;
    
    public Material MaterialDataOnDemand.getNewTransientMaterial(int index) {
        Material obj = new Material();
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setTotalVolume(obj, index);
        return obj;
    }
    
    public void MaterialDataOnDemand.setMetadata(Material obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void MaterialDataOnDemand.setMetadataType(Material obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void MaterialDataOnDemand.setName(Material obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void MaterialDataOnDemand.setTotalVolume(Material obj, int index) {
        BigDecimal totalVolume = BigDecimal.valueOf(index);
        obj.setTotalVolume(totalVolume);
    }
    
    public Material MaterialDataOnDemand.getSpecificMaterial(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Material obj = data.get(index);
        BigInteger id = obj.getId();
        return materialService.findMaterial(id);
    }
    
    public Material MaterialDataOnDemand.getRandomMaterial() {
        init();
        Material obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return materialService.findMaterial(id);
    }
    
    public boolean MaterialDataOnDemand.modifyMaterial(Material obj) {
        return false;
    }
    
    public void MaterialDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = materialService.findMaterialEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Material' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Material>();
        for (int i = 0; i < 10; i++) {
            Material obj = getNewTransientMaterial(i);
            try {
                materialService.saveMaterial(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}