package ru.followGuide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.followGuide.domain.Message;
import ru.followGuide.domain.User;
import ru.followGuide.repositories.MessageRepository;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Model model){
            return "greeting";
    }

    @GetMapping("/index")
    public String index(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty() ){
            messages = messageRepository.findByTag(filter);
        }else {
            messages = messageRepository.findAll();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "index";
    }

    @PostMapping("/index")
    public String add(@AuthenticationPrincipal User user,
                      @Valid Message message,
                      BindingResult bindingResult,
                      @RequestParam MultipartFile file,
                      Model model) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorMap);
            model.addAttribute("message", message);
        }else {

            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFileMessage = uuidFile.concat(".").concat(file.getOriginalFilename());
                file.transferTo(new File(uploadPath + "/" + resultFileMessage));
                message.setFilename(resultFileMessage);
            }
            model.addAttribute("message", null);
            messageRepository.save(message);
        }
        Iterable<Message> messages = messageRepository.findAll();
        model.addAttribute("messages", messages);

        return "index";
    }


}
