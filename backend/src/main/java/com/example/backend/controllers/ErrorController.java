package com.example.backend.controllers;

import jakarta.validation.ConstraintViolationException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;

import java.util.stream.Collectors;

@ControllerAdvice
public class ErrorController
        extends ResponseEntityExceptionHandler {

    @ExceptionHandler(value
            = {ConstraintViolationException.class})
    protected ResponseEntity<Object> handleConstraintViolation(
            ConstraintViolationException ex, WebRequest request) {
        return handleExceptionInternal(ex, ex.getConstraintViolations().stream().collect(Collectors.toMap(
                        ConstraintViolation::getPropertyPath, ConstraintViolation::getMessage)),
                new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
    }

    @ExceptionHandler(value
            = {DataIntegrityViolationException.class})
    protected ResponseEntity<Object> handleConstraintViolation(
            DataIntegrityViolationException ex, WebRequest request) {
        return handleExceptionInternal(ex, null, new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
    }

    @ExceptionHandler(value
            = {IllegalArgumentException.class, BadCredentialsException.class})
    protected ResponseEntity<Object> handleConstraintViolation(
            RuntimeException ex, WebRequest request) {
        return handleExceptionInternal(ex, null, new HttpHeaders(), HttpStatus.NOT_FOUND, request);
    }

    @ExceptionHandler(value = {SimpleCodeSetter.class})
    protected ResponseEntity<Object> simpleCodeSetter (
            SimpleCodeSetter ex, WebRequest request) {
        HttpStatus httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        if (ex instanceof NotFoundException) {
            httpStatus = HttpStatus.NOT_FOUND;
        } else if (ex instanceof BadRequest) {
            httpStatus = HttpStatus.BAD_REQUEST;
        }
        return handleExceptionInternal(ex, null,
                new HttpHeaders(), httpStatus, request);
    }

    private abstract static class SimpleCodeSetter extends Exception {};
    public static class NotFoundException extends SimpleCodeSetter { }
    public static class BadRequest extends SimpleCodeSetter { }

}
