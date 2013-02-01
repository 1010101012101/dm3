// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.fundamental.PeriodicTableService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect PeriodicTableIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PeriodicTableIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PeriodicTableIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private PeriodicTableDataOnDemand PeriodicTableIntegrationTest.dod;
    
    @Autowired
    PeriodicTableService PeriodicTableIntegrationTest.periodicTableService;
    
    @Test
    public void PeriodicTableIntegrationTest.testCountAllPeriodicTables() {
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", dod.getRandomPeriodicTable());
        long count = periodicTableService.countAllPeriodicTables();
        Assert.assertTrue("Counter for 'PeriodicTable' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PeriodicTableIntegrationTest.testFindPeriodicTable() {
        PeriodicTable obj = dod.getRandomPeriodicTable();
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to provide an identifier", id);
        obj = periodicTableService.findPeriodicTable(id);
        Assert.assertNotNull("Find method for 'PeriodicTable' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PeriodicTable' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PeriodicTableIntegrationTest.testFindAllPeriodicTables() {
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", dod.getRandomPeriodicTable());
        long count = periodicTableService.countAllPeriodicTables();
        Assert.assertTrue("Too expensive to perform a find all test for 'PeriodicTable', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PeriodicTable> result = periodicTableService.findAllPeriodicTables();
        Assert.assertNotNull("Find all method for 'PeriodicTable' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PeriodicTable' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PeriodicTableIntegrationTest.testFindPeriodicTableEntries() {
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", dod.getRandomPeriodicTable());
        long count = periodicTableService.countAllPeriodicTables();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PeriodicTable> result = periodicTableService.findPeriodicTableEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PeriodicTable' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PeriodicTable' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PeriodicTableIntegrationTest.testSavePeriodicTable() {
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", dod.getRandomPeriodicTable());
        PeriodicTable obj = dod.getNewTransientPeriodicTable(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PeriodicTable' identifier to be null", obj.getId());
        periodicTableService.savePeriodicTable(obj);
        Assert.assertNotNull("Expected 'PeriodicTable' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PeriodicTableIntegrationTest.testDeletePeriodicTable() {
        PeriodicTable obj = dod.getRandomPeriodicTable();
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PeriodicTable' failed to provide an identifier", id);
        obj = periodicTableService.findPeriodicTable(id);
        periodicTableService.deletePeriodicTable(obj);
        Assert.assertNull("Failed to remove 'PeriodicTable' with identifier '" + id + "'", periodicTableService.findPeriodicTable(id));
    }
    
}