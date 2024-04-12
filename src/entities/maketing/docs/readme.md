## Docs Database cho Bảng `restaurant`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin về các nhà hàng

**Cột:**

| Tên cột       | Kiểu dữ liệu               | Độ dài | Mô tả                                 | Bắt buộc | Giá trị mặc định |
| ------------- | -------------------------- | ------ | ------------------------------------- | -------- | ---------------- |
| id            | TEXT                       | -      | Khóa chính, UUID được tạo tự động     | Có       | -                |
| description   | TEXT                       | -      | Mô tả về quán                         | Có       | -                |
| address       | TEXT                       | -      | Địa chỉ quán                          | Có       | -                |
| phone_number  | VARCHAR(20)                | 20     | Số điện thoại quán                    | Có       | -                |
| email         | VARCHAR(100)               | 100    | Địa chỉ email liên hệ                 | Có       | -                |
| working_hours | VARCHAR(35)                | 35     | Giờ mở cửa và đóng cửa của quán       | Có       | -                |
| social_media  | TEXT                       | -      | Các liên kết mạng xã hội của nhà hàng | Có       | -                |
| image         | TEXT                       | -      | Đường dẫn ảnh đại diện của nhà hàng   | Có       | -                |
| is_active     | ENUM('active', 'inactive') | -      | Trạng thái hoạt động của nhà hàng     | Có       | ACTIVE           |

**Chú thích:**

