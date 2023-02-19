package com.plazi.market.web.controller;


import com.plazi.market.domain.dto.AutenticationRequest;
import com.plazi.market.domain.dto.AutenticationResponse;
import com.plazi.market.domain.service.PlatziUserDetailsService;
import com.plazi.market.web.security.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
// se le indica el path que le corresponde a este controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthenticationManager autenticationManager;
    @Autowired
    private PlatziUserDetailsService service;
    @Autowired
    private JWTUtil util;
    @PostMapping("/authenticate")
    public ResponseEntity<AutenticationResponse> createToken(@RequestBody AutenticationRequest request){
        try{
            autenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(),request.getPassword()));
            UserDetails userDetails=service.loadUserByUsername(request.getUsername());
            String jwt=util.generateToken(userDetails);
            return new ResponseEntity<>(new AutenticationResponse(jwt),HttpStatus.OK);
        }
        catch (BadCredentialsException exc){
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }
    }
}
