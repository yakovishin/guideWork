package ru.followGuide.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.followGuide.domain.Message;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
