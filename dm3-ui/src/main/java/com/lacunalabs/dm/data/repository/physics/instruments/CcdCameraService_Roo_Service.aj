// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.CcdCamera;
import com.lacunalabs.dm.data.repository.physics.instruments.CcdCameraService;
import java.math.BigInteger;
import java.util.List;

privileged aspect CcdCameraService_Roo_Service {
    
    public abstract long CcdCameraService.countAllCcdCameras();    
    public abstract void CcdCameraService.deleteCcdCamera(CcdCamera ccdCamera);    
    public abstract CcdCamera CcdCameraService.findCcdCamera(BigInteger id);    
    public abstract List<CcdCamera> CcdCameraService.findAllCcdCameras();    
    public abstract List<CcdCamera> CcdCameraService.findCcdCameraEntries(int firstResult, int maxResults);    
    public abstract void CcdCameraService.saveCcdCamera(CcdCamera ccdCamera);    
    public abstract CcdCamera CcdCameraService.updateCcdCamera(CcdCamera ccdCamera);    
}
