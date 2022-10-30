package com.plazi.market.persistencia.mapper;

import com.plazi.market.domain.Category;
import com.plazi.market.persistencia.entity.Categoria;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    @Mappings({
            @Mapping(source="idCategoria",target="categoryId"),
            @Mapping(source="descripcion",target="category"),
            @Mapping(source="idCategoria",target="categoryId"),
            @Mapping(source="descripcion",target="category"),
            @Mapping(source="descripcion",target="category"),
            @Mapping(source="estado",target="active")
    })
    Category toCategory(Categoria categoria);

    // Solo hace falta definir el mapeo directo y el inverso se hace solo con esta anotación
    @InheritInverseConfiguration
    // le dice al mapeador que ignore el atributo en el proceso de mapeo
    @Mapping(target = "productos",ignore = true)
    Categoria toCategoria(Category category);
}
