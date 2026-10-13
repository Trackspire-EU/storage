CREATE TABLE `active_sessions` (
                                   `session_id` varchar(255) NOT NULL,
                                   `site_id` int NOT NULL,
                                   `user_id` varchar(255) NOT NULL,
                                   `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `active_sessions`
    ADD PRIMARY KEY (`session_id`);

ALTER TABLE `active_sessions`
    ADD UNIQUE KEY `uq_user_site` (`user_id`, `site_id`);

ALTER TABLE `active_sessions`
    ADD CONSTRAINT `fk_active_sessions_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE;

-- The session cleanup job deletes by last activity only.
ALTER TABLE `active_sessions`
    ADD INDEX `idx_active_sessions_last_activity` (`last_activity`);

-- Where the visit came from, set by its first event and by every later one that arrives from another
-- site or a campaign. Events navigating within the site inherit it instead of naming the previous page.
ALTER TABLE `active_sessions`
    ADD COLUMN `channel` varchar(50) DEFAULT NULL,
    ADD COLUMN `referrer` varchar(2048) DEFAULT NULL;
