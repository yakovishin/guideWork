package ru.followGuide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ControllerUtils {
    static Map<String, String> getErrors(BindingResult bindingResult) {
        return bindingResult.getFieldErrors().stream().collect(Collectors.toMap(
                fieldError -> fieldError.getField() + "Error",
                FieldError::getDefaultMessage
        ));
    }
}
