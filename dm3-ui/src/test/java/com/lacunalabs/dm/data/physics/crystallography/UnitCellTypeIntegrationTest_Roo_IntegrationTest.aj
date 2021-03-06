// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellTypeDataOnDemand;
import com.lacunalabs.dm.data.physics.crystallography.UnitCellTypeIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect UnitCellTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UnitCellTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UnitCellTypeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private UnitCellTypeDataOnDemand UnitCellTypeIntegrationTest.dod;
    
    @Autowired
    UnitCellTypeService UnitCellTypeIntegrationTest.unitCellTypeService;
    
    @Test
    public void UnitCellTypeIntegrationTest.testCountAllUnitCellTypes() {
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", dod.getRandomUnitCellType());
        long count = unitCellTypeService.countAllUnitCellTypes();
        Assert.assertTrue("Counter for 'UnitCellType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UnitCellTypeIntegrationTest.testFindUnitCellType() {
        UnitCellType obj = dod.getRandomUnitCellType();
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to provide an identifier", id);
        obj = unitCellTypeService.findUnitCellType(id);
        Assert.assertNotNull("Find method for 'UnitCellType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UnitCellType' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UnitCellTypeIntegrationTest.testFindAllUnitCellTypes() {
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", dod.getRandomUnitCellType());
        long count = unitCellTypeService.countAllUnitCellTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'UnitCellType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UnitCellType> result = unitCellTypeService.findAllUnitCellTypes();
        Assert.assertNotNull("Find all method for 'UnitCellType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UnitCellType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UnitCellTypeIntegrationTest.testFindUnitCellTypeEntries() {
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", dod.getRandomUnitCellType());
        long count = unitCellTypeService.countAllUnitCellTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UnitCellType> result = unitCellTypeService.findUnitCellTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UnitCellType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UnitCellType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UnitCellTypeIntegrationTest.testSaveUnitCellType() {
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", dod.getRandomUnitCellType());
        UnitCellType obj = dod.getNewTransientUnitCellType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UnitCellType' identifier to be null", obj.getId());
        unitCellTypeService.saveUnitCellType(obj);
        Assert.assertNotNull("Expected 'UnitCellType' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UnitCellTypeIntegrationTest.testDeleteUnitCellType() {
        UnitCellType obj = dod.getRandomUnitCellType();
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UnitCellType' failed to provide an identifier", id);
        obj = unitCellTypeService.findUnitCellType(id);
        unitCellTypeService.deleteUnitCellType(obj);
        Assert.assertNull("Failed to remove 'UnitCellType' with identifier '" + id + "'", unitCellTypeService.findUnitCellType(id));
    }
    
}
