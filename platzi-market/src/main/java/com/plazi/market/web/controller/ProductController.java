package com.plazi.market.web.controller;

import com.plazi.market.domain.Product;
import com.plazi.market.domain.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
// se le indica el path que le corresponde a este controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    public List<Product> getAll(){
        return productService.getAll();
    }
    public Optional<Product> getProduct(int productId){
        return productService.getProduct(productId);
    }
    public Optional<List<Product>> getByCategory(int categoryId){
        return productService.getByCategory(categoryId);
    }
    public Product save(Product product){
        return productService.save(product);
    }
    public boolean delete(int productId){
        return productService.delete(productId);
    }
}
