CREATE TABLE `announcements`
(
    `id`         varchar(36)                              NOT NULL,
    `title`      varchar(255)                             NOT NULL,
    `message`    text                                     NOT NULL,
    `type`       enum ('info','warning','error','success') NOT NULL DEFAULT 'info',
    `starts_at`  datetime                                 DEFAULT NULL,
    `ends_at`    datetime                                 DEFAULT NULL,
    `active`     tinyint(1)                               NOT NULL DEFAULT 1,
    `created_by` varchar(255)                             NOT NULL,
    `created_at` datetime                                 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime                                 DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `announcements`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `announcements`
    ADD INDEX `idx_active_dates` (`active`, `starts_at`, `ends_at`);
