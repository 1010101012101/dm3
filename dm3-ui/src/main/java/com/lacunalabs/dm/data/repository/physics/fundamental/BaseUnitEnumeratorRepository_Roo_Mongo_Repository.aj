// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitEnumeratorRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect BaseUnitEnumeratorRepository_Roo_Mongo_Repository {
    
    declare parents: BaseUnitEnumeratorRepository extends PagingAndSortingRepository<BaseUnitEnumerator, BigInteger>;
    
    declare @type: BaseUnitEnumeratorRepository: @Repository;
    
}
