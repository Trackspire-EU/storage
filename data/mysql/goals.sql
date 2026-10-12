CREATE TABLE `goals`
(
    `goal_id`          int          NOT NULL AUTO_INCREMENT,
    `site_id`          int          NOT NULL,
    `name`             varchar(100)          DEFAULT NULL,
    -- 'path', 'event', 'outbound', 'button_click', 'form_submit' or 'copy'
    `goal_type`        varchar(20)  NOT NULL,
    -- Path, event name or text pattern the goal matches; NULL counts every interaction of the type
    `pattern`          varchar(512)          DEFAULT NULL,
    -- List of {"key": ..., "value": ...}: URL parameters for path goals, event properties otherwise
    `property_filters` json         NOT NULL DEFAULT (json_array()),
    `created_by`       char(8)               DEFAULT NULL,
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`goal_id`),
    KEY `idx_goals_site` (`site_id`),
    CONSTRAINT `fk_goals_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
