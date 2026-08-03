CREATE TABLE `bot_events`
(
    `id`              bigint unsigned                                                       NOT NULL AUTO_INCREMENT,
    `site_id`         int                                                                   NOT NULL,
    `occurred_on`     datetime                                                              NOT NULL,
    `user_agent`      varchar(512)                                                                   DEFAULT NULL,
    `hostname`        varchar(253)                                                                   DEFAULT NULL,
    `pathname`        varchar(2048)                                                                  DEFAULT NULL,
    `browser`         varchar(100)                                                                   DEFAULT NULL,
    `browser_version` varchar(50)                                                                    DEFAULT NULL,
    `os`              varchar(100)                                                                   DEFAULT NULL,
    `device_type`     varchar(50)                                                                    DEFAULT NULL,
    `matched_pattern`  varchar(100)                                                                   DEFAULT NULL,
    `referrer`         varchar(2048)                                                                  DEFAULT NULL,
    `category`         varchar(20)                                                                    DEFAULT NULL,
    `detection_method` varchar(20)                                                                    DEFAULT NULL,
    `country`          varchar(2)                                                                     DEFAULT NULL,
    `region`           varchar(100)                                                                   DEFAULT NULL,
    `city`             varchar(100)                                                                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_bot_events_site_occurred` (`site_id`, `occurred_on`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
