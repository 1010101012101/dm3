// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Centering_Roo_Mongo_Entity {
    
    declare @type: Centering: @Persistent;
    
    @Id
    private BigInteger Centering.id;
    
    public BigInteger Centering.getId() {
        return this.id;
    }
    
    public void Centering.setId(BigInteger id) {
        this.id = id;
    }
    
}
