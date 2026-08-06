CREATE TABLE `user_recovery_codes`
(
    `id`        int UNSIGNED AUTO_INCREMENT NOT NULL,
    `user_id`   char(8)                     NOT NULL,
    `code_hash` varchar(255)                NOT NULL,
    `used_at`   datetime                             DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_user_recovery_codes_user_id` (`user_id`),
    CONSTRAINT `fk_user_recovery_codes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
