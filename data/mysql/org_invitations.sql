CREATE TABLE `org_invitations`
(
    `id`              char(36)     NOT NULL,
    `organization_id` char(8)      NOT NULL,
    `email`           varchar(255) NOT NULL,
    `role`            varchar(20)  NOT NULL DEFAULT 'member',
    `token`           char(64)     NOT NULL,
    `status`          varchar(20)  NOT NULL DEFAULT 'pending',
    `invited_by`      char(8)      NOT NULL,
    `expires_at`      datetime     NOT NULL,
    `created_at`      datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `org_invitations`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `org_invitations_token_unique` (`token`),
    ADD KEY `org_invitations_org_idx` (`organization_id`),
    ADD KEY `org_invitations_email_idx` (`email`);

ALTER TABLE `org_invitations`
    ADD CONSTRAINT `fk_invitations_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_invitations_invited_by` FOREIGN KEY (`invited_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;