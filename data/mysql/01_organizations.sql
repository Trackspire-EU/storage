CREATE TABLE `organizations`
(
    `organization_id` char(8)      NOT NULL,
    `name`            varchar(255) NOT NULL,
    `slug`            varchar(255) NOT NULL,
    `created_by`      char(8)      NOT NULL,
    `created_at`      datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `organizations`
    ADD PRIMARY KEY (`organization_id`),
    ADD UNIQUE KEY `organizations_slug_unique` (`slug`);

ALTER TABLE `organizations`
    ADD COLUMN `suspended_at` datetime DEFAULT NULL;
