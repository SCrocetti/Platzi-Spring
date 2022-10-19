package com.plazi.market.persistencia.crud;

import com.plazi.market.persistencia.entity.Producto;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface ProductoCrudRepository extends CrudRepository<Producto,Integer> {
    // query method.
    List<Producto> findByIdCategoriaOrderByNombreDesc(int idCategoria);

    // basicamente podes hablarle en lenguaje natural XD
    Optional<List<Producto>> findByCantidadStockLessThanAndEstado(int cantidadStock,boolean estado);
}
