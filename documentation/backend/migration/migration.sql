CREATE DATABASE shumishumi
USE shumishumi

CREATE TABLE chatrooms {
    id VARCHAR(255) NOT NULL,
    extend_info VARCHAR(255),
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}

CREATE TABLE capabilities {
    id VARCHAR(255) NOT NULL,
    capability_name VARCHAR(255) NOT NULL,
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}

CREATE TABLE item_categories {
    id VARCHAR(255) NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}

CREATE TABLE interest_level {
    id VARCHAR(255) NOT NULL,
    level_name VARCHAR(255) NOT NULL,
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}

CREATE TABLE user_roles {
    id VARCHAR(255) NOT NULL,
    role_name VARCHAR(255) NOT NULL,
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}

CREATE TABLE activities {
    id VARCHAR(255) NOT NULL,
    activity_name VARCHAR(255) NOT NULL,
    gmt_create DATE DEFAULT NOW(),
    gmt_modified DATE DEFAULT NOW()
    PRIMARY KEY(id)
}