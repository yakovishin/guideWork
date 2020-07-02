package ru.followGuide.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.followGuide.domain.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
