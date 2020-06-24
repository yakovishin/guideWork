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
public class GreetingController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/greeting")
    public String greeting(@RequestParam( name = "name", required = false, defaultValue = "World") String name,
                           Map<String, Object> model){
            model.put("name", name);
            return "greeting";
    }

    @GetMapping
    public String index(Map<String, Object> model){
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "index";
    }

    @PostMapping
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
