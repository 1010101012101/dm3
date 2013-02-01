// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.LatticeVector3D;
import com.lacunalabs.dm.data.repository.physics.crystallography.LatticeVector3DRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect LatticeVector3DRepository_Roo_Mongo_Repository {
    
    declare parents: LatticeVector3DRepository extends PagingAndSortingRepository<LatticeVector3D, BigInteger>;
    
    declare @type: LatticeVector3DRepository: @Repository;
    
}