CREATE TABLE `user_totp`
(
    `user_id`    char(8)     NOT NULL,
    `secret`     varchar(64) NOT NULL,
    `enabled_at` datetime    NOT NULL,
    PRIMARY KEY (`user_id`),
    CONSTRAINT `fk_user_totp_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
