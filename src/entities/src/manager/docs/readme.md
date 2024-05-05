## Docs Database cho Bảng `products`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin về các sản phẩm được bán tại quán cà phê

**Cột:**

| Tên cột     | Kiểu dữ liệu               | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định  |
| ----------- | -------------------------- | ------ | --------------------------------- | -------- | ----------------- |
| id          | TEXT                       | -      | Khóa chính, UUID được tạo tự động | Có       | -                 |
| name        | TEXT                       | -      | Tên sản phẩm                      | Có       | -                 |
| description | TEXT                       | -      | Mô tả sản phẩm                    | Có       | -                 |
| price       | FLOAT                      | -      | Giá sản phẩm                      | Có       | -                 |
| capacity    | FLOAT                      | -      | Dung tích sản phẩm                | Có       | -                 |
| stock       | INT                        | -      | Số lượng sản phẩm còn hàng        | Có       | -                 |
| is_active   | ENUM('active', 'inactive') | -      | Trạng thái hoạt động của sản phẩm | Có       | ACTIVE            |
| category_id | VARCHAR(36)                | 36     | ID của danh mục sản phẩm          | Có       | -                 |
| created_at  | TIMESTAMP                  | -      | Thời điểm tạo sản phẩm            | Có       | CURRENT_TIMESTAMP |

**Quan hệ:**

- Bảng `products` có mối quan hệ nhiều-đối-một với bảng `categories`, một sản phẩm thuộc về một danh mục.
- Bảng `products` có mối quan hệ một-đối-nhiều với bảng `product_images`, một sản phẩm có nhiều ảnh đại diện.

**Chú thích:**

- Bảng `products` lưu trữ thông tin chi tiết về các sản phẩm, bao gồm tên, mô tả, giá, dung tích, số lượng tồn kho, trạng thái hoạt động, ID danh mục sản phẩm, và thời điểm tạo sản phẩm.
- Cột `created_at` được thêm vào để theo dõi thời điểm sản phẩm được tạo.
- Cột `stock` được thêm vào để quản lý số lượng sản phẩm còn hàng.
- Cột `is_active` được sử dụng kiểu dữ liệu `ENUM` để giới hạn trạng thái sản phẩm thành "active" (hoạt động) hoặc "inactive" (không hoạt động).
- Cột `category_id` là khóa ngoại tham chiếu đến bảng `categories` để xác định danh mục mà sản phẩm thuộc về.

---

---

## Docs Database cho Bảng `product_images`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin về các ảnh sản phẩm

**Cột:**

| Tên cột       | Kiểu dữ liệu | Độ dài | Mô tả                                       | Bắt buộc | Giá trị mặc định |
| ------------- | ------------ | ------ | ------------------------------------------- | -------- | ---------------- |
| id            | TEXT         | -      | Khóa chính, UUID được tạo tự động           | Có       | -                |
| product_id    | VARCHAR(36)  | 36     | ID sản phẩm                                 | Có       | -                |
| image_url     | TEXT         | -      | URL ảnh sản phẩm                            | Có       | -                |
| is_main       | BOOLEAN      | -      | Ảnh đại diện cho sản phẩm                   | Có       | false            |
| thumbnail_url | TEXT         | -      | URL đường dẫn đến ảnh thu gọn của ảnh chính | Không    | null             |

**Quan hệ:**

- Bảng `product_images` có mối quan hệ nhiều-đối-một với bảng `products`, một ảnh sản phẩm thuộc về một sản phẩm.

**Chú thích:**

- Bảng `product_images` lưu trữ thông tin chi tiết về các ảnh sản phẩm, bao gồm ID sản phẩm, URL ảnh, URL ảnh thu gọn, và chỉ định ảnh nào là ảnh đại diện cho sản phẩm.
- Cột `product_id` là khóa ngoại tham chiếu đến bảng `products` để xác định sản phẩm liên quan đến ảnh.
- Cột `is_main` là cờ boolean để đánh dấu ảnh đại diện của sản phẩm. Giá trị mặc định là `false` để cho phép nhiều ảnh cho một sản phẩm và chỉ một ảnh được đánh dấu là chính.
- Cột `thumbnail_url` có kiểu dữ liệu `TEXT` và có thể lưu trữ URL đường dẫn đến ảnh thu gọn của ảnh chính. Cột này được đánh dấu là `Không` nghĩa là nó không bắt buộc và có thể để trống. Giá trị mặc định là `null`.

