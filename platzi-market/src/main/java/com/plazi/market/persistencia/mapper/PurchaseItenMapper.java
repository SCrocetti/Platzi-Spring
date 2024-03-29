package com.plazi.market.persistencia.mapper;

import com.plazi.market.domain.PurchaseItem;
import com.plazi.market.persistencia.entity.ComprasProducto;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(componentModel = "spring",uses = ProductMapper.class)
public interface PurchaseItenMapper {
    @Mappings({
            @Mapping(source = "id.idProducto",target = "productId"),
            @Mapping(source = "cantidad",target = "quantity"),
            @Mapping(source = "estado",target = "active")
    })
    PurchaseItem toPurchaseItem(ComprasProducto producto);
    @InheritInverseConfiguration
    @Mappings({
            @Mapping(target = "id.idCompra",ignore = true),
            @Mapping(target = "compra",ignore = true),
            @Mapping(target = "producto",ignore = true)
    })
    ComprasProducto toComprasProducto(PurchaseItem item);
}
