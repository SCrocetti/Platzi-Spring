package com.plazi.market.persistencia;

import com.plazi.market.domain.Product;
import com.plazi.market.domain.repository.ProductRepository;
import com.plazi.market.persistencia.crud.ProductoCrudRepository;
import com.plazi.market.persistencia.entity.Producto;
import com.plazi.market.persistencia.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public class ProductoRepository implements ProductRepository {
    // Ojo: para usar autowidred solo podes hacerlo con componentes de Spring
    @Autowired
    private ProductoCrudRepository productoCrudRepository;

    @Autowired
    private ProductMapper mapper;
    @Override
    public List<Product> getAll(){
        List<Producto> productos=(List<Producto>) productoCrudRepository.findAll();
        return mapper.toProducts(productos);
    }

    @Override
    public Optional<List<Product>> getByCategory(int categoryId) {
        List<Producto>productos =productoCrudRepository.findByIdCategoriaOrderByNombreDesc(categoryId);
        return Optional.of(mapper.toProducts(productos));
    }

    @Override
    public Optional<List<Product>> getScarceProducts(int quantity) {
        Optional<List<Producto>> productos= productoCrudRepository.findByCantidadStockLessThanAndEstado(quantity,true);
        // alto metodo fachero de los optionals.
        return productos.map(prods->mapper.toProducts(prods));
    }

    @Override
    public Optional<Product> getProduct(int productId) {
        return productoCrudRepository.findById(productId).map(producto -> mapper.toProduct(producto));
    }

    @Override
    public Product save(Product product) {
        return mapper.toProduct(productoCrudRepository.save(mapper.toProducto(product)));
    }

    @Override
    public  void  delete(int idProducto){productoCrudRepository.deleteById(idProducto);}
}