---

---

## Docs Database cho Bảng `categories`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ danh mục sản phẩm cho quán cà phê

**Cột:**

| Tên cột     | Kiểu dữ liệu               | Độ dài | Mô tả                                 | Bắt buộc | Giá trị mặc định |
| ----------- | -------------------------- | ------ | ------------------------------------- | -------- | ---------------- |
| id          | TEXT                       | -      | Khóa chính, UUID được tạo tự động     | Có       | -                |
| name        | NVARCHAR(255)              | 255    | Tên danh mục sản phẩm                 | Có       | -                |
| description | TEXT                       | -      | Mô tả ngắn gọn về danh mục            | Có       | -                |
| is_active   | ENUM('active', 'inactive') | -      | Trạng thái hoạt động của danh mục     | Có       | ACTIVE           |
| parent_id   | INT                        | -      | ID danh mục cha (hỗ trợ danh mục con) | Không    | null             |

**Quan hệ:**

- Bảng `categories` có mối quan hệ một-đối-nhiều với bảng `products`, một danh mục sản phẩm có thể chứa nhiều sản phẩm.
- Bảng `categories` có mối quan hệ nhiều-đối-nhiều với chính nó, một danh mục có thể là danh mục con của một danh mục khác (danh mục cha).

**Chú thích:**

- Bảng `categories` lưu trữ thông tin chi tiết về danh mục sản phẩm, bao gồm tên, mô tả, trạng thái hoạt động, và ID danh mục cha (nếu có).
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `name` lưu trữ tên danh mục sản phẩm, tối đa 255 ký tự.
- Cột `description` lưu trữ mô tả ngắn gọn về danh mục.
- Cột `is_active` là cờ boolean để đánh dấu trạng thái hoạt động của danh mục. Giá trị mặc định là `ACTIVE`.
- Cột `parent_id` là khóa ngoại tham chiếu đến chính bảng `categories` để xác định danh mục cha. Cột này có thể null, cho phép danh mục gốc (không có danh mục cha).
- Mối quan hệ một-đối-nhiều với `Product` được sử dụng để quản lý các sản phẩm thuộc về danh mục.
- Mối quan hệ nhiều-đối-nhiều với chính nó (danh mục con) được sử dụng để tổ chức danh mục theo dạng phân cấp cây.

---

---

## Docs Database cho Bảng `product_category`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ mối quan hệ nhiều-đối-nhiều giữa các sản phẩm và danh mục sản phẩm

**Cột:**

| Tên cột     | Kiểu dữ liệu | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định |
| ----------- | ------------ | ------ | --------------------------------- | -------- | ---------------- |
| id          | INT          | -      | Khóa chính, UUID được tạo tự động | Có       | -                |
| product_id  | INT          | -      | ID sản phẩm                       | Có       | -                |
| category_id | INT          | -      | ID danh mục sản phẩm              | Có       | -                |

**Quan hệ:**

- Bảng `product_category` có mối quan hệ một-đối-một với bảng `products`, một bản ghi trong bảng này đại diện cho một sản phẩm thuộc về một danh mục.
- Bảng `product_category` có mối quan hệ một-đối-một với bảng `categories`, một bản ghi trong bảng này đại diện cho một danh mục sản phẩm có thể chứa nhiều sản phẩm.

**Chú thích:**

- Bảng `product_category` được sử dụng để lưu trữ mối quan hệ nhiều-đối-nhiều giữa các sản phẩm và danh mục sản phẩm.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `product_id` là khóa ngoại tham chiếu đến bảng `products` để xác định sản phẩm liên quan.
- Cột `category_id` là khóa ngoại tham chiếu đến bảng `categories` để xác định danh mục sản phẩm liên quan.
- Các mối quan hệ một-đối-một với `Product` và `Category` được sử dụng để đảm bảo tính toàn vẹn dữ liệu và tránh ràng buộc ngoại vi.

