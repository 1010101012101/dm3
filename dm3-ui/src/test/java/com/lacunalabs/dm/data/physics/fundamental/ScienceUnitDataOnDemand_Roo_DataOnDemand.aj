// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ScienceUnit;
import com.lacunalabs.dm.data.physics.fundamental.ScienceUnitDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.ScienceUnitService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
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

privileged aspect ScienceUnitDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ScienceUnitDataOnDemand: @Component;
    
    private Random ScienceUnitDataOnDemand.rnd = new SecureRandom();
    
    private List<ScienceUnit> ScienceUnitDataOnDemand.data;
    
    @Autowired
    ScienceUnitService ScienceUnitDataOnDemand.scienceUnitService;
    
    public ScienceUnit ScienceUnitDataOnDemand.getNewTransientScienceUnit(int index) {
        ScienceUnit obj = new ScienceUnit();
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setSymbol(obj, index);
        return obj;
    }
    
    public void ScienceUnitDataOnDemand.setMetadata(ScienceUnit obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void ScienceUnitDataOnDemand.setMetadataType(ScienceUnit obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void ScienceUnitDataOnDemand.setName(ScienceUnit obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ScienceUnitDataOnDemand.setSymbol(ScienceUnit obj, int index) {
        String symbol = "symbol_" + index;
        if (symbol.length() > 10) {
            symbol = symbol.substring(0, 10);
        }
        obj.setSymbol(symbol);
    }
    
    public ScienceUnit ScienceUnitDataOnDemand.getSpecificScienceUnit(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ScienceUnit obj = data.get(index);
        BigInteger id = obj.getId();
        return scienceUnitService.findScienceUnit(id);
    }
    
    public ScienceUnit ScienceUnitDataOnDemand.getRandomScienceUnit() {
        init();
        ScienceUnit obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return scienceUnitService.findScienceUnit(id);
    }
    
    public boolean ScienceUnitDataOnDemand.modifyScienceUnit(ScienceUnit obj) {
        return false;
    }
    
    public void ScienceUnitDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = scienceUnitService.findScienceUnitEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ScienceUnit' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ScienceUnit>();
        for (int i = 0; i < 10; i++) {
            ScienceUnit obj = getNewTransientScienceUnit(i);
            try {
                scienceUnitService.saveScienceUnit(obj);
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
