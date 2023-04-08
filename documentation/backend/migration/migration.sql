DROP DATABASE IF EXISTS shumishumi;

CREATE DATABASE shumishumi;

USE shumishumi;

CREATE TABLE chatrooms (
    chatroom_id VARCHAR(255) NOT NULL,
    extend_info VARCHAR(255),
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (chatroom_id)
);

CREATE TABLE capabilities (
    capability_id VARCHAR(255) NOT NULL,
    capability_name VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (capability_id)
);

CREATE TABLE item_categories (
    category_id VARCHAR(255) NOT NULL,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (category_id)
);

CREATE TABLE hobbies (
    hobby_id VARCHAR(255) NOT NULL,
    hobby_name VARCHAR(255) UNIQUE NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (hobby_id)
);

CREATE TABLE interest_level (
    interest_level_id VARCHAR(255) NOT NULL,
    level_name VARCHAR(255) UNIQUE NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (interest_level_id)
);

CREATE TABLE user_roles (
    role_id VARCHAR(255) NOT NULL,
    role_name VARCHAR(255) UNIQUE NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (role_id)
);

CREATE TABLE payments (
    payment_id VARCHAR(255) NOT NULL,
    payment_type VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (payment_id)
);

CREATE TABLE users (
    user_id VARCHAR(255) NOT NULL,
    role_id VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT false,
    is_deleted BOOLEAN DEFAULT false,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (user_id),
    FOREIGN KEY (role_id) REFERENCES user_roles (role_id)
);

CREATE TABLE items (
    item_id VARCHAR(255) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_price INT NOT NULL,
    item_images VARCHAR(1024) NOT NULL,
    item_description LONGTEXT NOT NULL,
    item_quantity INT NOT NULL,
    merchant_id VARCHAR(255) NOT NULL,
    category_id VARCHAR(255) NOT NULL,
    hobby_id VARCHAR(255) NOT NULL,
    merchant_level_id VARCHAR(255) NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT false,
    is_approved BOOLEAN NOT NULL DEFAULT false,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (item_id),
    FOREIGN KEY (merchant_id) REFERENCES users (user_id),
    FOREIGN KEY (category_id) REFERENCES item_categories (category_id),
    FOREIGN KEY (hobby_id) REFERENCES hobbies (hobby_id),
    FOREIGN KEY (merchant_level_id) REFERENCES interest_level (interest_level_id)
);

CREATE TABLE history_items (
    history_item_id VARCHAR(255) NOT NULL,
    item_id VARCHAR(255) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_price INT NOT NULL,
    item_images VARCHAR(1024) NOT NULL,
    item_description LONGTEXT NOT NULL,
    merchant_id VARCHAR(255) NOT NULL,
    category_id VARCHAR(255) NOT NULL,
    hobby_id VARCHAR(255) NOT NULL,
    merchant_level_id VARCHAR(255) NOT NULL,
    user_level_id VARCHAR(255),
    need_review BOOLEAN NOT NULL DEFAULT false,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (history_item_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id),
    FOREIGN KEY (merchant_id) REFERENCES users (user_id),
    FOREIGN KEY (category_id) REFERENCES item_categories (category_id),
    FOREIGN KEY (hobby_id) REFERENCES hobbies (hobby_id),
    FOREIGN KEY (merchant_level_id) REFERENCES interest_level (interest_level_id),
    FOREIGN KEY (user_level_id) REFERENCES interest_level (interest_level_id)
);

