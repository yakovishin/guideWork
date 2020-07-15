package ru.followGuide.domain.util;

import ru.followGuide.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author){
        return author != null? author.getUsername() : "<none>";
    }
}