---

---

## Docs Database cho Bảng `order_statuses` (số nhiều để phù hợp với tên trạng thái)

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ các trạng thái đơn hàng có thể có

**Cột:**

| Tên cột     | Kiểu dữ liệu                                                      | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định |
| ----------- | ----------------------------------------------------------------- | ------ | --------------------------------- | -------- | ---------------- |
| id          | TEXT                                                              | -      | Khóa chính, UUID được tạo tự động | Có       | -                |
| name        | ENUM('pending', 'confirmed', 'shipped', 'delivered', 'cancelled') | -      | Tên trạng thái đơn hàng           | Có       | -                |
| description | TEXT                                                              | -      | Mô tả về trạng thái đơn hàng      | Không    | null             |

**Quan hệ:**

- Bảng `order_statuses` có mối quan hệ một-đối-nhiều với bảng `orders`, một trạng thái đơn hàng có thể được áp dụng cho nhiều đơn hàng.

**Chú thích:**

- Bảng `order_statuses` lưu trữ danh sách các trạng thái đơn hàng có thể có cho hệ thống quản lý quán cà phê.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `name` là một trường `ENUM` để lưu trữ tên của trạng thái đơn hàng (ví dụ: "pending", "confirmed", "shipped", "delivered", "cancelled").
- Cột `description` lưu trữ mô tả ngắn gọn về trạng thái đơn hàng (tùy chọn).
- Mối quan hệ một-đối-nhiều với bảng `orders` được sử dụng để liên kết trạng thái đơn hàng với các đơn hàng cụ thể.

---

---

## Docs Database cho Bảng `payment_statuses` (số nhiều để phù hợp với tên trạng thái)

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ các trạng thái thanh toán có thể có

**Cột:**

| Tên cột     | Kiểu dữ liệu                                  | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định |
| ----------- | --------------------------------------------- | ------ | --------------------------------- | -------- | ---------------- |
| id          | TEXT                                          | -      | Khóa chính, UUID được tạo tự động | Có       | -                |
| name        | ENUM('pending', 'paid', 'failed', 'refunded') | -      | Tên trạng thái thanh toán         | Có       | -                |
| description | TEXT                                          | -      | Mô tả về trạng thái thanh toán    | Không    | null             |

**Quan hệ:**

- Bảng `payment_statuses` có thể có mối quan hệ nhiều-đối-nhiều với bảng `payments` ( tùy thuộc vào thiết kế của hệ thống). Một trạng thái thanh toán có thể được áp dụng cho nhiều khoản thanh toán, và một khoản thanh toán có thể có nhiều trạng thái trong quá trình xử lý (ví dụ: pending -> paid).

**Chú thích:**

- Bảng `payment_statuses` lưu trữ danh sách các trạng thái thanh toán có thể có cho hệ thống quản lý quán cà phê.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `name` là một trường `ENUM` để lưu trữ tên của trạng thái thanh toán (ví dụ: "pending", "paid", "failed", "refunded").
- Cột `description` lưu trữ mô tả ngắn gọn về trạng thái thanh toán (tùy chọn).
- Mối quan hệ nhiều-đối-nhiều với bảng `payments` (tùy thuộc vào thiết kế của hệ thống) được sử dụng để liên kết trạng thái thanh toán với các khoản thanh toán cụ thể.

---

---

## Docs Database cho Bảng `orders`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin về các đơn hàng

**Cột:**

