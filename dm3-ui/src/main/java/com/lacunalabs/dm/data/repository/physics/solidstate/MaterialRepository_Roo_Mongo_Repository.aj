// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect MaterialRepository_Roo_Mongo_Repository {
    
    declare parents: MaterialRepository extends PagingAndSortingRepository<Material, BigInteger>;
    
    declare @type: MaterialRepository: @Repository;
    
}