// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import com.lacunalabs.dm.data.physics.crystallography.UnitCellPhysicalProperty;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import java.math.BigDecimal;

privileged aspect UnitCellPhysicalProperty_Roo_JavaBean {
    
    public PhysicalPropertyType UnitCellPhysicalProperty.getPropertyType() {
        return this.propertyType;
    }
    
    public void UnitCellPhysicalProperty.setPropertyType(PhysicalPropertyType propertyType) {
        this.propertyType = propertyType;
    }
    
    public UnitCell UnitCellPhysicalProperty.getCrystal() {
        return this.crystal;
    }
    
    public void UnitCellPhysicalProperty.setCrystal(UnitCell crystal) {
        this.crystal = crystal;
    }
    
    public BigDecimal UnitCellPhysicalProperty.getQuantity() {
        return this.quantity;
    }
    
    public void UnitCellPhysicalProperty.setQuantity(BigDecimal quantity) {
        this.quantity = quantity;
    }
    
    public String UnitCellPhysicalProperty.getFunctionParameters() {
        return this.functionParameters;
    }
    
    public void UnitCellPhysicalProperty.setFunctionParameters(String functionParameters) {
        this.functionParameters = functionParameters;
    }
    
    public BigDecimal UnitCellPhysicalProperty.getUncertainty() {
        return this.uncertainty;
    }
    
    public void UnitCellPhysicalProperty.setUncertainty(BigDecimal uncertainty) {
        this.uncertainty = uncertainty;
    }
    
    public UncertaintyType UnitCellPhysicalProperty.getUncertaintyType() {
        return this.uncertaintyType;
    }
    
    public void UnitCellPhysicalProperty.setUncertaintyType(UncertaintyType uncertaintyType) {
        this.uncertaintyType = uncertaintyType;
    }
    
}