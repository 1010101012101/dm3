// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTable;
import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry;
import java.util.Set;

privileged aspect PeriodicTable_Roo_JavaBean {
    
    public Set<PeriodicTableEntry> PeriodicTable.getElements() {
        return this.elements;
    }
    
    public void PeriodicTable.setElements(Set<PeriodicTableEntry> elements) {
        this.elements = elements;
    }
    
    public String PeriodicTable.getName() {
        return this.name;
    }
    
    public void PeriodicTable.setName(String name) {
        this.name = name;
    }
    
}
