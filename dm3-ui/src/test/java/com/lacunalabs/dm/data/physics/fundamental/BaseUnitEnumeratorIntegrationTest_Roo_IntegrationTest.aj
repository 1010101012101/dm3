// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumeratorDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumeratorIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitEnumeratorService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect BaseUnitEnumeratorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: BaseUnitEnumeratorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: BaseUnitEnumeratorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private BaseUnitEnumeratorDataOnDemand BaseUnitEnumeratorIntegrationTest.dod;
    
    @Autowired
    BaseUnitEnumeratorService BaseUnitEnumeratorIntegrationTest.baseUnitEnumeratorService;
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testCountAllBaseUnitEnumerators() {
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", dod.getRandomBaseUnitEnumerator());
        long count = baseUnitEnumeratorService.countAllBaseUnitEnumerators();
        Assert.assertTrue("Counter for 'BaseUnitEnumerator' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testFindBaseUnitEnumerator() {
        BaseUnitEnumerator obj = dod.getRandomBaseUnitEnumerator();
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to provide an identifier", id);
        obj = baseUnitEnumeratorService.findBaseUnitEnumerator(id);
        Assert.assertNotNull("Find method for 'BaseUnitEnumerator' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'BaseUnitEnumerator' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testFindAllBaseUnitEnumerators() {
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", dod.getRandomBaseUnitEnumerator());
        long count = baseUnitEnumeratorService.countAllBaseUnitEnumerators();
        Assert.assertTrue("Too expensive to perform a find all test for 'BaseUnitEnumerator', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<BaseUnitEnumerator> result = baseUnitEnumeratorService.findAllBaseUnitEnumerators();
        Assert.assertNotNull("Find all method for 'BaseUnitEnumerator' illegally returned null", result);
        Assert.assertTrue("Find all method for 'BaseUnitEnumerator' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testFindBaseUnitEnumeratorEntries() {
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", dod.getRandomBaseUnitEnumerator());
        long count = baseUnitEnumeratorService.countAllBaseUnitEnumerators();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<BaseUnitEnumerator> result = baseUnitEnumeratorService.findBaseUnitEnumeratorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'BaseUnitEnumerator' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'BaseUnitEnumerator' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testSaveBaseUnitEnumerator() {
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", dod.getRandomBaseUnitEnumerator());
        BaseUnitEnumerator obj = dod.getNewTransientBaseUnitEnumerator(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'BaseUnitEnumerator' identifier to be null", obj.getId());
        baseUnitEnumeratorService.saveBaseUnitEnumerator(obj);
        Assert.assertNotNull("Expected 'BaseUnitEnumerator' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void BaseUnitEnumeratorIntegrationTest.testDeleteBaseUnitEnumerator() {
        BaseUnitEnumerator obj = dod.getRandomBaseUnitEnumerator();
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'BaseUnitEnumerator' failed to provide an identifier", id);
        obj = baseUnitEnumeratorService.findBaseUnitEnumerator(id);
        baseUnitEnumeratorService.deleteBaseUnitEnumerator(obj);
        Assert.assertNull("Failed to remove 'BaseUnitEnumerator' with identifier '" + id + "'", baseUnitEnumeratorService.findBaseUnitEnumerator(id));
    }
    
}