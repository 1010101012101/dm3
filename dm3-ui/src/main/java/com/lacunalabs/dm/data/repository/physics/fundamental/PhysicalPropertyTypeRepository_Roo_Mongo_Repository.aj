// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect PhysicalPropertyTypeRepository_Roo_Mongo_Repository {
    
    declare parents: PhysicalPropertyTypeRepository extends PagingAndSortingRepository<PhysicalPropertyType, BigInteger>;
    
    declare @type: PhysicalPropertyTypeRepository: @Repository;
    
}
