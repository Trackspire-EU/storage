CREATE TABLE `job_runs`
(
    `id`          bigint unsigned                    NOT NULL AUTO_INCREMENT,
    `job_name`    varchar(100)                       NOT NULL,
    `started_at`  datetime                           NOT NULL,
    `finished_at` datetime                                    DEFAULT NULL,
    `status`      enum ('running','ok','failed')     NOT NULL DEFAULT 'running',
    `error`       varchar(500)                                DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `job_runs`
    ADD INDEX `idx_job_runs_name_started` (`job_name`, `started_at`);
