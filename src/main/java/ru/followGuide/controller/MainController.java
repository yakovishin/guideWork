package ru.followGuide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.followGuide.domain.Message;
import ru.followGuide.domain.User;
import ru.followGuide.repositories.MessageRepository;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Model model){
            return "greeting";
    }

    @GetMapping("/index")
    public String index(@RequestParam(required = false) String filter, Model model){
        Iterable<Message> messages = messageRepository.findAll();
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
                      @RequestParam String text,
                      @RequestParam String tag,
                      Model model) {
        Message message = new Message(text, tag, user);
        if (text != null && !text.isEmpty() && tag != null && !tag.isEmpty()){
            messageRepository.save(message);
        }
        Iterable<Message> messages = messageRepository.findAll();
        model.addAttribute("messages", messages);
        return "index";
    }
}
