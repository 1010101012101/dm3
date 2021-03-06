package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.Crystal;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Crystal.class)
public interface CrystalRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.Crystal> findAll();
}
