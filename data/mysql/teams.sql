-- Teams group members of an organization and grant them access to selected sites. They only matter for members
-- with `org_members.has_restricted_site_access` set: those see the sites of their teams and nothing else.
CREATE TABLE `teams`
(
    `team_id`         char(8)      NOT NULL,
    `organization_id` char(8)      NOT NULL,
    `name`            varchar(100) NOT NULL,
    `created_at`      datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`team_id`),
    UNIQUE KEY `uq_teams_org_name` (`organization_id`, `name`),
    CONSTRAINT `fk_teams_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `team_members`
(
    `team_id` char(8) NOT NULL,
    `user_id` char(8) NOT NULL,
    PRIMARY KEY (`team_id`, `user_id`),
    KEY `idx_team_members_user` (`user_id`),
    CONSTRAINT `fk_team_members_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_team_members_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `team_site_access`
(
    `team_id` char(8) NOT NULL,
    `site_id` int     NOT NULL,
    PRIMARY KEY (`team_id`, `site_id`),
    KEY `idx_team_site_access_site` (`site_id`),
    CONSTRAINT `fk_team_site_access_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_team_site_access_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