| Tên cột           | Kiểu dữ liệu | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định |
| ----------------- | ------------ | ------ | --------------------------------- | -------- | ---------------- |
| id                | TEXT         | -      | Khóa chính, UUID được tạo tự động | Có       | -                |
| total_amount      | DECIMAL      | -      | Tổng số tiền của đơn hàng         | Có       | -                |
| delivery_address  | TEXT         | -      | Địa chỉ giao hàng                 | Có       | -                |
| delivery_fee      | DECIMAL      | -      | Phí giao hàng                     | Có       | 0                |
| note              | TEXT         | -      | Ghi chú của khách hàng            | Không    | null             |
| order_status_id   | VARCHAR(36)  | 36     | ID trạng thái đơn hàng            | Có       | -                |
| payment_status_id | VARCHAR(36)  | 36     | ID trạng thái thanh toán          | Có       | -                |
| paid_at           | TIMESTAMP    | -      | Thời điểm thanh toán              | Không    | null             |
| cancel_at         | TIMESTAMP    | -      | Thời điểm hủy đơn hàng            | Không    | null             |
| user_id           | VARCHAR(36)  | 36     | ID người dùng đặt hàng            | Có       | -                |

**Quan hệ:**

- Bảng `orders` có mối quan hệ một-đối-nhiều với bảng `order_histories`, một đơn hàng có thể có nhiều lịch sử thay đổi.
- Bảng `orders` có mối quan hệ nhiều-đối-một với bảng `users`, một người dùng có thể có nhiều đơn hàng.
- Bảng `orders` có mối quan hệ một-đối-một với bảng `order_statuses`, một đơn hàng thuộc về một trạng thái đơn hàng cụ thể.
- Bảng `orders` có mối quan hệ một-đối-một với bảng `payment_statuses`, một đơn hàng thuộc về một trạng thái thanh toán cụ thể.

**Chú thích:**

- Bảng `orders` lưu trữ thông tin chi tiết về các đơn hàng được tạo trên hệ thống quán cà phê.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `total_amount` lưu trữ tổng số tiền của đơn hàng.
- Cột `delivery_address` lưu trữ địa chỉ giao hàng của khách hàng.
- Cột `delivery_fee` lưu trữ phí giao hàng (mặc định là 0).
- Cột `note` lưu trữ ghi chú của khách hàng về đơn hàng (tùy chọn).
- Cột `order_status_id` là khóa ngoại tham chiếu đến bảng `order_statuses` để xác định trạng thái đơn hàng hiện tại.
- Cột `payment_status_id` là khóa ngoại tham chiếu đến bảng `payment_statuses` để xác định trạng thái thanh toán hiện tại.
- Cột `paid_at` lưu trữ thời điểm khách hàng thanh toán cho đơn hàng (có thể null nếu chưa thanh toán).
- Cột `cancel_at` lưu trữ thời điểm khách hàng hủy đơn hàng (có thể null nếu chưa hủy).
- Cột `user_id` là khóa ngoại tham chiếu đến bảng `users` để xác định người dùng đặt hàng.
- Mối quan hệ với các bảng khác (`order_histories`, `users`, `order_statuses`, `payment_statuses`) được sử dụng để quản lý thông tin chi tiết và lịch sử của từng đơn hàng.

---

---

## Docs Database cho Bảng `order_history`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ chi tiết các sản phẩm trong một đơn hàng

**Cột:**

| Tên cột    | Kiểu dữ liệu | Độ dài | Mô tả                                                   | Bắt buộc | Giá trị mặc định |
| ---------- | ------------ | ------ | ------------------------------------------------------- | -------- | ---------------- |
| id         | TEXT         | -      | Khóa chính, UUID được tạo tự động                       | Có       | -                |
| quantity   | INT          | -      | Số lượng sản phẩm được đặt trong đơn hàng               | Có       | -                |
| subtotal   | INT          | -      | Tổng giá của sản phẩm trong đơn hàng, tự động tính toán | Có       | -                |
| order_id   | VARCHAR(36)  | 36     | ID của đơn hàng                                         | Có       | -                |
| product_id | INT          | -      | ID của sản phẩm                                         | Có       | -                |

**Quan hệ:**

- Bảng `order_history` có mối quan hệ nhiều-đối-một với bảng `orders`, một lịch sử đơn hàng thuộc về một đơn hàng.
- Bảng `order_history` có mối quan hệ một-đối-một với bảng `products`, một lịch sử đơn hàng đại diện cho một sản phẩm cụ thể trong đơn hàng.

**Chú thích:**

