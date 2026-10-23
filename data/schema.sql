-- Precedent: core relational schema (PREC-15)
-- PostgreSQL. Vector column for embeddings is added in PREC-19.

CREATE TABLE nation (
    nation_id      SERIAL PRIMARY KEY,
    name           TEXT NOT NULL UNIQUE,
    region         TEXT NOT NULL
);

CREATE TABLE issue_category (
    issue_id       SERIAL PRIMARY KEY,
    code           TEXT NOT NULL UNIQUE,      -- e.g. WATER, WILDLIFE
    description    TEXT NOT NULL
);

CREATE TABLE referral (
    referral_id    SERIAL PRIMARY KEY,
    permit_type    TEXT NOT NULL,             -- e.g. Notice of Work, Amendment
    project_name   TEXT NOT NULL,
    region         TEXT NOT NULL,
    sent_date      DATE NOT NULL
);

-- Which Nations a referral went to
CREATE TABLE referral_nation (
    referral_id    INT REFERENCES referral(referral_id),
    nation_id      INT REFERENCES nation(nation_id),
    PRIMARY KEY (referral_id, nation_id)
);

CREATE TABLE response (
    response_id    SERIAL PRIMARY KEY,
    referral_id    INT NOT NULL REFERENCES referral(referral_id),
    nation_id      INT NOT NULL REFERENCES nation(nation_id),
    received_date  DATE,
    response_type  TEXT NOT NULL CHECK (response_type IN
                     ('NO_CONCERNS','CONCERNS_RAISED','REQUEST_MEETING','NO_RESPONSE')),
    body           TEXT
);

-- A response can raise several issues
CREATE TABLE response_issue (
    response_id    INT REFERENCES response(response_id),
    issue_id       INT REFERENCES issue_category(issue_id),
    PRIMARY KEY (response_id, issue_id)
);

CREATE INDEX idx_response_nation ON response(nation_id);
CREATE INDEX idx_response_referral ON response(referral_id);
