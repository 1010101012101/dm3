// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticle;
import com.lacunalabs.dm.data.repository.physics.fundamental.CompositeParticleRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect CompositeParticleRepository_Roo_Mongo_Repository {
    
    declare parents: CompositeParticleRepository extends PagingAndSortingRepository<CompositeParticle, BigInteger>;
    
    declare @type: CompositeParticleRepository: @Repository;
    
}