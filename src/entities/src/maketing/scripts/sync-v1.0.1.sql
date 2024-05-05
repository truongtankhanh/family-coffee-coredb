-- Sử dụng database 'family_coffee_db'
USE `family_coffee_db`;

-- Tạo bảng restaurant
CREATE TABLE
  IF NOT EXISTS `restaurant` (
    `id` VARCHAR(36) NOT NULL PRIMARY KEY,
    `description` TEXT NULL COMMENT 'Mô tả về quán',
    `address` TEXT NULL COMMENT 'Địa chỉ quán',
    `phone_number` VARCHAR(20) NULL COMMENT 'Số điện thoại quán',
    `email` VARCHAR(100) NULL COMMENT 'Địa chỉ email liên hệ',
    `working_hours` VARCHAR(35) NULL COMMENT 'Giờ mở cửa và đóng cửa của quán',
    `social_media` TEXT NULL COMMENT 'Lưu trữ các liên kết đến trang mạng xã hội của nhà hàng',
    `image` TEXT NULL COMMENT 'Đường dẫn ảnh đại diện của nhà hàng',
    `is_active` ENUM ('active', 'inactive') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái hoạt động của nhà hàng (active/inactive)',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin về các nhà hàng';

-- Tạo bảng rating
CREATE TABLE
  IF NOT EXISTS `rating` (
    `id` VARCHAR(36) PRIMARY KEY NOT NULL,
    `name` ENUM ('ONE', 'TWO', 'THREE', 'FOUR', 'FIVE') COMMENT 'Tên đánh giá',
    `value` VARCHAR(10) COMMENT 'Giá trị đánh giá',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ các mức đánh giá';

-- Tạo bảng feedback
CREATE TABLE
  IF NOT EXISTS `feedback` (
    `id` VARCHAR(36) NOT NULL PRIMARY KEY,
    `message` TEXT NULL COMMENT 'Nội dung phản hồi',
    `restaurant_id` VARCHAR(36) NOT NULL COMMENT 'Mã nhà hàng (liên kết bảng restaurant)',
    `rate_id` VARCHAR(36) NOT NULL COMMENT 'Đánh giá của khách hàng',
    `user_id` VARCHAR(36) NOT NULL COMMENT 'Mã người dùng (liên kết bảng user)',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng';

-- Tạo khoá ngoại
ALTER TABLE `feedback` ADD CONSTRAINT `FK_feedback_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `feedback` ADD CONSTRAINT `FK_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `feedback` ADD CONSTRAINT `FK_feedback_rating` FOREIGN KEY (`rate_id`) REFERENCES `rating` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng blog_posts
CREATE TABLE
  IF NOT EXISTS `blog_posts` (
    `id` VARCHAR(36) NOT NULL PRIMARY KEY,
    `title` TEXT NULL COMMENT 'Tiêu đề bài viết',
    `content` TEXT NULL COMMENT 'Nội dung bài viết',
    `is_active` ENUM ('active', 'inactive') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái hoạt động của bài viết (active/inactive)',
    `user_id` VARCHAR(36) NOT NULL COMMENT 'Mã người dùng (liên kết bảng user)',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin các bài viết blog';

-- Tạo khoá ngoại
ALTER TABLE `blog_posts` ADD CONSTRAINT `FK_blog_posts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng comments
CREATE TABLE
  IF NOT EXISTS `comments` (
    `id` VARCHAR(36) NOT NULL PRIMARY KEY,
    `content` TEXT NULL COMMENT 'Nội dung bình luận',
    `rate_id` VARCHAR(36) NOT NULL COMMENT 'Đánh giá của người dùng (1-5 sao)',
    `blog_id` VARCHAR(36) NOT NULL COMMENT 'Mã bài viết (liên kết bảng blog_posts)',
    `user_id` VARCHAR(36) NOT NULL COMMENT 'Mã người dùng (liên kết bảng user)',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin bình luận của người dùng về các bài viết blog';

-- Tạo khoá ngoại
ALTER TABLE `comments` ADD CONSTRAINT `FK_comments_blog_post` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `comments` ADD CONSTRAINT `FK_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `comments` ADD CONSTRAINT `FK_comments_rating` FOREIGN KEY (`rate_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;