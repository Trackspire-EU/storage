CREATE TABLE `oauth_accounts`
(
    `oauth_id`         int UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id`          char(8)      NOT NULL,
    `provider`         enum('google','github') NOT NULL,
    `provider_user_id` varchar(255) NOT NULL,
    `access_token`     text         DEFAULT NULL,
    `refresh_token`    text         DEFAULT NULL,
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`oauth_id`),
    UNIQUE KEY `uq_provider_user` (`provider`, `provider_user_id`),
    CONSTRAINT `fk_oauth_accounts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;