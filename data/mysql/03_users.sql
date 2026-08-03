CREATE TABLE `users`
(
    `user_id`     char(8)          NOT NULL,
    `email`       varchar(100) NOT NULL,
    `password`    varchar(255)          DEFAULT NULL,
    `is_active`   tinyint(1)   NOT NULL DEFAULT '1',
    `last_active` datetime              DEFAULT NULL,
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `users`
    ADD PRIMARY KEY (`user_id`);

INSERT INTO `users` (`user_id`, `email`, `password`)
VALUES ('12345678','luka@luka-lta.dev', '$2y$10$/gORHZGQQuL/9S9oN9fbjem.oJMC4fTplBJR.9PjQdQ1dpTbc0fIS');