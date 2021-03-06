// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import com.lacunalabs.dm.data.math.geometry.Vector3D;
import com.lacunalabs.dm.data.physics.experiment.Processor;
import com.lacunalabs.dm.data.physics.experiment.TemExperiment;
import com.lacunalabs.dm.data.physics.fundamental.ParticleBeam;
import com.lacunalabs.dm.data.physics.instruments.Aperature;
import com.lacunalabs.dm.data.physics.instruments.Tem;
import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.util.Set;

privileged aspect TemExperiment_Roo_JavaBean {
    
    public String TemExperiment.getIdentifier() {
        return this.identifier;
    }
    
    public void TemExperiment.setIdentifier(String identifier) {
        this.identifier = identifier;
    }
    
    public MetaDataType TemExperiment.getMetadataType() {
        return this.metadataType;
    }
    
    public void TemExperiment.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String TemExperiment.getMetadata() {
        return this.metadata;
    }
    
    public void TemExperiment.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
    public Tem TemExperiment.getTem() {
        return this.tem;
    }
    
    public void TemExperiment.setTem(Tem tem) {
        this.tem = tem;
    }
    
    public Aperature TemExperiment.getAperature() {
        return this.aperature;
    }
    
    public void TemExperiment.setAperature(Aperature aperature) {
        this.aperature = aperature;
    }
    
    public TemObjectiveLens TemExperiment.getObjectiveLens() {
        return this.objectiveLens;
    }
    
    public void TemExperiment.setObjectiveLens(TemObjectiveLens objectiveLens) {
        this.objectiveLens = objectiveLens;
    }
    
    public Set<Processor> TemExperiment.getProcessors() {
        return this.processors;
    }
    
    public void TemExperiment.setProcessors(Set<Processor> processors) {
        this.processors = processors;
    }
    
    public Material TemExperiment.getSample() {
        return this.sample;
    }
    
    public void TemExperiment.setSample(Material sample) {
        this.sample = sample;
    }
    
    public BigDecimal TemExperiment.getCameraLength() {
        return this.cameraLength;
    }
    
    public void TemExperiment.setCameraLength(BigDecimal cameraLength) {
        this.cameraLength = cameraLength;
    }
    
    public BigDecimal TemExperiment.getCameraConstant() {
        return this.cameraConstant;
    }
    
    public void TemExperiment.setCameraConstant(BigDecimal cameraConstant) {
        this.cameraConstant = cameraConstant;
    }
    
    public Boolean TemExperiment.getSetByCameraLength() {
        return this.setByCameraLength;
    }
    
    public void TemExperiment.setSetByCameraLength(Boolean setByCameraLength) {
        this.setByCameraLength = setByCameraLength;
    }
    
    public BigDecimal TemExperiment.getTilt() {
        return this.tilt;
    }
    
    public void TemExperiment.setTilt(BigDecimal tilt) {
        this.tilt = tilt;
    }
    
    public BigDecimal TemExperiment.getAzimuth() {
        return this.azimuth;
    }
    
    public void TemExperiment.setAzimuth(BigDecimal azimuth) {
        this.azimuth = azimuth;
    }
    
    public Vector3D TemExperiment.getStagePosition() {
        return this.stagePosition;
    }
    
    public void TemExperiment.setStagePosition(Vector3D stagePosition) {
        this.stagePosition = stagePosition;
    }
    
    public BigDecimal TemExperiment.getExposureTime() {
        return this.exposureTime;
    }
    
    public void TemExperiment.setExposureTime(BigDecimal exposureTime) {
        this.exposureTime = exposureTime;
    }
    
    public ParticleBeam TemExperiment.getBeam() {
        return this.beam;
    }
    
    public void TemExperiment.setBeam(ParticleBeam beam) {
        this.beam = beam;
    }
    
    public Orientation TemExperiment.getMatrixOrientation() {
        return this.matrixOrientation;
    }
    
    public void TemExperiment.setMatrixOrientation(Orientation matrixOrientation) {
        this.matrixOrientation = matrixOrientation;
    }
    
}
