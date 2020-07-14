delete from user_role;
delete from usr;

insert into usr(id, active, password, username) values (1, true, '$2a$08$TxWKZRv9KoWkvMfEIGzyZOcdXcUc0FM0YM47dZyCkPWe3NervEJ0i', 'admin'),
 (2, true, '$2a$08$TxWKZRv9KoWkvMfEIGzyZOcdXcUc0FM0YM47dZyCkPWe3NervEJ0i', 'root');

 insert into user_role (user_id, roles) values
 (1, 'ADMIN'), (1, 'USER'),
  (2, 'USER');