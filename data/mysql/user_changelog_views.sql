CREATE TABLE `user_changelog_views`
(
    `user_id`       char(8)  NOT NULL,
    `last_seen_at`  datetime NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `user_changelog_views`
    ADD PRIMARY KEY (`user_id`);

ALTER TABLE `user_changelog_views`
    ADD CONSTRAINT `fk_changelog_views_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
