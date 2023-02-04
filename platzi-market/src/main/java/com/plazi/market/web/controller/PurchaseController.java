package com.plazi.market.web.controller;

import com.plazi.market.domain.Product;
import com.plazi.market.domain.Purchase;
import com.plazi.market.domain.service.PurchaseService;
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
    public ResponseEntity<List<Purchase>> getAll(){
        return new ResponseEntity<List<Purchase>>(service.getAll(), HttpStatus.OK);
    }
    @GetMapping("/client/{clientId}")
    public ResponseEntity<List<Purchase>> getByClient(@PathVariable("clientId") String clientId){
        return service.getByClient(clientId)
                .map(purchases -> new ResponseEntity<List<Purchase>>(purchases,HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
    @PostMapping("/save")
    public ResponseEntity<Purchase> save(@RequestBody Purchase purchase){
        return new ResponseEntity<Purchase>(service.save(purchase),HttpStatus.CREATED);
    }
}
