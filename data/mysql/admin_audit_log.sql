CREATE TABLE `admin_audit_log`
(
    `id`          varchar(36)  NOT NULL,
    `actor_id`    char(8)      NOT NULL,
    `action_type` varchar(64)  NOT NULL,
    `entity_type` varchar(64)  NOT NULL,
    `entity_id`   varchar(255) NOT NULL,
    `metadata`    json         DEFAULT NULL,
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `admin_audit_log`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `admin_audit_log`
    ADD INDEX `idx_actor_id` (`actor_id`),
    ADD INDEX `idx_entity` (`entity_type`, `entity_id`),
    ADD INDEX `idx_created_at` (`created_at`);