- Bảng `order_history` lưu trữ thông tin chi tiết về các sản phẩm được đặt trong một đơn hàng, bao gồm số lượng, tổng giá, ID đơn hàng và ID sản phẩm.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `quantity` lưu trữ số lượng sản phẩm được đặt trong đơn hàng.
- Cột `subtotal` lưu trữ tổng giá của sản phẩm trong đơn hàng, được tính toán tự động dựa trên giá sản phẩm và số lượng.
- Cột `order_id` là khóa ngoại tham chiếu đến bảng `orders` để xác định đơn hàng liên quan.
- Cột `product_id` là khóa ngoại tham chiếu đến bảng `products` để xác định sản phẩm cụ thể trong đơn hàng.
- Mối quan hệ nhiều-đối-một với `Order` được sử dụng để kết nối lịch sử đơn hàng với đơn hàng tương ứng.
- Mối quan hệ một-đối-một với `Product` được sử dụng để xác định sản phẩm liên quan đến lịch sử đơn hàng.

---

---

## Docs Database cho Bảng `payments`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin về các khoản thanh toán

**Cột:**

| Tên cột        | Kiểu dữ liệu                     | Độ dài | Mô tả                             | Bắt buộc | Giá trị mặc định |
| -------------- | -------------------------------- | ------ | --------------------------------- | -------- | ---------------- |
| id             | TEXT                             | -      | Khóa chính, UUID được tạo tự động | Có       | -                |
| payment_method | ENUM('cash', 'card', 'e-wallet') | -      | Phương thức thanh toán            | Có       | -                |

**Chú thích:**

- Bảng `payments` lưu trữ thông tin đơn giản về các khoản thanh toán cho đơn hàng, bao gồm phương thức thanh toán được sử dụng.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `payment_method` là một trường `ENUM` để lưu trữ phương thức thanh toán được sử dụng cho đơn hàng (ví dụ: "cash", "card", "e-wallet").

---

---

## Docs Database cho Bảng `payment_history`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ lịch sử chi tiết về các khoản thanh toán

**Cột:**

| Tên cột    | Kiểu dữ liệu                                  | Độ dài | Mô tả                                                                        | Bắt buộc | Giá trị mặc định  |
| ---------- | --------------------------------------------- | ------ | ---------------------------------------------------------------------------- | -------- | ----------------- |
| id         | TEXT                                          | -      | Khóa chính, UUID được tạo tự động                                            | Có       | -                 |
| payment_id | VARCHAR(36)                                   | 36     | ID thanh toán (khóa ngoại tham chiếu đến bảng Payments)                      | Có       | -                 |
| order_id   | VARCHAR(36)                                   | 36     | ID đơn hàng liên quan đến thanh toán (khóa ngoại tham chiếu đến bảng Orders) | Có       | -                 |
| amount     | DECIMAL                                       | -      | Số tiền thanh toán                                                           | Có       | -                 |
| status     | ENUM('pending', 'paid', 'failed', 'refunded') | -      | Trạng thái thanh toán                                                        | Có       | -                 |
| created_at | TIMESTAMP                                     | -      | Thời điểm tạo lịch sử thanh toán                                             | Có       | CURRENT_TIMESTAMP |

**Quan hệ:**

- Bảng `payment_history` có mối quan hệ một-đối-một với bảng `payments`, một lịch sử thanh toán được liên kết với một khoản thanh toán cụ thể.
- Bảng `payment_history` có mối quan hệ một-đối-một với bảng `orders`, một lịch sử thanh toán được liên kết với một đơn hàng cụ thể.

**Chú thích:**

