CREATE TABLE `admin_user_notes`
(
    `id`         varchar(36)  NOT NULL,
    `user_id`    char(8)      NOT NULL,
    `note`       text         NOT NULL,
    `created_by` varchar(255) NOT NULL,
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `admin_user_notes`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `admin_user_notes`
    ADD CONSTRAINT `admin_user_notes_user_id_fk`
        FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
