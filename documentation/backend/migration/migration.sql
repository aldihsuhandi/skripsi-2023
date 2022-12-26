CREATE DATABASE shumishumi;

USE shumishumi;

CREATE TABLE
    chatrooms (
        chatroom_id VARCHAR(255) NOT NULL,
        extend_info VARCHAR(255),
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (chatroom_id)
    );

CREATE TABLE
    capabilities (
        capability_id VARCHAR(255) NOT NULL,
        capability_name VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (capability_id)
    );

CREATE TABLE
    item_categories (
        category_id VARCHAR(255) NOT NULL,
        category_name VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (category_id)
    );

CREATE TABLE
    interest_level (
        interest_level_id VARCHAR(255) NOT NULL,
        level_name VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (interest_level_id)
    );

CREATE TABLE
    user_roles (
        role_id VARCHAR(255) NOT NULL,
        role_name VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (role_id)
    );

CREATE TABLE
    activities (
        activity_id VARCHAR(255) NOT NULL,
        activity_name VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (activity_id)
    );

CREATE TABLE
    payments (
        payment_id VARCHAR(255) NOT NULL,
        payment_type VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (payment_id)
    );

CREATE TABLE
    users (
        user_id VARCHAR(255) NOT NULL,
        role_id VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        phone_number VARCHAR(255) UNIQUE NOT NULL,
        username VARCHAR(255) NOT NULL,
        profile_picture LONGBLOB NOT NULL,
        password VARCHAR(255) NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_id),
        FOREIGN KEY (role_id) REFERENCES user_roles (role_id)
    );

CREATE TABLE
    items (
        item_id VARCHAR(255) NOT NULL,
        item_name VARCHAR(255) NOT NULL,
        item_price INT NOT NULL,
        item_description LONGTEXT NOT NULL,
        item_quantity INT NOT NULL,
        merchant_id VARCHAR(255) NOT NULL,
        category_id VARCHAR(255) NOT NULL,
        merchant_level_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (item_id),
        FOREIGN KEY (merchant_id) REFERENCES users (user_id),
        FOREIGN KEY (category_id) REFERENCES item_categories (category_id),
        FOREIGN KEY (merchant_level_id) REFERENCES interest_level (interest_level_id)
    );

CREATE TABLE
    item_images (
        item_image_id VARCHAR(255) NOT NULL,
        item_image LONGBLOB NOT NULL,
        item_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (item_image_id),
        FOREIGN KEY (item_id) REFERENCES items (item_id)
    );

CREATE TABLE
    sessions (
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

CREATE TABLE
    carts (
        cart_id VARCHAR(255) NOT NULL,
        user_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (cart_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id)
    );

CREATE TABLE
    cart_details (
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

CREATE TABLE
    transaction (
        transaction_id VARCHAR(255) NOT NULL,
        user_id VARCHAR(255) NOT NULL,
        payment_type VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (transaction_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (payment_type) REFERENCES payments (payment_id)
    );

CREATE TABLE
    transaction_details (
        transaction_detail_id VARCHAR(255) NOT NULL,
        transaction_id VARCHAR(255) NOT NULL,
        item_id VARCHAR(255) NOT NULL,
        quantity INT NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (transaction_id),
        FOREIGN KEY (item_id) REFERENCES items (item_id),
        FOREIGN KEY (transaction_id) REFERENCES transaction (transaction_id)
    );

CREATE TABLE
    user_activities (
        user_activity_id VARCHAR(255) NOT NULL,
        user_id VARCHAR(255) NOT NULL,
        item_id VARCHAR(255) NOT NULL,
        activity_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_activity_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (item_id) REFERENCES items (item_id),
        FOREIGN KEY (activity_id) REFERENCES activities (activity_id)
    );

CREATE TABLE
    wishlists (
        user_id VARCHAR(255) NOT NULL,
        item_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_id, item_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (item_id) REFERENCES items (item_id)
    );

CREATE TABLE
    reviews (
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

CREATE TABLE
    item_approvals (
        item_id VARCHAR(255) NOT NULL,
        item_name VARCHAR(255) NOT NULL,
        item_price INT NOT NULL,
        item_description LONGTEXT NOT NULL,
        item_quantity INT NOT NULL,
        merchant_id VARCHAR(255) NOT NULL,
        category_id VARCHAR(255) NOT NULL,
        merchant_level_id VARCHAR(255) NOT NULL,
        is_approved BOOLEAN DEFAULT false,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (item_id),
        FOREIGN KEY (merchant_id) REFERENCES users (user_id),
        FOREIGN KEY (category_id) REFERENCES item_categories (category_id),
        FOREIGN KEY (merchant_level_id) REFERENCES interest_level (interest_level_id)
    );

CREATE TABLE
    item_image_approvals (
        item_image_id VARCHAR(255) NOT NULL,
        item_image LONGBLOB NOT NULL,
        item_id VARCHAR(255) NOT NULL,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (item_image_id),
        FOREIGN KEY (item_id) REFERENCES item_approvals (item_id)
    );

CREATE TABLE
    chats (
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

CREATE TABLE
    user_capabilities (
        user_id VARCHAR(255) NOT NULL,
        capability_id VARCHAR(255) NOT NULL,
        is_active BOOLEAN DEFAULT true,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_id, capability_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (capability_id) REFERENCES capabilities (capability_id)
    );

CREATE TABLE
    posts (
        post_id VARCHAR(255) NOT NULL,
        user_id VARCHAR(255) NOT NULL,
        title VARCHAR(255) NOT NULL,
        content LONGTEXT,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (post_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id)
    );

CREATE TABLE
    comments (
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

CREATE TABLE
    post_upvotes (
        user_id VARCHAR(255) NOT NULL,
        post_id VARCHAR(255) NOT NULL,
        value INT DEFAULT 0,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_id, post_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (post_id) REFERENCES posts (post_id)
    );

CREATE TABLE
    comment_upvotes (
        user_id VARCHAR(255) NOT NULL,
        comment_id VARCHAR(255) NOT NULL,
        value INT DEFAULT 0,
        gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
        PRIMARY KEY (user_id, comment_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id),
        FOREIGN KEY (comment_id) REFERENCES comments (comment_id)
    );

CREATE TABLE
    post_reports (
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

CREATE TABLE
    comment_reports (
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

INSERT INTO user_roles(role_id, role_name)
VALUES("8e6993f7-356f-4a77-9cbb-bffbde74f5fc", "USER"),
      ("5e462578-658c-4e40-8f06-4125f8aa413e", "MERCHANT"),
      ("ccde9d0c-eb08-482b-b2ee-76fcf2f47ef7", "ADMIN");
