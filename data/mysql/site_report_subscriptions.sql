CREATE TABLE `site_report_subscriptions`
(
    `id`           INT AUTO_INCREMENT                  NOT NULL,
    `site_id`      INT                                 NOT NULL,
    `user_id`      CHAR(8)                             NOT NULL,
    `frequency`    ENUM ('weekly', 'monthly')          NOT NULL DEFAULT 'weekly',
    `enabled`      TINYINT(1)                          NOT NULL DEFAULT 1,
    `last_sent_at` DATETIME                                     DEFAULT NULL,
    `created_at`   DATETIME                            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_site_user` (`site_id`, `user_id`),
    CONSTRAINT `fk_srs_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_srs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
