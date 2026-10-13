-- What the members of an organization changed about it: sites, members, teams and sharing. Shown to its
-- admins. Entries older than a year are removed by the retention job.
CREATE TABLE `org_audit_log`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT,
    `organization_id` char(8)         NOT NULL,
    -- NULL once the account that acted was deleted, the entry itself stays
    `actor_id`        char(8)                  DEFAULT NULL,
    -- Name of the action, e.g. 'site.deleted' or 'member.role_changed'
    `action`          varchar(50)     NOT NULL,
    -- What the action applied to, in words: a domain, an e-mail address or the name of a team
    `subject`         varchar(255)             DEFAULT NULL,
    `created_at`      datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_org_audit_log_org` (`organization_id`, `id`),
    KEY `idx_org_audit_log_created` (`created_at`),
    CONSTRAINT `fk_org_audit_log_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_org_audit_log_actor` FOREIGN KEY (`actor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
