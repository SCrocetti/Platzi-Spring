package com.plazi.market.domain.service;

import com.plazi.market.domain.Product;
import com.plazi.market.persistencia.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    private ProductoRepository productoRepository;

    public List<Product> getAll(){
        return productoRepository.getAll();
    }

    public Optional<Product> getProduct(int productId){
        return productoRepository.getProduct(productId);
    }

    public Optional<List<Product>> getByCategory(int categoryId){
        return productoRepository.getByCategory(categoryId);
    }
    public Product save(Product product){
        return productoRepository.save(product);
    }

    public  boolean  delete(int idProducto){
        // Hermosa forma de hacer un safe delete.
        // lo mismo se puede lograr con un isPresent y un if, pero el map es mas compacto
        return getProduct(idProducto).map(product -> {
            productoRepository.delete(idProducto);
            return true;
        }).orElse(false);
    }
}
