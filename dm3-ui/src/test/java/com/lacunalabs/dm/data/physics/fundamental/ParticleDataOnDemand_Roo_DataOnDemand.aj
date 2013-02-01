// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.Particle;
import com.lacunalabs.dm.data.physics.fundamental.ParticleDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.ParticleType;
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

privileged aspect ParticleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ParticleDataOnDemand: @Component;
    
    private Random ParticleDataOnDemand.rnd = new SecureRandom();
    
    private List<Particle> ParticleDataOnDemand.data;
    
    @Autowired
    ParticleService ParticleDataOnDemand.particleService;
    
    public Particle ParticleDataOnDemand.getNewTransientParticle(int index) {
        Particle obj = new Particle();
        setCharge(obj, index);
        setMass(obj, index);
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setParticleType(obj, index);
        setSpin(obj, index);
        setSymbol(obj, index);
        return obj;
    }
    
    public void ParticleDataOnDemand.setCharge(Particle obj, int index) {
        BigDecimal charge = BigDecimal.valueOf(index);
        obj.setCharge(charge);
    }
    
    public void ParticleDataOnDemand.setMass(Particle obj, int index) {
        BigDecimal mass = BigDecimal.valueOf(index);
        obj.setMass(mass);
    }
    
    public void ParticleDataOnDemand.setMetadata(Particle obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void ParticleDataOnDemand.setMetadataType(Particle obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void ParticleDataOnDemand.setName(Particle obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ParticleDataOnDemand.setParticleType(Particle obj, int index) {
        ParticleType particleType = ParticleType.class.getEnumConstants()[0];
        obj.setParticleType(particleType);
    }
    
    public void ParticleDataOnDemand.setSpin(Particle obj, int index) {
        BigDecimal spin = BigDecimal.valueOf(index);
        obj.setSpin(spin);
    }
    
    public void ParticleDataOnDemand.setSymbol(Particle obj, int index) {
        String symbol = "symbol_" + index;
        if (symbol.length() > 10) {
            symbol = symbol.substring(0, 10);
        }
        obj.setSymbol(symbol);
    }
    
    public Particle ParticleDataOnDemand.getSpecificParticle(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Particle obj = data.get(index);
        BigInteger id = obj.getId();
        return particleService.findParticle(id);
    }
    
    public Particle ParticleDataOnDemand.getRandomParticle() {
        init();
        Particle obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return particleService.findParticle(id);
    }
    
    public boolean ParticleDataOnDemand.modifyParticle(Particle obj) {
        return false;
    }
    
    public void ParticleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = particleService.findParticleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Particle' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Particle>();
        for (int i = 0; i < 10; i++) {
            Particle obj = getNewTransientParticle(i);
            try {
                particleService.saveParticle(obj);
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