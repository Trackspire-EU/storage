-- Klicks für die Click-Heatmap, schon beim Schreiben zusammengefasst: eine Zeile je Seite, Gerätetyp, Element
-- und Rasterzelle innerhalb des Elements pro Stunde. Die Tabelle wächst so mit der Seitenstruktur, nicht mit
-- dem Traffic.
CREATE TABLE `heatmap_clicks`
(
    `site_id`     int              NOT NULL,
    -- Beginn der Stunde in UTC
    `occurred_on` datetime         NOT NULL,
    `pathname`    varchar(255)     NOT NULL,
    `device_type` varchar(16)      NOT NULL,
    -- CSS-Selector des geklickten Elements
    `selector`    varchar(255)     NOT NULL,
    -- Beschriftung bei Links und Buttons, damit das Element im Dashboard erkennbar ist
    `label`       varchar(100)              DEFAULT NULL,
    -- Position innerhalb des Elements als Rasterzelle (0 = links bzw. oben)
    `cell_x`      tinyint unsigned NOT NULL,
    `cell_y`      tinyint unsigned NOT NULL,
    `clicks`      int unsigned     NOT NULL DEFAULT 0,
    `rage_clicks` int unsigned     NOT NULL DEFAULT 0,
    PRIMARY KEY (`site_id`, `occurred_on`, `pathname`, `device_type`, `selector`, `cell_x`, `cell_y`),
    KEY `idx_heatmap_clicks_site_path` (`site_id`, `pathname`, `occurred_on`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `heatmap_clicks`
    ADD CONSTRAINT `fk_heatmap_clicks_site`
        FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE;
