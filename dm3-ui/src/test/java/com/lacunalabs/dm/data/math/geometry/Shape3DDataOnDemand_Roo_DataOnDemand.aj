// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.data.math.geometry.Shape3DDataOnDemand;
import com.lacunalabs.dm.data.repository.math.geometry.Shape3DService;
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

privileged aspect Shape3DDataOnDemand_Roo_DataOnDemand {
    
    declare @type: Shape3DDataOnDemand: @Component;
    
    private Random Shape3DDataOnDemand.rnd = new SecureRandom();
    
    private List<Shape3D> Shape3DDataOnDemand.data;
    
    @Autowired
    Shape3DService Shape3DDataOnDemand.shape3DService;
    
    public Shape3D Shape3DDataOnDemand.getNewTransientShape3D(int index) {
        Shape3D obj = new Shape3D();
        setName(obj, index);
        return obj;
    }
    
    public void Shape3DDataOnDemand.setName(Shape3D obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Shape3D Shape3DDataOnDemand.getSpecificShape3D(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Shape3D obj = data.get(index);
        BigInteger id = obj.getId();
        return shape3DService.findShape3D(id);
    }
    
    public Shape3D Shape3DDataOnDemand.getRandomShape3D() {
        init();
        Shape3D obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return shape3DService.findShape3D(id);
    }
    
    public boolean Shape3DDataOnDemand.modifyShape3D(Shape3D obj) {
        return false;
    }
    
    public void Shape3DDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = shape3DService.findShape3DEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Shape3D' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Shape3D>();
        for (int i = 0; i < 10; i++) {
            Shape3D obj = getNewTransientShape3D(i);
            try {
                shape3DService.saveShape3D(obj);
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