- Bảng `payment_history` lưu trữ thông tin chi tiết về lịch sử thanh toán cho các đơn hàng, bao gồm ID thanh toán, ID đơn hàng, số tiền thanh toán, trạng thái thanh toán và thời điểm tạo lịch sử thanh toán.
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `payment_id` là khóa ngoại tham chiếu đến bảng `payments` để xác định khoản thanh toán liên quan.
- Cột `order_id` là khóa ngoại tham chiếu đến bảng `orders` để xác định đơn hàng liên quan đến thanh toán.
- Cột `amount` lưu trữ số tiền thanh toán thực tế.
- Cột `status` là một trường `ENUM` để lưu trữ trạng thái thanh toán của giao dịch (ví dụ: "pending", "paid", "failed", "refunded").
- Cột `created_at` được thêm vào để theo dõi thời điểm tạo lịch sử thanh toán.
- Mối quan hệ một-đối-một với `Payment` được sử dụng để truy cập chi tiết về phương thức thanh toán được sử dụng trong `payment_history`.
- Mối quan hệ một-đối-một với `Order` được sử dụng để xác định đơn hàng liên quan đến lịch sử thanh toán.

---

---

## Docs Database cho Bảng `users`

**Sơ đồ:** family_coffee_db

**Mục đích:** Lưu trữ thông tin người dùng cho quán cà phê

**Cột:**

| Tên cột      | Kiểu dữ liệu                       | Độ dài | Mô tả                                      | Bắt buộc | Giá trị mặc định |
| ------------ | ---------------------------------- | ------ | ------------------------------------------ | -------- | ---------------- |
| id           | TEXT                               | -      | Khóa chính, UUID được tạo tự động          | Có       | -                |
| email        | VARCHAR(100)                       | 100    | Địa chỉ email của người dùng               | Không    | null             |
| password     | VARCHAR(255)                       | 255    | Mật khẩu được mã hóa (hash) của người dùng | Có       | -                |
| full_name    | NVARCHAR(255)                      | 255    | Họ và tên của người dùng                   | Có       | -                |
| address      | TEXT                               | -      | Địa chỉ của người dùng                     | Có       | -                |
| phone_number | VARCHAR(20)                        | 20     | Số điện thoại của người dùng               | Có       | -                |
| is_active    | ENUM('active', 'inactive')         | -      | Trạng thái hoạt động của tài khoản         | Có       | 'active'         |
| is_role      | ENUM('customer', 'admin', 'staff') | -      | Vai trò của người dùng                     | Có       | 'customer'       |
| jwt_token    | VARCHAR(255)                       | 255    | Lưu trữ token JWT cho mỗi người dùng       | Không    | null             |

**Quan hệ:**

- Bảng `users` có mối quan hệ nhiều-đối-một với các bảng `orders`, `blog_posts`, `comments`, `feedbacks`, một người dùng có thể có nhiều đơn hàng, bài đăng trên blog, bình luận và feedback.

**Chú thích:**

- Bảng `users` lưu trữ thông tin chi tiết về người dùng của quán cà phê, bao gồm email (có thể để trống), mật khẩu được mã hóa (hash), họ và tên, địa chỉ, số điện thoại (duy nhất), trạng thái hoạt động và vai trò của người dùng (khách hàng, quản trị viên, nhân viên).
- Cột `id` là khóa chính duy nhất cho bảng này.
- Cột `email` lưu trữ địa chỉ email của người dùng để đăng nhập (có thể để trống nếu người dùng đăng nhập bằng phương thức khác).
- Cột `password` lưu trữ mật khẩu của người dùng được mã hóa (hash) để đảm bảo an toàn.
- Cột `full_name` lưu trữ họ và tên của người dùng.
- Cột `address` lưu trữ địa chỉ của người dùng.
- Cột `phone_number` lưu trữ số điện thoại của người dùng, được đặt là duy nhất trong bảng để đảm bảo tính chính xác và tránh trùng lặp.
- Cột `is_active` là một trường `ENUM` để lưu trữ trạng thái hoạt động của tài khoản (active - hoạt động, inactive - không hoạt động).
- Cột `is_role` là một trường `ENUM` để lưu trữ vai trò của người dùng trong hệ thống (customer - khách hàng, admin - quản trị viên, staff - nhân viên).
- Cột `jwt_token` lưu trữ token JWT (nếu có) để xác thực người dùng khi truy cập ứng dụng.
- Mối quan hệ nhiều-đối-một với các bảng khác (`orders`, `blog_posts`, `comments`, `feedbacks`) được sử dụng để theo dõi các hoạt động của người dùng trên hệ thống.

---

---
