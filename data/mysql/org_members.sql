CREATE TABLE `org_members`
(
    `id`              int         NOT NULL,
    `organization_id` char(8)     NOT NULL,
    `user_id`         char(8)     NOT NULL,
    `role`            varchar(20) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `org_members`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `org_members`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `org_members`
    ADD CONSTRAINT `fk_org_members_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_org_members_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
