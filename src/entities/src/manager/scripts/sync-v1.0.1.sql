-- Sử dụng database 'family_coffee_db'
USE `family_coffee_db`;

-- Tạo bảng user_roles
CREATE TABLE
    IF NOT EXISTS `user_roles` (
        `id` VARCHAR(36) PRIMARY KEY NOT NULL,
        `name` VARCHAR(50) NOT NULL COMMENT 'Vai trò của người dùng',
        `description` TEXT NOT NULL COMMENT 'Mô tả về vai trò của người dùng',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ về các vai trò của người dùng';

-- Tạo bảng users
CREATE TABLE
    IF NOT EXISTS `users` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `email` VARCHAR(100) NULL COMMENT 'Địa chỉ email của người dùng',
        `password` VARCHAR(255) NOT NULL COMMENT 'Mật khẩu được mã hóa của người dùng',
        `full_name` NVARCHAR (255) NOT NULL COMMENT 'Họ và tên của người dùng',
        `address` TEXT NULL COMMENT 'Địa chỉ của người dùng',
        `phone_number` VARCHAR(20) NOT NULL UNIQUE COMMENT 'Số điện thoại của người dùng',
        `is_active` ENUM ('active', 'inactive') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái hoạt động của tài khoản (active/inactive)',
        `role_id` VARCHAR(36) NULL COMMENT 'Vai trò của người dùng',
        `jwt_token` VARCHAR(255) NOT NULL UNIQUE COMMENT 'Lưu trữ token JWT cho mỗi người dùng',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin người dùng cho quán cà phê';

-- Tạo khoá ngoại
ALTER TABLE `users` ADD CONSTRAINT `FK_user_user_roles` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng categories
CREATE TABLE
    IF NOT EXISTS `categories` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `name` NVARCHAR (255) NOT NULL COMMENT 'Tên danh mục sản phẩm',
        `description` TEXT NULL COMMENT 'Mô tả ngắn gọn về danh mục',
        `is_active` ENUM ('active', 'inactive') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái hoạt động của danh mục',
        `parent_id` VARCHAR(36) NULL COMMENT 'ID danh mục cha (để hỗ trợ danh mục con, khóa ngoại tham chiếu đến chính bảng Categories)',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL,
        CONSTRAINT `fk_categories_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ danh mục sản phẩm cho quán cà phê';

-- Tạo bảng product_params
CREATE TABLE
    IF NOT EXISTS `product_params` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `name` NVARCHAR (255) NOT NULL COMMENT 'Tên size sản phẩm',
        `capacity` INT NOT NULL COMMENT 'Dung tích sản phẩm theo size(đơn vị là ml)',
        `category_id` VARCHAR(36) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'Lưu trữ thông tin về các size của sản phẩm';

-- Tạo khoá ngoại
ALTER TABLE `product_params` ADD CONSTRAINT `FK_product_params_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng products
CREATE TABLE
    IF NOT EXISTS `products` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `name` TEXT COMMENT 'Tên sản phẩm',
        `description` TEXT COMMENT 'Mô tả sản phẩm',
        `price` FLOAT COMMENT 'Giá sản phẩm',
        `toppings` TEXT NULL COMMENT 'Topings hoặc thành phần của sản phẩm',
        `is_active` ENUM ('active', 'inactive') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái hoạt động của sản phẩm (active/inactive)',
        `category_id` VARCHAR(36) NOT NULL COMMENT 'ID danh mục sản phẩm (khóa ngoại kết nối đến bảng Categories)',
        `product_params_id` VARCHAR(36) NOT NULL,
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các sản phẩm được bán tại quán cà phê';

-- Tạo khoá ngoại
ALTER TABLE `products` ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `products` ADD CONSTRAINT `FK_products_product_params` FOREIGN KEY (`product_params_id`) REFERENCES `product_params` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng product_images
CREATE TABLE
    IF NOT EXISTS `product_images` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `product_id` VARCHAR(36) NOT NULL COMMENT 'ID sản phẩm',
        `image_url` TEXT COMMENT 'URL ảnh sản phẩm',
        `is_main` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Ảnh đại diện cho sản phẩm',
        `thumbnail_url` TEXT DEFAULT NULL COMMENT 'URL đường dẫn đến ảnh thu gọn của ảnh chính',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các ảnh sản phẩm';

-- Tạo khoá ngoại
ALTER TABLE `product_images` ADD CONSTRAINT `FK_product_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng product_category
CREATE TABLE
    IF NOT EXISTS `product_category` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `product_id` VARCHAR(36) NOT NULL COMMENT 'ID sản phẩm (khóa ngoại kết nối đến bảng Products)',
        `category_id` VARCHAR(36) NOT NULL COMMENT 'ID danh mục sản phẩm (khóa ngoại kết nối đến bảng Categories)',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ' Lưu trữ mối quan hệ nhiều-đối-nhiều giữa các sản phẩm và danh mục sản phẩm';

-- Tạo khoá ngoại
ALTER TABLE `product_category` ADD CONSTRAINT `FK_product_category_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `product_category` ADD CONSTRAINT `FK_product_category_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- Tạo bảng order_statuses
CREATE TABLE
    IF NOT EXISTS `order_statuses` (
        `id` VARCHAR(36) PRIMARY KEY NOT NULL,
        `name` VARCHAR(50) NOT NULL COMMENT 'Trạng thái đơn hàng',
        `description` TEXT COMMENT 'Mô tả về trạng thái đơn hàng',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các trạng thái đơn hàng';

-- Tạo bảng payment_statuses
CREATE TABLE
    IF NOT EXISTS `payment_statuses` (
        `id` VARCHAR(36) PRIMARY KEY NOT NULL,
        `name` VARCHAR(50) NOT NULL COMMENT 'Trạng thái thanh toán',
        `description` TEXT NOT NULL COMMENT 'Mô tả về trạng thái thanh toán',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các trạng thái đơn hàng';

-- Tạo bảng orders
CREATE TABLE
    IF NOT EXISTS `orders` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `total_amount` DECIMAL(10, 2) COMMENT 'Tổng số tiền của đơn hàng',
        `delivery_address` TEXT COMMENT 'Địa chỉ giao hàng',
        `delivery_fee` DECIMAL(10, 2) DEFAULT 0 COMMENT 'Phí giao hàng (nếu có)',
        `note` TEXT COMMENT 'Ghi chú của khách hàng',
        `order_status_id` VARCHAR(36) NOT NULL COMMENT 'Trạng thái đơn hàng',
        `payment_status_id` VARCHAR(36) NOT NULL COMMENT 'Trạng thái thanh toán',
        `paid_at` DATETIME DEFAULT NULL COMMENT 'Thời điểm khách hàng thanh toán cho đơn hàng',
        `cancel_at` DATETIME DEFAULT NULL COMMENT 'Thời điểm khách hàng huỷ đơn hàng',
        `user_id` VARCHAR(36) NOT NULL COMMENT 'ID người dùng đặt hàng',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các đơn hàng';

-- Tạo khoá ngoại
ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_order_status` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_payment_status` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng order_history
CREATE TABLE
    IF NOT EXISTS `order_history` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `quantity` INT COMMENT 'Số lượng sản phẩm được đặt trong đơn hàng',
        `subtotal` INT COMMENT 'Tổng giá của sản phẩm trong đơn hàng, tự động tính toán',
        `order_id` VARCHAR(36) NOT NULL COMMENT 'ID của đơn hàng',
        `product_id` VARCHAR(36) NOT NULL COMMENT 'ID của sản phẩm',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ' Lưu trữ chi tiết các sản phẩm trong một đơn hàng';

-- Tạo khoá ngoại
ALTER TABLE `order_history` ADD CONSTRAINT `FK_order_history_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `order_history` ADD CONSTRAINT `FK_order_history_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo bảng payments
CREATE TABLE
    IF NOT EXISTS `payments` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `method` VARCHAR(50) NOT NULL COMMENT 'Phương thức thanh toán',
        `description` TEXT NOT NULL COMMENT 'Mô tả về phương thức thanh toán',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ thông tin về các khoản thanh toán';

-- Tạo bảng payment_history
CREATE TABLE
    IF NOT EXISTS `payment_history` (
        `id` VARCHAR(36) NOT NULL PRIMARY KEY,
        `payment_id` VARCHAR(36) NOT NULL COMMENT 'ID thanh toán (khóa ngoại kết nối đến bảng Payments)',
        `order_id` VARCHAR(36) NOT NULL COMMENT 'ID đơn hàng liên quan đến thanh toán (khóa ngoại kết nối đến bảng Orders)',
        `amount` FLOAT COMMENT 'Số tiền thanh toán',
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted_at` DATETIME DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'Lưu trữ lịch sử chi tiết về các khoản thanh toán';

-- Tạo khoá ngoại
ALTER TABLE `payment_history` ADD CONSTRAINT `FK_payment_history_payment` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `payment_history` ADD CONSTRAINT `FK_payment_history_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;