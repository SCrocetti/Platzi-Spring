package com.plazi.market.persistencia;

import com.plazi.market.persistencia.crud.ProductoCrudRepository;
import com.plazi.market.persistencia.entity.Producto;

import java.util.List;

public class ProductoRepository {
    private ProductoCrudRepository productoCrudRepository;
    public List<Producto> getAll(){
        return (List<Producto>) productoCrudRepository.findAll();
    }
}
