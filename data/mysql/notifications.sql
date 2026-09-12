CREATE TABLE `notifications`
(
    `id`         int          NOT NULL,
    `user_id`    char(8)      NOT NULL,
    `type`       varchar(64)  NOT NULL,
    `title`      varchar(255) NOT NULL,
    `body`       varchar(500)          DEFAULT NULL,
    `link`       varchar(255)          DEFAULT NULL,
    `read_at`    datetime              DEFAULT NULL,
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `notifications`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `notifications`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `notifications`
    ADD INDEX `idx_notifications_user_read` (`user_id`, `read_at`),
    ADD INDEX `idx_notifications_user_created` (`user_id`, `created_at`);

ALTER TABLE `notifications`
    ADD CONSTRAINT `fk_notifications_user`
        FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
