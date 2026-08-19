CREATE TABLE `api_tokens`
(
    `token_id`     char(8)      NOT NULL,
    `user_id`      char(8)      NOT NULL,
    `name`         varchar(100) NOT NULL,
    `token_prefix` varchar(14)  NOT NULL,
    `token_hash`   char(64)     NOT NULL,
    `last_used_at` datetime              DEFAULT NULL,
    `expires_at`   datetime              DEFAULT NULL,
    `revoked_at`   datetime              DEFAULT NULL,
    `created_at`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`token_id`),
    UNIQUE KEY `uq_api_tokens_hash` (`token_hash`),
    KEY `idx_api_tokens_user` (`user_id`),
    CONSTRAINT `fk_api_tokens_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
