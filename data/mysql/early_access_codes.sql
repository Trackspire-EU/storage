CREATE TABLE early_access_codes (
    id          char(8)      NOT NULL,
    code        varchar(16)  NOT NULL,
    max_uses    int          NOT NULL DEFAULT 1,
    uses_count  int          NOT NULL DEFAULT 0,
    email       varchar(255) NULL,
    note        varchar(255) NULL,
    expires_at  datetime     NULL,
    created_by  char(8)      NOT NULL,
    created_at  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY code_unique (code),
    KEY created_by (created_by)
);