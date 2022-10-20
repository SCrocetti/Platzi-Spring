package com.plazi.market.domain.repository;

import com.plazi.market.domain.Product;

import java.util.List;
import java.util.Optional;

// Ninguno de estos métodos depende de nuestra base de datos, todos están escritos en términos de dominio
// es decir de las clases que declaramos en ingles.
public interface ProductRepository {
    List<Product> getAll();
    Optional<List<Product>> getByCategory(int categoryId);
    Optional<List<Product>> getScarceProducts(int quantity);
    Optional<Product> getProduct(int productId);
    Product save(Product product);
    void delete(int productId);
}
