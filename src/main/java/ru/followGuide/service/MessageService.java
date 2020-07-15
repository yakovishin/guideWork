package ru.followGuide.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.followGuide.domain.User;
import ru.followGuide.domain.dto.MessageDto;
import ru.followGuide.repositories.MessageRepository;


@Service
public class MessageService {


    @Autowired
    private MessageRepository messageRepository;

    public Page<MessageDto> messageList(Pageable pageable, String filter, User author) {
        if (filter != null && !filter.isEmpty()) {
           return messageRepository.findByTag(filter, pageable, author);
        } else {
            return messageRepository.findAll(pageable, author);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        return messageRepository.findByUser(pageable, author, currentUser);
    }
}
