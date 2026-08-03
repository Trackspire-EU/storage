CREATE TABLE `subscriptions`
(
    `id`                     char(8)                                                              NOT NULL,
    `organization_id`        char(8)                                                              NOT NULL,
    `plan`                   enum ('free', 'pro')                                                 NOT NULL DEFAULT 'free',
    `status`                 enum ('active', 'trialing', 'past_due', 'canceled', 'incomplete')   NOT NULL DEFAULT 'active',
    `stripe_customer_id`     varchar(255)                                                                  DEFAULT NULL,
    `stripe_subscription_id` varchar(255)                                                                  DEFAULT NULL,
    `stripe_price_id`        varchar(255)                                                                  DEFAULT NULL,
    `trial_ends_at`          datetime                                                                      DEFAULT NULL,
    `current_period_start`   datetime                                                                      DEFAULT NULL,
    `current_period_end`     datetime                                                                      DEFAULT NULL,
    `canceled_at`            datetime                                                                      DEFAULT NULL,
    `created_at`             datetime                                                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`             datetime                                                                      DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_org_subscription` (`organization_id`),
    KEY `idx_stripe_customer` (`stripe_customer_id`),
    KEY `idx_stripe_subscription` (`stripe_subscription_id`),
    CONSTRAINT `fk_subscriptions_org` FOREIGN KEY (`organization_id`)
        REFERENCES `organizations` (`organization_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