CREATE TABLE sessions (
    session_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    session_dt TIMESTAMP NOT NULL,
    is_active BOOLEAN DEFAULT true,
    is_remembered BOOLEAN DEFAULT false,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE carts (
    cart_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (cart_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE cart_details (
    cart_detail_id VARCHAR(255) NOT NULL,
    item_id VARCHAR(255) NOT NULL,
    cart_id VARCHAR(255) NOT NULL,
    quantity INT DEFAULT 1,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (cart_detail_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id),
    FOREIGN KEY (cart_id) REFERENCES carts (cart_id)
);

CREATE TABLE transaction (
    transaction_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    payment_type VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (payment_type) REFERENCES payments (payment_id)
);

CREATE TABLE transaction_details (
    transaction_detail_id VARCHAR(255) NOT NULL,
    transaction_id VARCHAR(255) NOT NULL,
    history_item_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (history_item_id) REFERENCES history_items (history_item_id),
    FOREIGN KEY (transaction_id) REFERENCES transaction (transaction_id)
);

CREATE TABLE wishlists (
    user_id VARCHAR(255) NOT NULL,
    item_id VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id)
);

CREATE TABLE reviews (
    review_id VARCHAR(255) NOT NULL,
    star INT NOT NULL,
    item_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    interest_level VARCHAR(255),
    description LONGTEXT,
    review_image LONGBLOB,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (review_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id),
    FOREIGN KEY (interest_level) REFERENCES interest_level (interest_level_id)
);

CREATE TABLE chats (
    chat_id VARCHAR(255) NOT NULL,
    chatroom_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    message VARCHAR(255) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    is_edited BOOLEAN DEFAULT false,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (chat_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms (chatroom_id)
);

CREATE TABLE user_capabilities (
    user_id VARCHAR(255) NOT NULL,
    capability_id VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (user_id, capability_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (capability_id) REFERENCES capabilities (capability_id)
);

CREATE TABLE posts (
    post_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE comments (
    comment_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    reply_comment_id VARCHAR(255),
    reply_post_id VARCHAR(255),
    content LONGTEXT NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (reply_post_id) REFERENCES posts (post_id),
    FOREIGN KEY (reply_comment_id) REFERENCES comments (comment_id)
);

CREATE TABLE post_upvotes (
    user_id VARCHAR(255) NOT NULL,
    post_id VARCHAR(255) NOT NULL,
    value INT DEFAULT 0,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

CREATE TABLE comment_upvotes (
    user_id VARCHAR(255) NOT NULL,
    comment_id VARCHAR(255) NOT NULL,
    value INT DEFAULT 0,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (comment_id) REFERENCES comments (comment_id)
);

CREATE TABLE post_reports (
    report_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    post_id VARCHAR(255) NOT NULL,
    report_desc VARCHAR(255),
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (report_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

CREATE TABLE comment_reports (
    report_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    comment_id VARCHAR(255) NOT NULL,
    report_desc VARCHAR(255),
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (report_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (comment_id) REFERENCES comments (comment_id)
);

CREATE TABLE clients (
    client_id VARCHAR(255) NOT NULL,
    client_name VARCHAR(255) NOT NULL,
    client_secret VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (client_id)
);

CREATE TABLE otp_types (
    type_id VARCHAR(255) NOT NULL,
    otp_type VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (type_id)
);

CREATE TABLE otps (
    otp_id VARCHAR(255) NOT NULL,
    otp VARCHAR(255) NOT NULL,
    otp_dt TIMESTAMP NOT NULL,
    type_id VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (otp_id),
    FOREIGN KEY (type_id) REFERENCES otp_types (type_id)
);

CREATE TABLE contents (
    content_name VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (content_name)
);

CREATE TABLE crowds (
    crowd_id VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY(crowd_id)
);

CREATE TABLE crowd_rules (
    rule_id VARCHAR(255) NOT NULL,
    crowd_id VARCHAR(255) NOT NULL,
    rule_type VARCHAR(255) NOT NULL,
    rule_value VARCHAR(4096) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY(rule_id),
    FOREIGN KEY (crowd_id) REFERENCES crowds(crowd_id)
);

CREATE TABLE user_crowds (
    crowd_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY(crowd_id, user_id),
    FOREIGN KEY(crowd_id) REFERENCES crowds(crowd_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE item_crowds (
    crowd_id VARCHAR(255) NOT NULL,
    item_id VARCHAR(255) NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY(crowd_id, item_id),
    FOREIGN KEY(crowd_id) REFERENCES crowds(crowd_id),
    FOREIGN KEY(item_id) REFERENCES items(item_id)
);

CREATE TABLE images (
    image_id VARCHAR(255) NOT NULL,
    image_name VARCHAR(255) NOT NULL,
    image_ext VARCHAR(255) NOT NULL,
    image LONGBLOB NOT NULL,
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY(image_id)
);

INSERT INTO
    user_roles (role_id, role_name)
VALUES
    ("8e6993f7-356f-4a77-9cbb-bffbde74f5fc", "USER"),
    (
        "5e462578-658c-4e40-8f06-4125f8aa413e",
        "MERCHANT"
    ),
    ("ccde9d0c-eb08-482b-b2ee-76fcf2f47ef7", "ADMIN");

INSERT INTO
    clients (client_id, client_name, client_secret)
VALUES
    (
        "6b8d6ac7-dc63-41ed-bb99-fba0ebcdc543",
        "postman",
        "Ev^gBi6URjKfL&z3&mjVV4f9$yHsvTtZ"
    ),
    (
        "dbf0201e-23a0-446b-8db3-40b1b6ed7c1f",
        "manuel",
        "dycvervbrngjwhryugwduo"
    );

INSERT INTO
    otp_types (type_id, otp_type)
VALUES
    (
        "a2c82a3b-620e-442f-b3a5-9e55f068e68b",
        "USER_ACTIVATION"
    ),
    (
        "3af59f24-f0e0-4a28-8184-816a3d99820e",
        "FORGOT_PASSWORD"
    );

INSERT INTO
    interest_level (interest_level_id, level_name)
VALUES
    (
        "da61603a-3252-4f7d-bf07-97ef5ef168cc",
        "BEGINNER"
    ),
    (
        "ebb5d871-af7d-4b59-807c-bef5f8962e3c",
        "INTERMEDIATE"
    ),
    (
        "5684822d-ab2d-4ed6-a124-c3754035d80c",
        "ENTHUSIAST"
    );

INSERT INTO
    contents (content_name, content)
VALUES
    (
        "OTP_EMAIL",
        '<body style="background-color:#d8dee9"><table align="center" border="0" cellpadding="0" cellspacing="0" width="800" bgcolor="white" style="border:2px solid #000"><tbody><tr><td align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" class="col-550" width="800"><tbody><tr><td align="center" style="background-color:#2e3440;height:50px"><a href="#" style="text-decoration:none"><p style="color:#fff;font-weight:700;font-size:30px">Shumishumi Verification</p></a></td></tr></tbody></table></td></tr><tr style="height:300px"><td align="center" style="border:none;border-bottom:2px solid #eceffb;padding-right:5px;padding-left:5px"><p style="font-weight:bolder;font-size:30px;letter-spacing:.025em;color:#000">Hello %s!</p><p style="font-weight:semibold;font-size:18px;letter-spacing:.025em;color:#000">Please use the verification code below on the Shumishumi website:</p><table align="center" border="0" cellpadding="0" cellspacing="0" width="200" bgcolor="white"><tbody><tr><td align="center" style="background-color:#88c0d0;height:50px"><p style="font-weight:bolder;font-size:25px;letter-spacing:.025em;color:#000">%s</p></td></tr></tbody></table><p style="font-weight:semibold;font-size:15px;letter-spacing:.025em;color:#000">If you didn\'t request this, you can ignore this email or let us know.<br>Thanks!<br>Shumishumi Teams</p></td></tr></tbody></table></body>'
    );
