package com.plazi.market.persistencia.mapper;

import com.plazi.market.domain.Product;
import com.plazi.market.persistencia.entity.Producto;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

import java.util.List;

// el uses le dice al mapper que use el category mapper para mapear categorias
@Mapper(componentModel = "spring",uses={CategoryMapper.class})
public interface ProductMapper {
    @Mappings({
            @Mapping(source="idProducto",target="productId"),
            @Mapping(source="nombre",target="name"),
            @Mapping(source="idCategoria",target="catogoryId"),
            @Mapping(source="precioVenta",target="price"),
            @Mapping(source="cantidadStock",target="stock"),
            @Mapping(source="estado",target="active"),
            @Mapping(source="categoria",target="category")
    })
    Product toProduct(Producto producto);

    // Solo es necesario definir el caso unitario y el grupal se define solo.
    List<Product> toProducts(List<Producto> productos);

    @InheritInverseConfiguration
    @Mapping(target = "codigoBarras",ignore = true)
    Producto toProducto(Product product);

}
