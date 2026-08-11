CREATE TABLE `changelog_entries`
(
    `id`                 char(8)                                            NOT NULL,
    `version`            varchar(20)                                        NOT NULL,
    `category`           enum ('feature','fix','improvement','breaking')    NOT NULL,
    `title`              varchar(255)                                       NOT NULL,
    `body`               text                                               NOT NULL,
    `source`             enum ('admin','github')                            NOT NULL DEFAULT 'admin',
    `github_release_id`  varchar(64)                                        DEFAULT NULL,
    `published_at`       datetime                                           NOT NULL,
    `created_at`         datetime                                           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`         datetime                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `changelog_entries`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `changelog_entries`
    ADD UNIQUE KEY `uniq_github_release_id` (`github_release_id`);

ALTER TABLE `changelog_entries`
    ADD INDEX `idx_published_at` (`published_at`);
