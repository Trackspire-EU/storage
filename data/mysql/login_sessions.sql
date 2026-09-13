CREATE TABLE `login_sessions`
(
    `session_id`     char(8)      NOT NULL,
    `user_id`        char(8)      NOT NULL,
    `ip_address`     varchar(45)  NOT NULL,
    `country_code`   char(2)               DEFAULT NULL,
    `city`           varchar(255)          DEFAULT NULL,
    `user_agent`     text,
    `created_at`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_active_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `revoked_at`     datetime              DEFAULT NULL,
    PRIMARY KEY (`session_id`),
    KEY `idx_login_sessions_user_id` (`user_id`),
    CONSTRAINT `fk_login_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
