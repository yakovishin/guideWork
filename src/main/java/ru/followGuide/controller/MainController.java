package ru.followGuide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.followGuide.domain.Message;
import ru.followGuide.repositories.MessageRepository;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model){
            return "greeting";
    }

    @GetMapping("/index")
    public String index(Map<String, Object> model){
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "index";
    }

    @PostMapping("/index")
    public String add(@RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag);
        if (text != null && !text.isEmpty() && tag != null && !tag.isEmpty()){
            messageRepository.save(message);
        }
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "index";
    }

    @PostMapping("filter")
    public String filter (@RequestParam String filter, Map<String, Object> model) {
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty() ){
            messages = messageRepository.findByTag(filter);
        }else {
            messages = messageRepository.findAll();
        }
        model.put("messages", messages);
        return "index";
    }

}
