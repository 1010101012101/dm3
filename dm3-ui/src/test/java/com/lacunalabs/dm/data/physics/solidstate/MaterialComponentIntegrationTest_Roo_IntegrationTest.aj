// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentDataOnDemand;
import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect MaterialComponentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MaterialComponentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MaterialComponentIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private MaterialComponentDataOnDemand MaterialComponentIntegrationTest.dod;
    
    @Autowired
    MaterialComponentService MaterialComponentIntegrationTest.materialComponentService;
    
    @Test
    public void MaterialComponentIntegrationTest.testCountAllMaterialComponents() {
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", dod.getRandomMaterialComponent());
        long count = materialComponentService.countAllMaterialComponents();
        Assert.assertTrue("Counter for 'MaterialComponent' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MaterialComponentIntegrationTest.testFindMaterialComponent() {
        MaterialComponent obj = dod.getRandomMaterialComponent();
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to provide an identifier", id);
        obj = materialComponentService.findMaterialComponent(id);
        Assert.assertNotNull("Find method for 'MaterialComponent' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'MaterialComponent' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MaterialComponentIntegrationTest.testFindAllMaterialComponents() {
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", dod.getRandomMaterialComponent());
        long count = materialComponentService.countAllMaterialComponents();
        Assert.assertTrue("Too expensive to perform a find all test for 'MaterialComponent', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<MaterialComponent> result = materialComponentService.findAllMaterialComponents();
        Assert.assertNotNull("Find all method for 'MaterialComponent' illegally returned null", result);
        Assert.assertTrue("Find all method for 'MaterialComponent' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MaterialComponentIntegrationTest.testFindMaterialComponentEntries() {
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", dod.getRandomMaterialComponent());
        long count = materialComponentService.countAllMaterialComponents();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<MaterialComponent> result = materialComponentService.findMaterialComponentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'MaterialComponent' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'MaterialComponent' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MaterialComponentIntegrationTest.testSaveMaterialComponent() {
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", dod.getRandomMaterialComponent());
        MaterialComponent obj = dod.getNewTransientMaterialComponent(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'MaterialComponent' identifier to be null", obj.getId());
        materialComponentService.saveMaterialComponent(obj);
        Assert.assertNotNull("Expected 'MaterialComponent' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MaterialComponentIntegrationTest.testDeleteMaterialComponent() {
        MaterialComponent obj = dod.getRandomMaterialComponent();
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MaterialComponent' failed to provide an identifier", id);
        obj = materialComponentService.findMaterialComponent(id);
        materialComponentService.deleteMaterialComponent(obj);
        Assert.assertNull("Failed to remove 'MaterialComponent' with identifier '" + id + "'", materialComponentService.findMaterialComponent(id));
    }
    
}
