// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.TemDataOnDemand;
import com.lacunalabs.dm.data.physics.instruments.TemIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.instruments.TemService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect TemIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TemIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TemIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private TemDataOnDemand TemIntegrationTest.dod;
    
    @Autowired
    TemService TemIntegrationTest.temService;
    
    @Test
    public void TemIntegrationTest.testCountAllTems() {
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", dod.getRandomTem());
        long count = temService.countAllTems();
        Assert.assertTrue("Counter for 'Tem' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TemIntegrationTest.testFindTem() {
        Tem obj = dod.getRandomTem();
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tem' failed to provide an identifier", id);
        obj = temService.findTem(id);
        Assert.assertNotNull("Find method for 'Tem' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Tem' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TemIntegrationTest.testFindAllTems() {
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", dod.getRandomTem());
        long count = temService.countAllTems();
        Assert.assertTrue("Too expensive to perform a find all test for 'Tem', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Tem> result = temService.findAllTems();
        Assert.assertNotNull("Find all method for 'Tem' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Tem' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TemIntegrationTest.testFindTemEntries() {
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", dod.getRandomTem());
        long count = temService.countAllTems();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Tem> result = temService.findTemEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Tem' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Tem' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TemIntegrationTest.testSaveTem() {
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", dod.getRandomTem());
        Tem obj = dod.getNewTransientTem(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Tem' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Tem' identifier to be null", obj.getId());
        temService.saveTem(obj);
        Assert.assertNotNull("Expected 'Tem' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TemIntegrationTest.testDeleteTem() {
        Tem obj = dod.getRandomTem();
        Assert.assertNotNull("Data on demand for 'Tem' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tem' failed to provide an identifier", id);
        obj = temService.findTem(id);
        temService.deleteTem(obj);
        Assert.assertNull("Failed to remove 'Tem' with identifier '" + id + "'", temService.findTem(id));
    }
    
}