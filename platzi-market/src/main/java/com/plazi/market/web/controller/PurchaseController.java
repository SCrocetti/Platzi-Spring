package com.plazi.market.web.controller;

import com.plazi.market.domain.Product;
import com.plazi.market.domain.Purchase;
import com.plazi.market.domain.service.PurchaseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
// se le indica el path que le corresponde a este controller
@RequestMapping("/purchases")
public class PurchaseController {
    @Autowired
    private PurchaseService service;
    @GetMapping("/all")
    @ApiOperation("Get all supermarket purchases")
    @ApiResponse(code=200, message = "OK")
    public ResponseEntity<List<Purchase>> getAll(){
        return new ResponseEntity<List<Purchase>>(service.getAll(), HttpStatus.OK);
    }
    @GetMapping("/client/{clientId}")
    @ApiOperation("Searchs all the purchases of a client")
    @ApiResponses({
            @ApiResponse(code = 200, message = "OK"),
            @ApiResponse(code = 404, message = "No purchases found")
    })
    public ResponseEntity<List<Purchase>> getByClient(@ApiParam(value ="Id of the client",required = true,example = "4546221")@PathVariable("clientId") String clientId){
        return service.getByClient(clientId)
                .map(purchases -> new ResponseEntity<List<Purchase>>(purchases,HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
    @PostMapping("/save")
    public ResponseEntity<Purchase> save(@RequestBody Purchase purchase){
        return new ResponseEntity<Purchase>(service.save(purchase),HttpStatus.CREATED);
    }
}
