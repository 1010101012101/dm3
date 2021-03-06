// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.AtomicPosition;
import com.lacunalabs.dm.data.repository.physics.crystallography.AtomicPositionRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect AtomicPositionRepository_Roo_Mongo_Repository {
    
    declare parents: AtomicPositionRepository extends PagingAndSortingRepository<AtomicPosition, BigInteger>;
    
    declare @type: AtomicPositionRepository: @Repository;
    
}