- Bảng `restaurant` lưu trữ thông tin chi tiết về các nhà hàng, bao gồm mô tả, địa chỉ, số điện thoại, email, giờ mở cửa, ảnh đại diện, **mạng xã hội**, và trạng thái hoạt động.
- Tất cả các cột đều được đánh dấu là `Có` nghĩa là chúng là trường bắt buộc và phải được cung cấp khi tạo hoặc cập nhật thông tin nhà hàng.
- Cột `social_media` lưu trữ các liên kết đến trang mạng xã hội của nhà hàng, được phân cách bằng dấu phẩy (ví dụ: [https://www.facebook.com/myrestaurant](https://www.facebook.com/myrestaurant), [https://www.instagram.com/myrestaurant](https://www.instagram.com/myrestaurant)).
- Cột `image` lưu trữ đường dẫn đến ảnh đại diện của nhà hàng.
- Cột `is_active` cho biết nhà hàng có đang hoạt động hay không.

---

---

## Docs Database cho Bảng `feedback`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin phản hồi của khách hàng về nhà hàng

**Cột:**

| Tên cột       | Kiểu dữ liệu | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định  |
| ------------- | ------------ | ------ | --------------------------------- | -------- | ----------------- |
| id            | TEXT         | -      | Khóa chính, UUID được tạo tự động | Có       | -                 |
| message       | TEXT         | -      | Nội dung phản hồi                 | Có       | -                 |
| restaurant_id | VARCHAR(36)  | 36     | ID của nhà hàng                   | Có       | -                 |
| rating        | INT          | -      | Đánh giá của khách hàng (1-5 sao) | Có       | -                 |
| user_id       | VARCHAR(36)  | 36     | ID của người dùng                 | Có       | -                 |
| created_at    | TIMESTAMP    | -      | Thời điểm tạo phản hồi            | Có       | CURRENT_TIMESTAMP |

**Quan hệ:**

- Bảng `feedback` có mối quan hệ nhiều-đối-một với bảng `restaurants`, một phản hồi thuộc về một nhà hàng.
- Bảng `feedback` có mối quan hệ nhiều-đối-một với bảng `users`, một phản hồi được tạo bởi một người dùng.

**Chú thích:**

- Bảng `feedback` lưu trữ thông tin chi tiết về các phản hồi của khách hàng, bao gồm nội dung, ID nhà hàng, đánh giá (sao), ID người dùng, và thời điểm tạo phản hồi.
- Tất cả các cột, trừ `created_at`, được đánh dấu là `Có` nghĩa là chúng là trường bắt buộc và phải được cung cấp khi tạo phản hồi.
- Cột `created_at` được đánh dấu là `Có` với giá trị mặc định `CURRENT_TIMESTAMP` để tự động lưu thời điểm tạo phản hồi khi thêm dữ liệu vào bảng.
- Cột `restaurant_id` là khóa ngoại tham chiếu đến bảng `restaurants` để xác định nhà hàng nhận được phản hồi.
- Cột `user_id` là khóa ngoại tham chiếu đến bảng `users` để xác định người dùng tạo ra phản hồi.

---

---

## Docs Database cho Bảng `blog_posts`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin các bài viết blog

**Cột:**

| Tên cột    | Kiểu dữ liệu               | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định  |
| ---------- | -------------------------- | ------ | --------------------------------- | -------- | ----------------- |
| id         | TEXT                       | -      | Khóa chính, UUID được tạo tự động | Có       | -                 |
| title      | TEXT                       | -      | Tiêu đề bài viết                  | Có       | -                 |
| content    | TEXT                       | -      | Nội dung bài viết                 | Có       | -                 |
| is_active  | ENUM('active', 'inactive') | -      | Trạng thái hoạt động của bài viết | Có       | ACTIVE            |
| user_id    | VARCHAR(36)                | 36     | ID của người viết bài             | Có       | -                 |
| created_at | TIMESTAMP                  | -      | Thời điểm tạo bài viết            | Có       | CURRENT_TIMESTAMP |

**Quan hệ:**

- Bảng `blog_posts` có mối quan hệ một-đối-nhiều với bảng `comments`, một bài viết có nhiều bình luận.
- Bảng `blog_posts` có mối quan hệ nhiều-đối-một với bảng `users`, một bài viết được viết bởi một người dùng.

**Chú thích:**

- Bảng `blog_posts` lưu trữ thông tin chi tiết về các bài viết blog, bao gồm tiêu đề, nội dung, trạng thái hoạt động, ID người viết bài, và thời điểm tạo bài viết.
- Tất cả các cột, trừ `created_at`, được đánh dấu là `Có` nghĩa là chúng là trường bắt buộc và phải được cung cấp khi tạo bài viết.
- Cột `created_at` được đánh dấu là `Có` với giá trị mặc định `CURRENT_TIMESTAMP` để tự động lưu thời điểm tạo bài viết khi thêm dữ liệu vào bảng.
- Cột `user_id` là khóa ngoại tham chiếu đến bảng `users` để xác định người dùng tạo bài viết.

---

---

## Docs Database cho Bảng `comments`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin bình luận của người dùng về các bài viết blog

**Cột:**

| Tên cột    | Kiểu dữ liệu | Độ dài | Mô tả                                                                      | Bắt buộc | Giá trị mặc định  |
| ---------- | ------------ | ------ | -------------------------------------------------------------------------- | -------- | ----------------- |
| id         | TEXT         | -      | Khóa chính, UUID được tạo tự động                                          | Có       | -                 |
| content    | TEXT         | -      | Nội dung bình luận                                                         | Có       | -                 |
| rating     | ENUM         | -      | Đánh giá của người dùng (Các giá trị được định nghĩa trong `RATING_VALUE`) | Có       | -                 |
| blog_id    | VARCHAR(36)  | 36     | ID của bài viết blog                                                       | Có       | -                 |
| user_id    | VARCHAR(36)  | 36     | ID của người dùng bình luận                                                | Có       | -                 |
| created_at | TIMESTAMP    | -      | Thời điểm tạo bình luận                                                    | Có       | CURRENT_TIMESTAMP |

**Quan hệ:**

- Bảng `comments` có mối quan hệ nhiều-đối-một với bảng `blog_posts`, một bình luận thuộc về một bài viết blog.
- Bảng `comments` có mối quan hệ nhiều-đối-một với bảng `users`, một bình luận được tạo bởi một người dùng.

**Chú thích:**

- Bảng `comments` lưu trữ thông tin chi tiết về các bình luận của người dùng, bao gồm nội dung, **đánh giá** (theo định nghĩa trong `RATING_VALUE`), ID bài viết blog, ID người dùng bình luận, và thời điểm tạo bình luận.
- Cột `rating` được sử dụng kiểu dữ liệu `ENUM` để giới hạn các giá trị đánh giá có thể theo những giá trị được xác định trong `RATING_VALUE`. Điều này đảm bảo tính nhất quán và dễ dàng quản lý các lựa chọn đánh giá.
- Cột `created_at` được đánh dấu là `Có` với giá trị mặc định `CURRENT_TIMESTAMP` để tự động lưu thời điểm tạo bình luận khi thêm dữ liệu vào bảng.
- Cột `blog_id` là khóa ngoại tham chiếu đến bảng `blog_posts` để xác định bài viết nhận được bình luận.
- Cột `user_id` là khóa ngoại tham chiếu đến bảng `users` để xác định người dùng tạo ra bình luận.

---

---
