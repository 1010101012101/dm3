// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect BaseUnitEnumerator_Roo_Mongo_Entity {
    
    declare @type: BaseUnitEnumerator: @Persistent;
    
    @Id
    private BigInteger BaseUnitEnumerator.id;
    
    public BigInteger BaseUnitEnumerator.getId() {
        return this.id;
    }
    
    public void BaseUnitEnumerator.setId(BigInteger id) {
        this.id = id;
    }
    
}