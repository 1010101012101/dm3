// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.DecimalMultiplier;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect DecimalMultiplier_Roo_Mongo_Entity {
    
    declare @type: DecimalMultiplier: @Persistent;
    
    @Id
    private BigInteger DecimalMultiplier.id;
    
    public BigInteger DecimalMultiplier.getId() {
        return this.id;
    }
    
    public void DecimalMultiplier.setId(BigInteger id) {
        this.id = id;
    }
    
}
