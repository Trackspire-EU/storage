-- Secret link that opens the read-only dashboard of a site without login. The link only works while
-- `sites.public` is set; switching it off disables the link without forgetting it.
CREATE TABLE `site_share_links`
(
    `site_id`       int      NOT NULL,
    -- 128 random bits as lowercase hex
    `token`         char(32) NOT NULL,
    -- bcrypt hash of the optional password, NULL while the link alone is enough
    `password_hash` varchar(255)      DEFAULT NULL,
    `created_by`    char(8)           DEFAULT NULL,
    `created_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`site_id`),
    UNIQUE KEY `uq_site_share_links_token` (`token`),
    CONSTRAINT `fk_site_share_links_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
