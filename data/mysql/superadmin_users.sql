CREATE TABLE `superadmin_users`
(
    `user_id`    char(8)  NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `superadmin_users`
    ADD PRIMARY KEY (`user_id`);

ALTER TABLE `superadmin_users`
    ADD CONSTRAINT `superadmin_users_user_id_fk`
        FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
