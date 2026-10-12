CREATE TABLE `funnels`
(
    `funnel_id`  int          NOT NULL AUTO_INCREMENT,
    `site_id`    int          NOT NULL,
    `name`       varchar(100) NOT NULL,
    `goal_ids`   json         NOT NULL,
    `created_by` char(8)               DEFAULT NULL,
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`funnel_id`),
    KEY `idx_funnels_site` (`site_id`),
    CONSTRAINT `fk_funnels_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
