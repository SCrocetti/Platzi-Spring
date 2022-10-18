package com.plazi.market.persistencia.crud;

import com.plazi.market.persistencia.entity.Producto;
import org.springframework.data.repository.CrudRepository;

public interface ProductoCrudRepository extends CrudRepository<Producto,Integer> {
}
