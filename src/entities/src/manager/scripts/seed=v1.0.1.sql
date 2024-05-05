-- Sử dụng database 'family_coffee_db'
USE `family_coffee_db`;

-- Thêm dữ liệu cho bảng user_roles
INSERT INTO
    `user_roles` (id, name, description)
VALUES
    (
        'ba0da3d5-cf35-49c2-b72c-095a03629c08',
        'Admin',
        'Quản trị hệ thống, có quyền truy cập đầy đủ vào tất cả các tính năng của ứng dụng'
    ),
    (
        '1c681ea7-a6e9-4932-b34b-af22a056a750',
        'Nhân viên bán hàng',
        'Có quyền truy cập vào các tính năng liên quan đến bán hàng, quản lý đơn hàng và khách hàng'
    ),
    (
        'ee247c1e-9106-41c0-9cd9-652fb516c501',
        'Khách hàng',
        'Người dùng cuối cùng của hệ thống, có thể xem và đặt hàng sản phẩm'
    ),
    (
        '71dd575e-0d41-4bd2-855b-1895ff330262',
        'Kế toán',
        'Chịu trách nhiệm về các công việc liên quan đến tài chính, bao gồm thanh toán, hóa đơn và báo cáo tài chính'
    );

-- Thêm dữ liệu cho bảng users
INSERT INTO
    `users` (
        id,
        email,
        password,
        full_name,
        address,
        phone_number,
        is_active,
        role_id,
        jwt_token
    )
VALUES
    (
        '254bc1f4-43c7-4700-ae58-e412d9162e1e',
        'ttkhanh100896@gmail.com',
        '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225',
        'Trương Tấn Khánh',
        'Thủ Đức, TP.HCM',
        '0868098610',
        'active',
        'ba0da3d5-cf35-49c2-b72c-095a03629c08',
        '080e5e18d67c5dc6c461ef64c4e0bce77fff3b8881f828983209775e3c926370:4902df43fb490952560c720f71b3f457af3399c3b821d196e54e821fc18e72d1'
    );

-- Thêm dữ liệu cho bảng payment_statuses
INSERT INTO
    `payment_statuses` (id, name, description)
VALUES
    (
        'd455fd75-069a-40aa-9354-36e25ebb55d5',
        'Chưa thanh toán',
        'Đơn hàng chưa được thanh toán'
    ),
    (
        '0fc14e59-fd03-40ca-bbcb-d8239d1f85bf',
        'Đã thanh toán',
        'Đơn hàng đã được thanh toán đầy đủ'
    ),
    (
        '510440a3-8890-45d0-8713-598a331a9492',
        'Chờ xác nhận thanh toán',
        'Đơn hàng đang chờ xác nhận thanh toán từ phía người dùng hoặc hệ thống'
    ),
    (
        'cb7a1d7c-d13b-4fc5-9bf9-af0a8f5f2106',
        'Thất bại',
        'Thanh toán đơn hàng đã thất bại'
    ),
    (
        '7fe97686-1ae2-4a35-a934-4ff37207e25f',
        'Hoàn trả',
        'Đơn hàng đã được hoàn trả tiền sau khi đã thanh toán'
    );

-- Thêm dữ liệu cho bảng order_statuses
INSERT INTO
    `order_statuses` (id, name, description)
VALUES
    (
        'fe1c511a-5a07-42fe-8aec-27d48dd13fd0',
        'Mới',
        'Đơn hàng mới được tạo và chưa được xử lý'
    ),
    (
        '362f2ea5-8587-4c3e-9706-a6693ac7373e',
        'Đang xử lý',
        'Đơn hàng đang được xử lý và chuẩn bị để giao'
    ),
    (
        '217f4af3-b956-49be-af0e-37ad1e1238b0',
        'Đã giao hàng',
        'Đơn hàng đã được giao cho khách hàng'
    ),
    (
        '2161cb48-f104-4909-8a94-e16d320ae1e3',
        'Hủy',
        'Đơn hàng đã bị hủy bỏ'
    ),
    (
        '5c86ae61-6c32-443c-9023-b17013935136',
        'Hoàn thành',
        'Đơn hàng đã được hoàn thành và giao hàng thành công'
    );

-- Thêm dữ liệu cho bảng payments
INSERT INTO
    `payments` (id, method, description)
VALUES
    (
        'eae4e5b7-e021-45f2-9adb-b85a418c063f',
        'CASH',
        'Thanh toán bằng tiền mặt'
    ),
    (
        '05150a06-b8c5-4706-9d54-d51bf603ac68',
        'CREDIT_CARD',
        'Thanh toán bằng thẻ tín dụng Visa'
    ),
    (
        '4151cb3f-fa9c-4ac5-877b-29f140dc2f7a',
        'BANK_TRANSFER',
        'Thanh toán bằng chuyển khoản ngân hàng'
    ),
    (
        '6e3df68d-b16e-4794-8788-03e575925afc',
        'EWALLET',
        'Thanh toán bằng ví điện tử'
    ),
    (
        '31d30547-1a82-4146-9e8e-f6e6affa58ab',
        'PAYPAL',
        'Thanh toán bằng PayPal'
    ),
    (
        'f2f1d07a-37ad-44c6-8b40-725e17bc6786',
        'ZALOPAY',
        'Thanh toán bằng ZaloPay'
    ),
    (
        'ffec1f94-81b4-414f-afb9-6ab5b0c41939',
        'MOMO',
        'Thanh toán bằng MoMo'
    ),
    (
        '076987fc-6b60-4002-9f2c-020489151a13',
        'APPLE_PAY',
        'Thanh toán bằng Apple Pay'
    ),
    (
        'c8c33488-b4e1-4b68-8b13-f94abd078e3a',
        'GOOGLE_PAY',
        'Thanh toán bằng Google Pay'
    ),
    (
        '0e91b499-140f-45a3-9672-f3c2148fa711',
        'VOUCHER',
        'Thanh toán bằng phiếu giảm giá'
    ),
    (
        '724d65e4-fcbb-452f-acd2-f8f56072b301',
        'OTHER',
        'Thanh toán bằng phương thức khác'
    );

-- Thêm dữ liệu cho bảng categories
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '6a75efa4-da7c-4ff2-a890-f3b0641fcbe7',
        'Cà phê',
        'Danh mục bao gồm các loại cà phê pha máy, cà phê phin, v.v...',
        'active',
        null
    ),
    (
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0',
        'Trà',
        'Danh mục bao gồm các loại trà xanh, trà đen, trà thảo mộc và trà trái cây, v.v...',
        'active',
        null
    ),
    (
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce',
        'Nước uống',
        'Danh mục bao gồm các loại nước ép cam, nước ép táo, nước ép cà rốt và nước ép dưa hấu, v.v...',
        'active',
        null
    ),
    (
        '63db5737-708c-446f-a07e-b90faf288180',
        'Trà sữa',
        'Danh mục bao gồm các loại trà sữa với đa dạng hương vị và topping, được pha chế từ trà nguyên chất và sữa tươi, mang đến hương vị thơm ngon, béo ngậy, thanh mát, phù hợp với mọi khẩu vị',
        'active',
        null
    );

-- Thêm dữ liệu cho category con của Cà phê
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        'Cà phê pha máy',
        'Danh mục bao gồm các loại cà phê pha bằng máy',
        'active',
        '6a75efa4-da7c-4ff2-a890-f3b0641fcbe7'
    ),
    (
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        'Cà phê phin',
        'Danh mục bao gồm các loại cà phê pha bằng phin',
        'active',
        '6a75efa4-da7c-4ff2-a890-f3b0641fcbe7'
    );

-- Thêm dữ liệu cho category con của Trà
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '2ee46f6b-fb8a-40fd-9bb0-7f9e6b553960',
        'Trà xanh',
        'Danh mục bao gồm các loại trà xanh Nhật Bản, trà xanh Trung Quốc và trà xanh Việt Nam',
        'active',
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    ),
    (
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        'Trà đen',
        'Danh mục bao gồm các loại trà đen Assam, trà đen Darjeeling, trà đen Ceylon và trà đen Lapsang Souchong',
        'active',
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    ),
    (
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        'Trà thảo mộc',
        'Danh mục bao gồm các loại trà hoa cúc, trà hoa hồng, trà bạc hà, trà gừng và trà sả',
        'active',
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    ),
    (
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        'Trà trái cây',
        'Danh mục bao gồm các loại trà đào, trà dâu tây, trà chanh dây, trà việt quất và trà vải, v.v...',
        'active',
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    );

-- Thêm dữ liệu cho category con của Trà xanh
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        'Trà xanh Nhật Bản',
        'Danh mục bao gồm các loại trà xanh Nhật Bản nổi tiếng như Matcha, Sencha, Gyokuro',
        'active',
        '2ee46f6b-fb8a-40fd-9bb0-7f9e6b553960'
    ),
    (
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        'Trà xanh Trung Quốc',
        'Danh mục bao gồm các loại trà xanh Trung Quốc nổi tiếng như Long Tỉnh, Bi Luo Chun, Tie Guan Yin',
        'active',
        '2ee46f6b-fb8a-40fd-9bb0-7f9e6b553960'
    ),
    (
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        'Trà xanh Việt Nam',
        'Danh mục bao gồm các loại trà xanh Việt Nam nổi tiếng như Thái Nguyên, Lục An, Mộc Châu',
        'active',
        '2ee46f6b-fb8a-40fd-9bb0-7f9e6b553960'
    );

-- Thêm dữ liệu cho category con của Nước uống
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'Nước trái cây',
        'Danh mục bao gồm các loại nước ép cam, nước ép táo, nước ép cà rốt và nước ép dưa hấu, v.v...',
        'active',
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        'b61683f9-a0ad-428c-b160-07fddc938636',
        'Sinh tố',
        'Danh mục bao gồm các loại sinh tố trái cây, sinh tố rau củ, sinh tố mix và sinh tố kem',
        'active',
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        '95cc94e4-0f34-448d-92c8-a416b930b3e3',
        'Soda',
        'Danh mục bao gồm các loại soda truyền thống, soda ít đường, soda vị trái cây và soda mix',
        'active',
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85',
        'Nước đóng chai',
        'Danh mục bao gồm các loại nước lọc, nước khoáng, nước có ga và nước trái cây đóng chai',
        'active',
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        '50ab2d67-1a2f-4487-99d2-e1e4c73570ff',
        'Cacao',
        'Danh mục bao gồm các loại cacao nguyên hạt, cacao bột, cacao nóng và cacao đá',
        'active',
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    );

-- Thêm dữ liệu cho category con của Sinh tố
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'Sinh tố trái cây',
        'Danh mục bao gồm các loại sinh tố trái cây tươi ngon như sinh tố chuối, sinh tố xoài, sinh tố dâu tây,...',
        'active',
        'b61683f9-a0ad-428c-b160-07fddc938636'
    ),
    (
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'Sinh tố rau củ',
        'Danh mục bao gồm các loại sinh tố rau củ tốt cho sức khỏe như sinh tố cà rốt, sinh tố cải bó xôi, sinh tố cần tây,...',
        'active',
        'b61683f9-a0ad-428c-b160-07fddc938636'
    ),
    (
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'Sinh tố mix',
        'Danh mục bao gồm các loại sinh tố mix độc đáo, kết hợp nhiều loại trái cây và rau củ',
        'active',
        'b61683f9-a0ad-428c-b160-07fddc938636'
    ),
    (
        'c9448e95-742f-47f5-a271-d53231cac229',
        'Sinh tố kem',
        'Danh mục bao gồm các loại sinh tố kem béo ngậy, mát lạnh',
        'active',
        'b61683f9-a0ad-428c-b160-07fddc938636'
    );

-- Thêm dữ liệu cho category con của Soda
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        'Soda truyền thống',
        'Danh mục bao gồm các loại soda truyền thống như Coca-Cola, Pepsi, 7 Up,...',
        'active',
        '95cc94e4-0f34-448d-92c8-a416b930b3e3'
    ),
    (
        'be221545-9a44-403f-a559-7943fa962e52',
        'Soda ít đường',
        'Danh mục bao gồm các loại soda ít đường, tốt cho sức khỏe',
        'active',
        '95cc94e4-0f34-448d-92c8-a416b930b3e3'
    ),
    (
        '136ea003-f99a-4420-bb90-722f4e345968',
        'Soda vị trái cây',
        'Danh mục bao gồm các loại soda vị trái cây thơm ngon, thanh mát',
        'active',
        '95cc94e4-0f34-448d-92c8-a416b930b3e3'
    ),
    (
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        'Soda mix',
        'Danh mục bao gồm các loại soda mix độc đáo, kết hợp nhiều hương vị',
        'active',
        '95cc94e4-0f34-448d-92c8-a416b930b3e3'
    );

-- Thêm dữ liệu cho category con của Nước đóng chai
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        'Nước lọc',
        'Danh mục bao gồm các loại nước lọc tinh khiết, tốt cho sức khỏe',
        'active',
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    ),
    (
        'f19d6070-da31-477b-82d5-86d653ea087b',
        'Nước khoáng',
        'Danh mục bao gồm các loại nước khoáng tự nhiên, giàu khoáng chất',
        'active',
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    ),
    (
        '29f72015-c90e-4d24-8257-c63879da457f',
        'Nước có ga',
        'Danh mục bao gồm các loại nước có ga, sảng khoái',
        'active',
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    ),
    (
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        'Nước trái cây đóng chai',
        'Danh mục bao gồm các loại nước trái cây đóng chai thơm ngon, bổ dưỡng',
        'active',
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    );

-- Thêm dữ liệu cho category con của Cacao
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        'Cacao nóng',
        'Danh mục bao gồm các loại cacao nóng thơm ngon, bổ dưỡng',
        'active',
        '50ab2d67-1a2f-4487-99d2-e1e4c73570ff'
    ),
    (
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        'Cacao đá',
        'Danh mục bao gồm các loại cacao đá mát lạnh, sảng khoái',
        'active',
        '50ab2d67-1a2f-4487-99d2-e1e4c73570ff'
    );

-- Thêm dữ liệu cho category con của Trà sữa
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'a17f5e01-b9e2-4e97-b035-c610b66774d9',
        'Trà sữa truyền thống',
        'Danh mục bao gồm các loại trà sữa truyền thống được pha chế từ trà nguyên chất và sữa tươi, mang đến hương vị thơm ngon, béo ngậy, thanh mát, phù hợp với mọi khẩu vị',
        'active',
        '63db5737-708c-446f-a07e-b90faf288180'
    ),
    (
        'ac92dbcd-8983-44e0-a3cd-48a657aa396e',
        'Trà sữa kem cheese',
        'Danh mục bao gồm các loại trà sữa kết hợp với lớp kem cheese béo ngậy, tạo nên hương vị độc đáo, hấp dẫn',
        'active',
        '63db5737-708c-446f-a07e-b90faf288180'
    ),
    (
        'c228a39b-0db7-4cf4-8a12-0cc53d310984',
        'Trà sữa trân châu',
        'Danh mục bao gồm các loại trà sữa kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn',
        'active',
        '63db5737-708c-446f-a07e-b90faf288180'
    ),
    (
        '804becca-9abf-4c31-9517-6155b59c95f8',
        'Trà sữa pudding',
        'Danh mục bao gồm các loại trà sữa kết hợp với pudding mềm mịn, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        '63db5737-708c-446f-a07e-b90faf288180'
    ),
    (
        '47963ba3-1273-46de-b811-7bbee414d36e',
        'Trà sữa macchiato',
        'Danh mục bao gồm các loại trà sữa kết hợp với lớp kem sữa béo ngậy, tạo nên hương vị thơm ngon, béo ngậy, hấp dẫn',
        'active',
        '63db5737-708c-446f-a07e-b90faf288180'
    );

-- Thêm dữ liệu cho category con của Trà sữa truyền thống
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        'Trà sữa matcha',
        'Thức uống kết hợp giữa trà matcha nguyên chất và sữa tươi, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        'a17f5e01-b9e2-4e97-b035-c610b66774d9'
    ),
    (
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        'Trà sữa sencha',
        'Thức uống kết hợp giữa trà sencha nguyên chất và sữa tươi, tạo nên hương vị thơm ngon, thanh mát, dễ uống',
        'active',
        'a17f5e01-b9e2-4e97-b035-c610b66774d9'
    ),
    (
        'e911945f-5307-4474-beea-65343027b760',
        'Trà sữa genmaicha',
        'Thức uống kết hợp giữa trà genmaicha nguyên chất và sữa tươi, tạo nên hương vị thơm ngon, độc đáo, pha chút vị rang bùi',
        'active',
        'a17f5e01-b9e2-4e97-b035-c610b66774d9'
    );

-- Thêm dữ liệu cho category con của Trà sữa kem cheese
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        'Trà sữa matcha kem cheese',
        'Thức uống kết hợp giữa trà sữa matcha nguyên chất và lớp kem cheese béo ngậy, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        'ac92dbcd-8983-44e0-a3cd-48a657aa396e'
    ),
    (
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        'Trà sữa sencha kem cheese',
        'Thức uống kết hợp giữa trà sữa sencha nguyên chất và lớp kem cheese béo ngậy, tạo nên hương vị thơm ngon, thanh mát, dễ uống',
        'active',
        'ac92dbcd-8983-44e0-a3cd-48a657aa396e'
    ),
    (
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        'Trà sữa genmaicha kem cheese',
        'Thức uống kết hợp giữa trà sữa genmaicha nguyên chất và lớp kem cheese béo ngậy, tạo nên hương vị thơm ngon, độc đáo, pha chút vị rang bùi',
        'active',
        'ac92dbcd-8983-44e0-a3cd-48a657aa396e'
    );

-- Thêm dữ liệu cho category con của Trà sữa trân châu
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        '1cde07aa-8807-4286-a460-73b140e01378',
        'Trà sữa matcha trân châu',
        'Thức uống kết hợp giữa trà sữa matcha nguyên chất, trân châu đen dai dai và kem cheese béo ngậy, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        'c228a39b-0db7-4cf4-8a12-0cc53d310984'
    ),
    (
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        'Trà sữa sencha trân châu',
        'Thức uống kết hợp giữa trà sữa sencha nguyên chất, trân châu trắng dai dai và kem cheese béo ngậy, tạo nên hương vị thơm ngon, thanh mát, dễ uống',
        'active',
        'c228a39b-0db7-4cf4-8a12-0cc53d310984'
    ),
    (
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        'Trà sữa genmaicha trân châu',
        'Thức uống kết hợp giữa trà sữa genmaicha nguyên chất, trân châu hoàng kim dai dai và kem cheese béo ngậy, tạo nên hương vị thơm ngon, độc đáo, pha chút vị rang bùi',
        'active',
        'c228a39b-0db7-4cf4-8a12-0cc53d310984'
    );

-- Thêm dữ liệu cho category con của Trà sữa pudding
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        'Trà sữa matcha pudding',
        'Thức uống kết hợp giữa trà sữa matcha nguyên chất, pudding trà xanh mềm mịn và kem cheese béo ngậy, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        '804becca-9abf-4c31-9517-6155b59c95f8'
    ),
    (
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        'Trà sữa sencha pudding',
        'Thức uống kết hợp giữa trà sữa sencha nguyên chất, pudding caramel mềm mịn và kem cheese béo ngậy, tạo nên hương vị thơm ngon, thanh mát, dễ uống',
        'active',
        '804becca-9abf-4c31-9517-6155b59c95f8'
    ),
    (
        '891885a8-44ee-43ab-bde6-15bd170642db',
        'Trà sữa genmaicha pudding',
        'Thức uống kết hợp giữa trà sữa genmaicha nguyên chất, pudding socola mềm mịn và kem cheese béo ngậy, tạo nên hương vị thơm ngon, độc đáo, pha chút vị rang bùi',
        'active',
        '804becca-9abf-4c31-9517-6155b59c95f8'
    );

-- Thêm dữ liệu cho category con của Trà sữa macchiato
INSERT INTO
    `categories` (id, name, description, is_active, parent_id)
VALUES
    (
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        'Trà sữa matcha macchiato',
        'Thức uống kết hợp giữa trà sữa matcha nguyên chất và lớp kem sữa béo ngậy, tạo nên hương vị thơm ngon, béo ngậy, thanh mát',
        'active',
        '47963ba3-1273-46de-b811-7bbee414d36e'
    ),
    (
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        'Trà sữa sencha macchiato',
        'Thức uống kết hợp giữa trà sữa sencha nguyên chất và lớp kem sữa béo ngậy, tạo nên hương vị thơm ngon, thanh mát, dễ uống',
        'active',
        '47963ba3-1273-46de-b811-7bbee414d36e'
    ),
    (
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        'Trà sữa genmaicha macchiato',
        'Thức uống kết hợp giữa trà sữa genmaicha nguyên chất và lớp kem sữa béo ngậy, tạo nên hương vị thơm ngon, độc đáo, pha chút vị rang bùi',
        'active',
        '47963ba3-1273-46de-b811-7bbee414d36e'
    );

-- Thêm dữ liệu bảng product_params cho danh mục Cà phê
INSERT INTO
    `product_params` (id, name, capacity, category_id)
VALUES
    (
        '93276473-10f1-49cf-b0b1-6a9f6f1d326f',
        'Size S',
        300,
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89'
    ),
    (
        '927d5060-e1b9-4c87-a434-ed64216def0a',
        'Size M',
        300,
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89'
    ),
    (
        '6e6084f2-3284-4784-8a51-871aa20958ac',
        'Size L',
        300,
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89'
    ),
    (
        'da2d8154-b06e-4eab-b89f-b6f2432c1fa9',
        'Size S',
        300,
        '3b501701-f604-4f7e-b715-c8bce156f58c'
    ),
    (
        '306933d8-d874-4dd7-b4f8-bbe149262e86',
        'Size M',
        300,
        '3b501701-f604-4f7e-b715-c8bce156f58c'
    ),
    (
        '20b98cda-7778-4f2b-b6bf-b422b6d88675',
        'Size L',
        300,
        '3b501701-f604-4f7e-b715-c8bce156f58c'
    );

-- Thêm dữ liệu bảng product_params cho danh mục Trà
INSERT INTO
    `product_params` (id, name, capacity, category_id)
VALUES
    (
        '68f73da9-4589-4bf9-8498-4e96fbcc1bf2',
        'Size S',
        500,
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    ),
    (
        '81870563-9fa4-4764-a32c-abc78302c4d3',
        'Size M',
        600,
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    ),
    (
        '33e10f84-bc04-43e5-86b8-fb9796003428',
        'Size L',
        700,
        '5ed76767-a32d-49d9-bfb8-7ba6224f56a0'
    );

-- Thêm dữ liệu bảng product_params cho danh mục Nước uống
INSERT INTO
    `product_params` (id, name, capacity, category_id)
VALUES
    (
        '89457711-4d83-4e3f-be90-a6c91442c418',
        'Size S',
        500,
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        '9631602c-f6c7-49c5-a32f-3b124086d565',
        'Size M',
        600,
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8',
        'Size L',
        700,
        '6ff432f2-5c00-4b1e-ba43-ffbedc4e74ce'
    ),
    (
        '5a106bae-588d-49e7-a686-6de67f2e3054',
        '350ml',
        350,
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    ),
    (
        '8c3bdbdc-5c87-4858-ba08-813f4fbebd85',
        '500ml',
        500,
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    ),
    (
        '9df40741-0c78-4c11-8b78-73a0709bbea5',
        '1.5L',
        1500,
        '1a5d6bcb-0c5d-4399-911e-bf3922848d85'
    );

-- Thêm dữ liệu bảng product_params cho danh mục Trà sữa
INSERT INTO
    `product_params` (id, name, capacity, category_id)
VALUES
    (
        '8d3d4e05-e7b9-4ab1-863c-9223811fa69b',
        'Size M',
        500,
        '63db5737-708c-446f-a07e-b90faf288180'
    ),
    (
        '2849b1bb-63cd-4280-8496-a94afd87e461',
        'Size L',
        700,
        '63db5737-708c-446f-a07e-b90faf288180'
    );

-- Thêm sản phầm cho Cà phê pha máy
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'fd4f270c-f694-4394-ac24-4010294994b4',
        'Espresso',
        'Cà phê nguyên chất rang đậm, pha bằng máy espresso',
        25000,
        'Sữa tươi,Đường,Bọt sữa',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        'cfdfbaf5-ce1f-4a82-9417-1e1d881f03b8',
        'Americano',
        'Espresso pha loãng với nước nóng',
        20000,
        'Sữa tươi,Đường,Bọt sữa',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        '36691873-a7cb-4894-9b66-335f1ec1f361',
        'Cappuccino',
        'Espresso kết hợp với sữa tươi và bọt sữa',
        30000,
        'Sữa tươi,Đường,Bọt sữa,Sô cô la',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        'a290179a-c36c-4750-b39c-365a3fee97a4',
        'Latte',
        'Espresso kết hợp với sữa tươi',
        28000,
        'Sữa tươi,Đường,Bọt sữa,Sô cô la',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        '56a712f5-1b9a-4337-9d65-61aab3f59a36',
        'Mocha',
        'Espresso kết hợp với sữa tươi, sô cô la và bọt sữa',
        32000,
        'Sữa tươi,Đường,Bọt sữa,Sô cô la',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        '548febaf-22fe-49d3-b6b1-69f388ab5fbf',
        'Macchiato',
        'Espresso phủ một lớp bọt sữa mỏng',
        22000,
        'Sữa tươi,Đường,Bọt sữa',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        '571d8134-6840-4e8d-b016-ea00250aaa1a',
        'Cold Brew',
        'Cà phê pha bằng nước lạnh trong thời gian dài',
        25000,
        'Sữa tươi,Đường,Bọt sữa',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    ),
    (
        '41c10930-59f8-43b1-a508-132180c1563c',
        'Nitro Cold Brew',
        'Cold Brew pha với khí nitơ tạo bọt mịn',
        30000,
        'Sữa tươi,Đường',
        'active',
        'e6c0aca9-83f2-4f68-aa6f-408a818ade89',
        '927d5060-e1b9-4c87-a434-ed64216def0a'
    );

-- Thêm sản phầm cho Cà phê phin
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'dce65f9e-63f0-4aa4-8fab-21247ed23b4f',
        'Cà phê đen',
        'Cà phê nguyên chất pha bằng phin với nước nóng',
        15000,
        'Sữa tươi,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        '79b89802-37e7-49af-a1d9-1a68700414c7',
        'Cà phê sữa',
        'Cà phê đen pha với sữa tươi',
        18000,
        'Sữa tươi,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        '6d34aacb-4267-47b0-b39d-e827ec5883a4',
        'Cà phê đá',
        'Cà phê đen pha với đá',
        15000,
        'Sữa tươi,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        'f014e7df-bd0b-4ac1-88ee-901a2f0e23e1',
        'Cà phê cốt dừa',
        'Cà phê đen pha với sữa dừa',
        20000,
        'Sữa dừa,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        'ccfe3404-6215-4bc6-8c39-f1e4f20aed4a',
        'Bạc xỉu',
        'Cà phê đen pha với trứng và sữa đặc',
        22000,
        'Trứng,Sữa đặc',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        'e5a97f50-7859-41ee-9327-5a10f0b9770d',
        'Cà phê bọt',
        'Cà phê đen pha với bọt sữa',
        20000,
        'Sữa tươi,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        '20a0ae25-8f13-4c89-8448-f0993bcc6d8b',
        'Cà phê muối',
        'Cà phê đen pha với muối',
        16000,
        'Muối',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        '8af584db-b69a-42d7-b365-22127d8f8d6e',
        'Cà phê chanh',
        'Cà phê đen pha với nước cốt chanh',
        17000,
        'Chanh,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        'e6bec0d7-9cd7-46fb-9a52-c467259500e7',
        'Cà phê dừa',
        'Cà phê đen pha với nước cốt dừa',
        20000,
        'Sữa dừa,Đường',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    ),
    (
        '16b81da9-b866-4a99-8484-af8f82f090ab',
        'Cà phê cacao',
        'Cà phê đen pha với bột cacao',
        18000,
        'Sữa tươi,Đường,Bột cacao',
        'active',
        '3b501701-f604-4f7e-b715-c8bce156f58c',
        '306933d8-d874-4dd7-b4f8-bbe149262e86'
    );

-- Thêm sản phầm cho Trà xanh Nhật Bản
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '911e8d6e-11c5-4db2-b1c6-2af78b246f14',
        'Matcha',
        'Trà xanh được nghiền mịn từ lá trà xanh non, có hương vị thơm ngon, béo ngậy.',
        30000,
        'Sữa tươi,Chanh,Đường',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '166a805e-6cf3-4a54-94f9-fa2ef7450711',
        'Sencha',
        'Loại trà xanh phổ biến nhất Nhật Bản, có hương vị thanh mát, dễ uống.',
        25000,
        'Chanh,Đường',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'ae04add7-036e-40cf-95d3-ac2b4a0f908d',
        'Gyokuro',
        'Loại trà xanh cao cấp nhất Nhật Bản, được trồng che bóng, có hương vị đậm đà, tinh tế.',
        50000,
        '',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '578de8ad-af31-48b0-aad5-a9889169b89e',
        'Genmaicha',
        'Trà xanh pha trộn với gạo lứt rang, có hương vị thơm bùi, đặc trưng.',
        20000,
        'Chanh,Đường',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '274bd4bf-dfb3-46fa-8cb5-4042a0b92d66',
        'Kukicha',
        'Trà xanh được làm từ cành và thân cây trà, có hương vị nhẹ nhàng, thanh tao.',
        22000,
        'Chanh,Đường',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '5c5b2811-86c1-4ec6-98f7-66c3b2c9f78a',
        'Hojicha',
        'Trà xanh rang cháy, có hương vị đậm đà, ấm áp.',
        28000,
        '',
        'active',
        'fc99bf4d-54be-4e21-a648-07375fa14a22',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Trà xanh Trung Quốc
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '909ffd75-1a9a-4430-8e6e-ff4f925bfcd4',
        'Long Tỉnh',
        'Trà xanh được thu hoạch từ vùng núi Long Tỉnh, có hương vị thanh tao, tinh tế.',
        35000,
        'Chanh,Đường',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '6e19db01-e359-4a17-bc8b-9df47803bb63',
        'Bi Luo Chun',
        'Trà xanh được làm từ những búp non hình xoắn ốc, có hương vị thơm ngon, ngọt ngào.',
        40000,
        'Chanh,Đường',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '82177e34-d9bf-4726-bd89-a4715520e0de',
        'Tie Guan Yin',
        'Loại trà xanh ô long nổi tiếng nhất Trung Quốc, có hương vị đậm đà, hậu ngọt.',
        50000,
        '',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '4780ddb0-0b6f-42b3-be5d-0476f6fa50ed',
        'Mao Feng',
        'Trà xanh được làm từ những búp non phủ lông tơ, có hương vị thanh mát, dễ uống.',
        30000,
        'Chanh,Đường',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'b6a1f705-8b56-4190-b99f-5196970ded73',
        'Dong Ding',
        'Loại trà xanh được trồng trên núi cao, có hương vị đậm đà, mạnh mẽ.',
        45000,
        '',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '9b074137-8f09-42c9-a38a-773c359c1200',
        'Longjing Cha',
        'Loại trà xanh được làm từ những búp non hái vào mùa xuân, có hương vị thanh tao, tinh tế.',
        38000,
        'Chanh,Đường',
        'active',
        '4fefc62c-9151-46d2-a2d4-717ea140de7b',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Trà xanh Việt Nam
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '2e19c8de-ce03-4edd-b8db-e173b079c675',
        'Thái Nguyên',
        'Trà xanh được thu hoạch từ vùng núi Thái Nguyên, có hương vị đậm đà, hậu ngọt.',
        25000,
        'Chanh,Đường',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '310e6167-3c55-4fbe-ba87-3b063cc5b885',
        'Lục An',
        'Loại trà xanh được trồng trên núi Lục An, có hương vị thanh tao, tinh tế.',
        30000,
        'Chanh,Đường',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '9aba8ac8-d45c-4e01-8208-0645b3b00d49',
        'Mộc Châu',
        'Trà xanh được trồng trên cao nguyên Mộc Châu, có hương vị thơm ngon, dễ uống.',
        22000,
        'Chanh,Đường',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '3db6c395-2f86-469c-9432-d94da7395a7d',
        'Tà Xùa',
        'Loại trà xanh được trồng trên núi Tà Xùa, có hương vị mạnh mẽ, đậm đà.',
        35000,
        '',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'f0399b53-d343-4831-bba1-6fd0ce6dd64c',
        'Bình Long',
        'Trà xanh được trồng tại Bình Long, có hương vị thanh mát, dễ chịu.',
        20000,
        'Chanh,Đường',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'fff2a301-c685-4d7d-b6c1-2985cc1b7d64',
        'Hồ Xâm',
        'Loại trà xanh được trồng tại Hồ Xâm, có hương vị đặc trưng, độc đáo.',
        28000,
        '',
        'active',
        '2040ce20-f792-4477-9ff8-756f0c34089f',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Trà đen
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '1a9a924a-f89f-4614-85c1-f470c93f590a',
        'Trà đen Assam',
        'Loại trà đen có hương vị mạnh mẽ, đậm đà, được trồng ở vùng Assam, Ấn Độ.',
        25000,
        'Sữa tươi,Chanh,Đường',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '10fd2e20-4ae4-4879-9b14-3a76b947ae5d',
        'Trà đen Darjeeling',
        'Loại trà đen có hương vị thanh tao, tinh tế, được trồng ở vùng Darjeeling, Ấn Độ.',
        30000,
        'Chanh,Đường',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '68cb4e53-8eb7-457e-b463-f9390bc552ca',
        'Trà đen Ceylon',
        'Loại trà đen có hương vị thơm ngon, dễ uống, được trồng ở Sri Lanka.',
        28000,
        'Sữa tươi,Chanh,Đường',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '63e6f700-b1bd-458f-bfcb-0381252c28d5',
        'Trà đen Lapsang Souchong',
        'Loại trà đen có hương vị khói đặc trưng, được hun khói bằng gỗ thông, được trồng ở Trung Quốc.',
        35000,
        '',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'eb5b6272-127f-4fcc-9e07-da16f9539925',
        'Trà đen Earl Grey',
        'Loại trà đen được pha trộn với tinh dầu cam bergamot, có hương vị thơm mát, dễ chịu.',
        27000,
        'Sữa tươi,Chanh,Đường',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'f15dd04e-4d3f-4bb9-813d-163f6d40b30b',
        'Trà đen Russian Caravan',
        'Loại trà đen được pha trộn với các loại gia vị như đinh hương, quế, vani, có hương vị ấm áp, đậm đà.',
        32000,
        '',
        'active',
        '83eeee18-0b1e-4ba8-8fea-6686f6dd1c78',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Trà thảo mộc
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'ab73f20f-24ba-4b1c-b11b-cc72dfcc9e2c',
        'Trà hoa cúc',
        'Loại trà có hương vị thanh mát, dịu nhẹ, giúp thư giãn và giải tỏa căng thẳng.',
        20000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'a424c29a-e6c7-434b-8089-e56cf9dab93a',
        'Trà hoa hồng',
        'Loại trà có hương vị thơm ngon, ngọt ngào, giúp cải thiện tâm trạng và làm đẹp da.',
        25000,
        'Mật ong,Sữa tươi',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '2f298d5f-2f4b-4809-8f0c-75ca5be859ad',
        'Trà bạc hà',
        'Loại trà có hương vị the mát, giúp tiêu hóa tốt và giảm cân.',
        18000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'b12c049b-fa5b-430d-bd18-df97a858c85c',
        'Trà gừng',
        'Loại trà có hương vị cay nồng, giúp giữ ấm cơ thể và trị ho cảm.',
        15000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '0a191a7e-a07f-42e4-8619-faa22cd05ebd',
        'Trà sả',
        'Loại trà có hương vị thơm nồng, giúp thanh lọc cơ thể và giảm mỡ bụng.',
        22000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '4abde69f-4590-461a-828a-5d6c49de3ea1',
        'Trà Atiso',
        'Loại trà có hương vị thanh mát, giúp giải độc gan và bảo vệ sức khỏe.',
        28000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '6a09797a-6708-4a5a-8dbc-02b7b24cd793',
        'Trà La Mã',
        'Loại trà có hương vị thơm ngon, giúp an thần và cải thiện giấc ngủ.',
        24000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '6aa52c87-98bf-4f14-ac86-5021001bcea2',
        'Trà Dứa Dại',
        'Loại trà có hương vị thanh mát, giúp giảm mỡ máu và tăng cường hệ miễn dịch.',
        26000,
        'Mật ong,Chanh',
        'active',
        '691ab302-d7da-48ce-b026-8fcce1945b20',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Trà trái cây
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '6e21b7d8-408f-4923-b0c3-d88b19357e66',
        'Trà đào',
        'Loại trà có hương vị thơm ngon, ngọt ngào, được pha chế từ trà xanh và đào tươi.',
        25000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'f406f232-6e16-4cb0-a013-b92caa25da21',
        'Trà dâu tây',
        'Loại trà có hương vị chua ngọt, thanh mát, được pha chế từ trà xanh và dâu tây tươi.',
        27000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'd1c9d132-0559-404f-ad18-9da88461cfb4',
        'Trà chanh dây',
        'Loại trà có hương vị chua thanh, giải nhiệt, được pha chế từ trà xanh và chanh dây tươi.',
        22000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'f0d9f928-9ae0-4a3b-a2e7-f60b47ee1377',
        'Trà việt quất',
        'Loại trà có hương vị thơm ngon, giàu vitamin C, được pha chế từ trà xanh và việt quất tươi.',
        30000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '58de6654-c253-49e1-8a05-d45c6d04a616',
        'Trà vải',
        'Loại trà có hương vị ngọt thanh, thơm mát, được pha chế từ trà xanh và vải tươi.',
        24000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '6f7a8c4b-e8d9-4a2d-a080-c2f0624dfcae',
        'Trà táo',
        'Loại trà có hương vị thanh mát, dễ uống, được pha chế từ trà xanh và táo tươi.',
        20000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '5f717faa-ff81-4e19-bd8f-78a681b4d189',
        'Trà dứa',
        'Loại trà có hương vị thơm ngon, ngọt ngào, được pha chế từ trà xanh và dứa tươi.',
        23000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        'e35f197d-888e-43e4-8eb0-3d68b28626f4',
        'Trà ổi',
        'Loại trà có hương vị chua ngọt, giải nhiệt, được pha chế từ trà xanh và ổi tươi.',
        18000,
        'Trân châu,Thạch dừa,Sữa tươi',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    ),
    (
        '34ea0b48-f04e-4512-bd3f-9acf135c84e4',
        'Trà mận',
        'Loại trà có hương vị chua thanh, thơm ngon, được pha chế từ trà xanh và mận tươi.',
        22000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        'd7271f1d-6357-4650-844a-4d07f8afc0de',
        '33e10f84-bc04-43e5-86b8-fb9796003428'
    );

-- Thêm sản phầm cho Nước trái cây
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '5f838da7-8c69-4327-893f-5f12a25354cc',
        'Nước ép cam',
        'Loại nước ép có hương vị chua ngọt, thanh mát, giàu vitamin C.',
        20000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '1e54e36c-3954-4412-9d9f-6b41edacdea3',
        'Nước ép táo',
        'Loại nước ép có hương vị ngọt thanh, thơm ngon, giàu vitamin A.',
        25000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '7ef38678-5874-4f5c-992c-1a39aebb2fa5',
        'Nước ép cà rốt',
        'Loại nước ép có hương vị ngọt nhẹ, thanh mát, tốt cho mắt và hệ tiêu hóa.',
        20000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'eccab4bd-70a2-40a8-9ade-f27ce961bd8d',
        'Nước ép dưa hấu',
        'Loại nước ép có hương vị ngọt thanh, mát lạnh, giúp giải nhiệt và thanh lọc cơ thể.',
        20000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'f61db945-0fde-432b-b03e-33db9940ebc2',
        'Nước ép ổi',
        'Loại nước ép có hương vị chua ngọt, thanh mát, giàu vitamin C và chất xơ.',
        22000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '4a6547aa-803d-4cb0-b682-1304da3579d7',
        'Nước ép xoài',
        'Loại nước ép có hương vị thơm ngon, ngọt ngào, giàu vitamin A và E.',
        28000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '4e80797b-aa71-40b3-968c-5b20c17dd9d8',
        'Nước ép dứa',
        'Loại nước ép có hương vị chua ngọt, thanh mát, giúp tiêu hóa tốt và tăng cường hệ miễn dịch.',
        25000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'f9440081-9721-47de-8be5-c23dcb24fc5a',
        'Nước ép bưởi',
        'Loại nước ép có hương vị chua thanh, giúp giảm cân và đẹp da.',
        24000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '3af26f90-44c5-4073-9bf6-c719a5970fe9',
        'Nước ép cóc',
        'Loại nước ép có hương vị chua ngọt, thanh mát, giúp giải nhiệt và thanh lọc cơ thể.',
        20000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '06c4326c-5a79-4c59-b9aa-fc30147a098a',
        'Nước ép nho',
        'Loại nước ép có hương vị ngọt thanh, thơm ngon, giàu vitamin A, C và E.',
        27000,
        null,
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '1d1e759f-df1f-4583-bebc-a6fe283ede38',
        'Nước ép dâu tây',
        'Loại nước ép có hương vị chua ngọt, thanh mát, giàu vitamin C và chất chống oxy hóa.',
        25000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        '804d2d6f-fb04-4129-a400-7f48e6828bf3',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    );

-- Thêm sản phầm cho Sinh tố trái cây
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '0f08b518-bec5-4bbc-9882-a2e03c5b4aa3',
        'Sinh tố chuối',
        'Loại sinh tố có hương vị thơm ngon, béo ngậy, cung cấp nhiều năng lượng.',
        30000,
        'Trân châu,Thạch dừa',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '53556a11-c77a-4090-9de7-ea53c066c5b1',
        'Sinh tố xoài',
        'Loại sinh tố có hương vị thơm ngon, ngọt ngào, giàu vitamin A và C.',
        35000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'af60eb1b-dce5-41c6-825d-22896b0166cc',
        'Sinh tố dâu tây',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giàu vitamin C và chất chống oxy hóa.',
        32000,
        'Trân châu,Thạch dừa,Sữa chua',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'fa3c5fef-5d75-403c-8835-bd5daad039b1',
        'Sinh tố ổi',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giàu vitamin C và chất xơ.',
        28000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'b2cd920c-c7b3-4050-8ac7-f2e5ae998f3c',
        'Sinh tố bưởi',
        'Loại sinh tố có hương vị chua thanh, giúp giảm cân và đẹp da.',
        30000,
        'Trân châu,Thạch dừa',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '69bf761c-474c-40bf-b3a6-d6f95e4ff60e',
        'Sinh tố dưa hấu',
        'Loại sinh tố có hương vị ngọt thanh, mát lạnh, giúp giải nhiệt và thanh lọc cơ thể.',
        25000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'b40bac4f-7536-4c8e-96b2-e44b952cb7ef',
        'Sinh tố dứa',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giúp tiêu hóa tốt và tăng cường hệ miễn dịch.',
        32000,
        'Trân châu,Thạch dừa',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'e4b7ed93-921b-4b1b-bbcf-e777f9694e5c',
        'Sinh tố ổi hồng',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giàu vitamin C và chất chống oxy hóa.',
        28000,
        'Trân châu,Thạch dừa,Mật ong',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '19ffbace-f0c6-4c5b-bc9a-d0eb9546ebb7',
        'Sinh tố kiwi',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giàu vitamin C và E.',
        35000,
        'Trân châu,Thạch dừa,Sữa chua,Mật ong',
        'active',
        'd5ce910e-1a8f-43cd-8327-45cbc976f6b1',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    );

-- Thêm sản phầm cho Sinh tố rau củ
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '6eb5cdb0-a1ce-4d46-b53f-da82e02164fb',
        'Sinh tố cà rốt',
        'Loại sinh tố có hương vị ngọt nhẹ, thanh mát, tốt cho mắt và hệ tiêu hóa.',
        25000,
        'Mật ong,Sữa chua',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '21367d1c-39c5-4ae5-a2c7-49a678578b8c',
        'Sinh tố cải bó xôi',
        'Loại sinh tố có hương vị thơm ngon, bổ dưỡng, giàu vitamin A, C và K.',
        30000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '7c4a9fd1-aac9-4ef3-ba39-2e61f02344c2',
        'Sinh tố cần tây',
        'Loại sinh tố có hương vị thanh mát, giúp giảm cân và thanh lọc cơ thể.',
        28000,
        'Mật ong,Chanh tươi',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '37c47a8d-081e-414c-8361-c673570a5b0d',
        'Sinh tố dưa leo',
        'Loại sinh tố có hương vị thanh mát, giúp giải nhiệt và cấp nước cho cơ thể.',
        25000,
        'Mật ong,Chanh tươi,Lá bạc hà',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'f18da846-4635-4c71-9d48-bc942ecfca6b',
        'Sinh tố bí đao',
        'Loại sinh tố có hương vị thanh mát, giúp giảm cân và đẹp da.',
        28000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '66c8ffa4-c7b8-4e58-b163-fb1a775d8cbe',
        'Sinh tố cà chua',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, giàu vitamin A, C và lycopene.',
        25000,
        'Mật ong,Chanh tươi,Lá húng quế',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'b907c6d1-e2e6-4d8c-907b-1283028fcbea',
        'Sinh tố củ dền',
        'Loại sinh tố có hương vị ngọt nhẹ, thanh mát, giúp tăng cường hệ miễn dịch và sức khỏe tim mạch.',
        32000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'c24f0551-25cd-4941-9572-a5a4ba402bfc',
        'Sinh tố bông cải xanh',
        'Loại sinh tố có hương vị thơm ngon, bổ dưỡng, giàu vitamin A, C và K.',
        35000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'e531a7ab-4025-4315-984e-c785f1036a10',
        'Sinh tố măng tây',
        'Loại sinh tố có hương vị thanh mát, giúp giảm cân và thanh lọc cơ thể.',
        28000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        'a2267814-bf2c-4ac8-b443-48869c221629',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    );

-- Thêm sản phầm cho Sinh tố mix
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '2bcdc0ef-29cd-432d-b754-82868cab1b94',
        'Sinh tố mix trái cây nhiệt đới',
        'Loại sinh tố có hương vị chua ngọt, thơm ngon, kết hợp xoài, dứa, chuối,...',
        35000,
        'Trân châu,Thạch dừa',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '003b5051-309a-4c75-aa21-227c1714102f',
        'Sinh tố mix berry',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, kết hợp việt quất, dâu tây, mâm xôi,...',
        38000,
        'Trân châu,Thạch dừa,Sữa chua',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '9043aac4-b8bf-4b15-9a4d-9518db57b0b3',
        'Sinh tố mix rau củ detox',
        'Loại sinh tố có hương vị thanh mát, giúp giải độc cơ thể, kết hợp cần tây, dưa leo, táo xanh,...',
        32000,
        'Mật ong,Chanh tươi',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '45fbd308-028d-4a3b-a3b7-8ad48c431c11',
        'Sinh tố mix tăng cường miễn dịch',
        'Loại sinh tố có hương vị thơm ngon, bổ dưỡng, giúp tăng cường hệ miễn dịch, kết hợp kiwi, cam, bông cải xanh,...',
        40000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'c6b2e1ce-c75b-486b-928c-693725cfe29c',
        'Sinh tố mix đẹp da',
        'Loại sinh tố có hương vị thanh mát, giúp đẹp da và chống lão hóa, kết hợp dâu tây, việt quất, dưa hấu,...',
        35000,
        'Mật ong,Sữa chua,Hạt chia',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '166ceea9-fd4c-4884-98a9-b6c0422ce1c0',
        'Sinh tố mix giảm cân',
        'Loại sinh tố có hương vị thanh mát, giúp giảm cân và thanh lọc cơ thể, kết hợp cần tây, dưa leo, bưởi,...',
        30000,
        'Mật ong,Chanh tươi',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '16af39f9-5539-4d0a-b995-cff53408ac96',
        'Sinh tố mix năng lượng',
        'Loại sinh tố có hương vị thơm ngon, bổ dưỡng, cung cấp nhiều năng lượng, kết hợp chuối, bơ, sữa chua,...',
        38000,
        'Trân châu,Thạch dừa,Hạt chia',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '93c3cab0-c65b-4959-80b6-23d2b7305ce3',
        'Sinh tố mix protein',
        'Loại sinh tố có hương vị thơm ngon, bổ dưỡng, giúp tăng cường cơ bắp, kết hợp chuối, sữa chua, yến mạch,...',
        42000,
        'Trân châu,Thạch dừa,Hạt chia',
        'active',
        '6813628b-e654-49b8-89c0-4311a0cbb7e2',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    );

-- Thêm sản phầm cho Sinh tố kem
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'ca33c58c-6fb6-42e1-8602-f79e5a04c6bd',
        'Sinh tố kem chuối',
        'Loại sinh tố có hương vị thơm ngon, béo ngậy, kết hợp chuối, kem tươi và sữa đặc.',
        40000,
        'Sô cô la,Bánh quy',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '4bc28e81-c722-422a-af4b-5df923632b0f',
        'Sinh tố kem xoài',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, béo ngậy, kết hợp xoài, kem tươi và sữa đặc.',
        42000,
        'Sô cô la,Bánh quy,Xoài sấy',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'cb32f209-2bd4-4fad-8dc2-de2a3bd8cf97',
        'Sinh tố kem dâu tây',
        'Loại sinh tố có hương vị chua ngọt, thanh mát, béo ngậy, kết hợp dâu tây, kem tươi và sữa đặc.',
        40000,
        'Sô cô la,Bánh quy,Dâu tây sấy',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '0ef8c382-5f0b-42d0-8410-b22a8f4aef61',
        'Sinh tố kem bơ',
        'Loại sinh tố có hương vị béo ngậy, thơm ngon, thanh mát, kết hợp bơ, kem tươi và sữa đặc.',
        45000,
        'Sô cô la,Bánh quy,Hạt chia',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        'b7aa6c94-8f07-4013-b7eb-d393dbfb570b',
        'Sinh tố kem sầu riêng',
        'Loại sinh tố có hương vị béo ngậy, thơm nức mũi, kết hợp sầu riêng, kem tươi và sữa đặc.',
        50000,
        'Sô cô la,Bánh quy,Múi sầu riêng',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '70aba055-e81d-4d26-8901-1eceac478f0a',
        'Sinh tố kem socola',
        'Loại sinh tố có hương vị sô cô la béo ngậy, thơm ngon, kết hợp kem sô cô la, sữa tươi và bánh quy sô cô la.',
        42000,
        'Sô cô la,Bánh quy sô cô la,Kẹo dẻo',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '02f2e815-fe23-447e-9716-2adb22bd51f7',
        'Sinh tố kem trà xanh',
        'Loại sinh tố có hương vị trà xanh thơm ngon, thanh mát, béo ngậy, kết hợp kem trà xanh, sữa tươi và trân châu.',
        45000,
        'Trân châu,Thạch dừa,Bánh quy',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    ),
    (
        '3590ea75-cf8c-4355-b5f8-4a41a1c8a938',
        'Sinh tố kem cà phê',
        'Loại sinh tố có hương vị cà phê đậm đà, béo ngậy, kết hợp kem cà phê, sữa tươi và sốt caramel.',
        42000,
        'Sô cô la,Bánh quy,Bột cacao',
        'active',
        'c9448e95-742f-47f5-a271-d53231cac229',
        'eca0e90a-f463-42c7-9be5-d25d2cfdf3f8'
    );

-- Thêm sản phầm cho Soda truyền thống
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '4543a38e-4561-49bf-9cc5-7a9130aa155c',
        'Coca-Cola',
        'Loại soda có hương vị gas đặc trưng, được yêu thích bởi nhiều người.',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '8dccf22d-21e7-46a2-9c53-4ab9964093d5',
        'Pepsi',
        'Loại soda có hương vị gas sảng khoái, được yêu thích bởi nhiều người.',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b630ebc4-d0c6-43f3-911f-ba97c9c5b5aa',
        '7 Up',
        'Loại soda có hương vị chanh thanh mát, được yêu thích bởi nhiều người.',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '5ec7d436-aacd-4a76-9ed3-71e7c59aede3',
        'Dr Pepper',
        'Loại soda có hương vị độc đáo, kết hợp nhiều loại trái cây và thảo mộc.',
        18000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'bbbee685-acbf-47d2-a501-7e3cc669729b',
        'Sprite',
        'Loại soda có hương vị chanh thanh mát, không đường, được yêu thích bởi nhiều người.',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '3352f82a-1819-4bc7-b6a9-a7269a800d31',
        'Mountain Dew',
        'Loại soda có hương vị cam chanh sảng khoái, được yêu thích bởi nhiều người.',
        18000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'f5d76c3b-5246-401e-befd-6e109ca0fea2',
        'Fanta',
        'Loại soda có nhiều hương vị trái cây đa dạng như cam, dâu tây, nho,...',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'c907f3be-5204-403e-8224-15ae0c6eaecc',
        'Mirinda',
        'Loại soda có nhiều hương vị trái cây đa dạng như cam, dâu tây, nho,...',
        15000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '7351af1d-8ca0-4240-ac24-3b4eb78aabf7',
        'Schweppes',
        'Loại soda có hương vị thanh mát, không đường, được yêu thích bởi nhiều người.',
        18000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '70cb066a-dfe5-4a9d-9030-60fef3d3d8ab',
        'Tonic',
        'Loại soda có hương vị thanh mát, hơi đắng, được sử dụng để pha chế cocktail.',
        18000,
        null,
        'active',
        'e918eb9b-6d3b-441b-b39e-f8d01a7fa553',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Soda ít đường
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '651b2a1d-b2a3-4eb1-afbc-bca26d966406',
        'Coca-Cola Zero',
        'Loại soda Coca-Cola không đường, dành cho người ăn kiêng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '4d5c7aff-02c0-445f-9939-dc5a1fd494f0',
        'Pepsi Max',
        'Loại soda Pepsi không đường, dành cho người ăn kiêng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'e1ea4053-fa64-472a-8b82-be73c6316370',
        '7 Up Zero',
        'Loại soda 7 Up không đường, dành cho người ăn kiêng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '44aeb527-8ca3-4304-ba1d-4be22427e066',
        'Dr Pepper Zero',
        'Loại soda Dr Pepper không đường, dành cho người ăn kiêng.',
        19000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '539f41b8-9fde-4029-991b-0f3ee9f55012',
        'Sprite Zero',
        'Loại soda Sprite không đường, dành cho người ăn kiêng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'd9651a36-f02e-4ca0-8f33-40db53c02950',
        'Mountain Dew Zero',
        'Loại soda Mountain Dew không đường, dành cho người ăn kiêng.',
        19000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '3a4aec51-8509-4858-afe6-a1b1462d5edf',
        'Fanta Zero',
        'Loại soda Fanta không đường với nhiều hương vị trái cây đa dạng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '5e178248-4f0f-43dd-976d-c5100924bc7a',
        'Mirinda Zero',
        'Loại soda Mirinda không đường với nhiều hương vị trái cây đa dạng.',
        17000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '6b7adf8f-87d8-432f-ab57-8e5ad1065789',
        'Schweppes Zero',
        'Loại soda Schweppes không đường, dành cho người ăn kiêng.',
        19000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'a12c0bae-c7eb-442e-9355-6afea27f585f',
        'Tonic Zero',
        'Loại soda Tonic không đường, dành cho người ăn kiêng.',
        19000,
        null,
        'active',
        'be221545-9a44-403f-a559-7943fa962e52',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Soda vị trái cây
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '5c5428da-8d58-4db1-8d63-2556e70e7a7c',
        'Mirinda Cam',
        'Loại soda có hương vị cam chua ngọt, thanh mát.',
        16000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b77ef773-2219-4436-aec0-8e7b159f4d89',
        'Sprite',
        'Loại soda có hương vị chanh thanh mát, dịu nhẹ.',
        16000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '90e5b801-c5d1-4b67-8b0e-417cbbf74aff',
        'Fanta Dâu Tây',
        'Loại soda có hương vị dâu tây chua ngọt, thơm ngon.',
        16000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '90e5e1a7-d138-4d4a-9f1a-13f138fa79bd',
        'Fanta Nho',
        'Loại soda có hương vị nho tím chua ngọt, thanh mát.',
        16000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '5b89e92a-958c-42bd-aa48-ef9acf003cbb',
        'Schweppes Táo Xanh',
        'Loại soda có hương vị táo xanh chua nhẹ, thanh mát.',
        18000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '211575b5-6662-4f73-b129-6995170228fe',
        'Dr Pepper Cherry',
        'Loại soda có hương vị cherry chua ngọt, kết hợp nhiều loại trái cây và thảo mộc.',
        18000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b2ecc073-90fc-487c-8d34-1e6553f40910',
        'Mountain Dew LiveWire',
        'Loại soda có hương vị cam chanh sảng khoái, kết hợp vị chua cay.',
        18000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'd894a170-862d-4d98-8bfe-849aa6927b9e',
        'Sprite Cranberry',
        'Loại soda có hương vị chanh thanh mát kết hợp cranberry chua nhẹ.',
        16000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'c81482dd-afd6-477d-adcd-3932da6e6752',
        'Fanta Zero Cam',
        'Loại soda có hương vị cam chua ngọt, thanh mát, không đường.',
        17000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'f239735a-5267-41d9-b718-c49980ceda3a',
        'Mirinda Zero Nho',
        'Loại soda có hương vị nho tím chua ngọt, thanh mát, không đường.',
        17000,
        null,
        'active',
        '136ea003-f99a-4420-bb90-722f4e345968',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Soda mix
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '2b025cc8-b590-42f1-8ab0-74c8b36e3d17',
        'Shweppes Ginger Ale & Lime',
        'Loại soda mix có hương vị gừng cay nồng, kết hợp chanh thanh mát.',
        18000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '881be1b8-181b-4b3d-8fe7-0f5104895ca5',
        'Sprite Cranberry & Rosemary',
        'Loại soda mix có hương vị chanh thanh mát kết hợp cranberry chua nhẹ và hương thảo mộc.',
        18000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '09213417-1493-4eb2-a9c4-3812bb8e8068',
        'Dr Pepper Cherry & Vanilla',
        'Loại soda mix có hương vị cherry chua ngọt, kết hợp nhiều loại trái cây, thảo mộc và hương vani.',
        19000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '88006e40-138c-4dc7-a85e-501ca85cd195',
        'Mountain Dew LiveWire & Mango',
        'Loại soda mix có hương vị cam chanh sảng khoái, kết hợp vị chua cay và vị xoài thơm ngon.',
        19000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '18fe9780-0c12-4c44-86d3-11583b90c5fb',
        'Fanta Zero Orange & Pineapple',
        'Loại soda mix có hương vị cam chua ngọt, thanh mát, không đường, kết hợp dứa thơm ngon.',
        17000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '7f2dd1be-b81f-4506-86f7-292963698a76',
        'Mirinda Zero Grape & Strawberry',
        'Loại soda mix có hương vị nho tím chua ngọt, thanh mát, không đường, kết hợp dâu tây thơm ngon.',
        17000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'cff41043-b229-45c9-b323-d4902db56ec5',
        '7 Up Zero & Lime',
        'Loại soda mix có hương vị chanh thanh mát, không đường, kết hợp thêm chanh tươi.',
        17000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '2d7e17eb-9ed7-4668-a59e-5e7e23b7c1ce',
        'Coca-Cola Zero & Cherry',
        'Loại soda mix có hương vị Coca-Cola không đường, kết hợp vị cherry chua ngọt.',
        18000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'ad532d20-9ff8-4166-b8f3-6c4b5c74ba61',
        'Pepsi Max & Ginger',
        'Loại soda mix có hương vị Pepsi không đường, kết hợp vị gừng cay nồng.',
        18000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '3ded8b00-f749-4d45-8548-61ea79cc6b79',
        'Dr Pepper & Vanilla Float',
        'Loại soda mix kết hợp soda Dr Pepper và kem vani, tạo nên hương vị béo ngậy, thơm ngon.',
        22000,
        null,
        'active',
        '5a2b9d99-fab5-4f57-a5ac-5cf5e051757f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Nước lọc
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'ff395739-b143-4df2-8755-e849ff4379a3',
        'Aquafina',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        10000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b8e14380-62f0-44e0-b687-8d2a10bc5019',
        'Nestlé Pure Life',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        12000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'e04e57db-6030-453d-9417-e51a148fc1eb',
        'La Vie',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        12000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '33c0621b-c312-4e08-b69c-2163b7779767',
        'Satori',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        13000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '24c74111-b3b5-4bd6-bdd6-f900e08c8a14',
        'Ibis',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        10000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b9740671-5db8-4d7e-a6f2-ffb35495ddd7',
        'Vianco',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        11000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '6c0bce37-800b-427e-8a84-b449f60ffbde',
        'Ba Vì',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        12000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'd0859269-c07b-4c90-bae9-f5ad06c25591',
        'Kim Bôi',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        13000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'a7ee1171-fd7a-4f3e-9321-71471e70b1c9',
        'Lavie',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        12000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '7414983b-bcca-4ee6-abb3-ef572f8fbbb4',
        'Number 1',
        'Loại nước lọc tinh khiết, được sản xuất theo quy trình hiện đại.',
        11000,
        null,
        'active',
        '006fcffc-74d9-4495-989e-d80e94edfc1e',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Nước khoáng
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'b02570b8-9e14-44db-97d7-4f7372b400f8',
        'Vĩnh Hảo',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng nóng Vĩnh Hảo.',
        15000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '8f9da007-2c54-4f0c-a404-706983d9d948',
        'Lavie',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Lavie.',
        16000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'ae561ca6-43df-4297-ad66-e190f1f75dbe',
        'Ba Vì',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Ba Vì.',
        14000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '561067bc-efa5-4bc8-8e67-f9b022bbdf26',
        'Kim Bôi',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Kim Bôi.',
        15000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'a033a831-f6f7-4ebc-a2c1-814b6b5d390d',
        'Number 1',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Number 1.',
        16000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '9e7dc97d-3416-469d-861d-f110e2232a77',
        'Ibis',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Ibis.',
        14000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'da53efa6-3f70-4015-a785-ac0029161715',
        'Satori',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Satori.',
        17000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'a5cd89c9-355b-46d4-9265-b36b334009da',
        'Nestlé Pure Life',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Nestlé Pure Life.',
        18000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'c0a04644-a825-48fa-b8ab-bcd4411b74bc',
        'Aquafina',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng Aquafina.',
        15000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'b9590f93-a187-4687-a01e-55b53180e0af',
        'La Vie',
        'Loại nước khoáng tự nhiên, được khai thác từ nguồn nước khoáng La Vie.',
        16000,
        null,
        'active',
        'f19d6070-da31-477b-82d5-86d653ea087b',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Nước có ga
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '5072f32c-03c4-4fe8-9024-fb8e1642743c',
        'Sprite',
        'Loại nước có ga vị chanh thanh mát, dịu nhẹ.',
        12000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '3e1ac3aa-73fa-4f81-a27f-60065fd0751b',
        'Coca-Cola',
        'Loại nước có ga vị cola truyền thống, đậm đà.',
        12000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'f0e49bed-f651-4a38-8325-b03133af456f',
        'Pepsi',
        'Loại nước có ga vị cola truyền thống, sảng khoái.',
        12000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '230b89d2-e70f-4493-a8ae-909f4c44975a',
        '7 Up',
        'Loại nước có ga vị chanh không đường, thanh mát.',
        13000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '13148f9a-93fd-4880-aeb2-53c1746b08bd',
        'Dr Pepper',
        'Loại nước có ga vị cola kết hợp nhiều loại trái cây và thảo mộc.',
        15000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '994cbc53-03af-47ca-974a-bf13dd523d34',
        'Mountain Dew',
        'Loại nước có ga vị cam chanh sảng khoái, kết hợp vị chua cay.',
        15000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'e75dd2bf-3220-4ead-923c-8dff3bf77d49',
        'Fanta',
        'Loại nước có ga nhiều hương vị trái cây đa dạng như cam, dâu tây, nho,...',
        12000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '9e0ae1fe-4bed-4dbd-b59c-e4c82fc7ab3f',
        'Mirinda',
        'Loại nước có ga nhiều hương vị trái cây đa dạng như cam, dâu tây, nho,...',
        12000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '8a6b7870-0114-4282-add1-129cf85ecaf3',
        'Schweppes',
        'Loại nước có ga thanh mát, không đường, có nhiều hương vị như tonic, ginger ale,...',
        14000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '5e5d33ac-7e74-49f6-b9bc-4d7dc6138078',
        'Sting',
        'Loại nước tăng lực, bổ sung năng lượng.',
        13000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'e4aa3eb7-c1f4-429b-a89b-f917250bb3ec',
        'Red Bull',
        'Loại nước tăng lực, bổ sung năng lượng, tăng cường sự tập trung.',
        16000,
        null,
        'active',
        '29f72015-c90e-4d24-8257-c63879da457f',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Nước trái cây đóng chai
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '7691e314-4263-4bc3-a341-8a639a8dd052',
        'Tropicana',
        'Loại nước trái cây cam nguyên chất, giàu vitamin C.',
        15000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '8f2ed4a8-3dbf-4a32-98cc-72e9b4cf24df',
        'Del Monte',
        'Loại nước trái cây dứa nguyên chất, thơm ngon, thanh mát.',
        14000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '1bf0ea3f-8c17-4e75-8173-a2b1652fe0db',
        'Coco',
        'Loại nước dừa nguyên chất, thanh mát, tốt cho sức khỏe.',
        12000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        'a52af1b8-c61d-4317-9edf-456c50bc6d53',
        'HiPP',
        'Loại nước trái cây dành cho trẻ em, được làm từ nguyên liệu tự nhiên, an toàn.',
        18000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '8aa7bb1d-2e27-4ee3-8175-ce673466e674',
        'Enfamil',
        'Loại nước trái cây dành cho trẻ em, bổ sung vitamin và khoáng chất cần thiết.',
        19000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '1a0e5d4b-e210-4d9b-b081-0e1d8fc90085',
        'Nestlé',
        'Loại nước trái cây dành cho trẻ em, hương vị thơm ngon, dễ uống.',
        17000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '2c015e21-2756-4073-83e5-2999f995569d',
        'Vfresh',
        'Loại nước trái cây thanh mát, nhiều hương vị trái cây đa dạng.',
        13000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '5f693308-4406-4eec-90a6-75314f36e1a0',
        'Coco Fresh',
        'Loại nước dừa tươi nguyên chất, đóng chai tiện lợi.',
        14000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '323b6fdb-1490-432f-be50-39ebbe135011',
        'TH True Water Fruit',
        'Loại nước trái cây kết hợp nước khoáng TH True Water, tốt cho sức khỏe.',
        16000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '3d91b0cb-3eb5-4148-ab84-8d3e5a409170',
        'Number 1 Juice',
        'Loại nước trái cây nguyên chất, được làm từ nguyên liệu chọn lọc.',
        15000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    ),
    (
        '631d7395-da78-4d4d-b24f-32e754e6b618',
        'Cappy',
        'Loại nước trái cây nhiều hương vị trái cây đa dạng, thơm ngon.',
        12000,
        null,
        'active',
        '1e37e999-c067-4d26-a1e8-735b8a3a3f99',
        '5a106bae-588d-49e7-a686-6de67f2e3054'
    );

-- Thêm sản phầm cho Cacao nóng
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'da8fff5e-01cb-4e8e-a61f-51eb0fb731ec',
        'Cacao Nóng Nguyên Chất',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và đường.',
        25000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'dbb6656e-55cb-4209-9b1e-7fed2c5e3c10',
        'Cacao Nóng Sữa Đá',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và đá.',
        28000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '2761ed35-cd91-499a-ba14-184b7b9cd119',
        'Cacao Nóng Sữa Bột',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa bột và đường.',
        22000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'a26fdef6-8b35-41ac-8778-25da036a1ee0',
        'Cacao Nóng Sữa Chua',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa chua và mật ong.',
        27000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'e526d6f2-549c-4fa8-9fc6-5879abf8324d',
        'Cacao Nóng Topping',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và topping đa dạng (kem tươi, marshmallow, trân châu...).',
        30000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '268f4ad8-4a74-4f75-8a17-619decce22b6',
        'Cacao Nóng Sôcôla',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và sôcôla tan chảy.',
        32000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '43894997-4c99-4936-9ec4-20d4b475e3ba',
        'Cacao Nóng Bạc Hà',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và siro bạc hà.',
        28000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '194c3c43-f689-4361-9d14-5cf7a56f38ee',
        'Cacao Nóng Gừng',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa tươi và gừng.',
        27000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'dda2db08-fb5a-4dcd-9075-4d6ee8d4aaa2',
        'Cacao Nóng Sữa Dừa',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa dừa và đường.',
        30000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '44f0cbf9-ec7d-413f-ada7-5e8eb6819403',
        'Cacao Nóng Vegan',
        'Loại cacao nóng được pha chế từ cacao bột nguyên chất, sữa thực vật (sữa đậu nành, sữa hạnh nhân...) và chất tạo ngọt tự nhiên.',
        28000,
        null,
        'active',
        '2d4d5f65-150d-4c92-9c32-445bf9256609',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    );

-- Thêm sản phầm cho Cacao đá
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '7d868204-54f8-413b-b11a-746a056972f6',
        'Cacao đá xay',
        'Loại cacao đá được xay nhuyễn từ cacao bột, sữa tươi, đá và đường.',
        30000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '1305ca35-3217-4b90-bff0-fcc85f83fa6c',
        'Cacao đá xay Topping',
        'Loại cacao đá xay được xay nhuyễn từ cacao bột, sữa tươi, đá và topping đa dạng (kem tươi, marshmallow, trân châu...).',
        35000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '48faa6ef-635f-4364-80ec-1457ea16172b',
        'Cacao đá Blended',
        'Loại cacao đá được pha trộn từ cacao bột, sữa tươi, đá và trái cây tươi xay nhuyễn.',
        32000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'dc356203-e21f-4c15-be29-be026a3c3734',
        'Cacao đá Frappuccino',
        'Loại cacao đá được pha chế theo phong cách Frappuccino, sử dụng đá xay nhuyễn mịn, cacao bột, sữa tươi và siro.',
        38000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '34d9a2e9-d170-46f3-9744-3749d6b7084f',
        'Cacao đá Smoothie',
        'Loại cacao đá được pha trộn từ cacao bột, sữa tươi, đá, trái cây tươi và rau củ.',
        35000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '84a9f37d-48d0-4423-b46f-e0c46f51d609',
        'Cacao đá Sữa Chua',
        'Loại cacao đá được pha chế từ cacao bột, sữa chua, đá và mật ong.',
        30000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '0b258faf-6cbc-4b82-911f-0ba1755a88d0',
        'Cacao đá Sữa Dừa',
        'Loại cacao đá được pha chế từ cacao bột, sữa dừa, đá và đường.',
        32000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        'c4288dea-6cd6-4afa-8e44-65233e10d062',
        'Cacao đá Vegan',
        'Loại cacao đá được pha chế từ cacao bột, sữa thực vật (sữa đậu nành, sữa hạnh nhân...), đá và chất tạo ngọt tự nhiên.',
        30000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '662bf5dc-8e2a-46fe-bc98-ddccc16d980f',
        'Cacao đá Ít Ngọt',
        'Loại cacao đá được pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        28000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    ),
    (
        '58afaa58-f3b1-41ed-ae9d-1b3f4c5b31c0',
        'Cacao đá Không Đường',
        'Loại cacao đá được pha chế hoàn toàn không đường, phù hợp cho người muốn kiểm soát lượng đường nạp vào cơ thể.',
        25000,
        null,
        'active',
        '13d50631-3f7c-4c03-b04d-70eee789a8f6',
        '9631602c-f6c7-49c5-a32f-3b124086d565'
    );

-- Thêm sản phầm cho Trà sữa matcha
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'a0de493d-d6a8-48b9-b139-9abdbb038623',
        'Trà sữa matcha truyền thống',
        'Trà sữa matcha pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất và sữa tươi.',
        25000,
        'Trân châu đen,Trân châu trắng,Pudding',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '781a3875-ea72-4053-bc2a-3dab4856a71a',
        'Trà sữa matcha kem cheese',
        'Trà sữa matcha kết hợp với lớp kem cheese béo ngậy, tạo nên hương vị độc đáo, hấp dẫn.',
        30000,
        'Trân châu đen,Trân châu trắng,Pudding,Kem cheese',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '33956982-5507-4a07-a013-57501ee66b10',
        'Trà sữa matcha thạch',
        'Trà sữa matcha kết hợp với thạch dai dai, nhiều màu sắc, tạo nên hương vị thú vị.',
        28000,
        'Trân châu đen,Trân châu trắng,Pudding,Thạch trái cây',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'cd2fb4e6-68ae-41d2-8fa1-d7aa3e365ff4',
        'Trà sữa matcha trân châu hoàng kim',
        'Trà sữa matcha kết hợp với trân châu hoàng kim dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        32000,
        'Trân châu đen,Trân châu trắng,Trân châu hoàng kim,Pudding',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '4dba4dce-e244-4840-8e2a-d6da8dab7830',
        'Trà sữa matcha socola',
        'Trà sữa matcha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        30000,
        'Trân châu đen,Trân châu trắng,Pudding,Socola chip',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '8995780e-9a50-4502-92ed-8f84192f6ca1',
        'Trà sữa matcha vị trái cây',
        'Trà sữa matcha kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        27000,
        'Trân châu đen,Trân châu trắng,Pudding,Thạch trái cây',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '0234b97a-623e-4f5c-9c88-c413d9b87311',
        'Trà sữa matcha ít ngọt',
        'Trà sữa matcha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        23000,
        'Trân châu đen,Trân châu trắng,Pudding',
        'active',
        'f76b6e7e-55fb-4b00-9aeb-7cbc3f65ed44',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa sencha
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'a07b15df-56a8-4465-a895-dac622665ca0',
        'Trà sữa sencha truyền thống',
        'Trà sữa sencha pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất và sữa tươi.',
        25000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'e42378cf-70ff-48b1-aee9-dce5432385ec',
        'Trà sữa sencha kem cheese',
        'Trà sữa sencha kết hợp với lớp kem cheese béo ngậy, tạo nên hương vị độc đáo, hấp dẫn.',
        30000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'ff8e3c44-314b-4017-9cde-9e73c2d505cc',
        'Trà sữa sencha thạch trái cây',
        'Trà sữa sencha kết hợp với thạch trái cây dai dai, nhiều màu sắc, tạo nên hương vị thú vị.',
        28000,
        'Trân châu đen,Trân châu trắng,Thạch trái cây,Kem cheese',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '41090c8c-951e-4cc2-9f4d-8751ddf37f1f',
        'Trà sữa sencha trân châu hoàng kim',
        'Trà sữa sencha kết hợp với trân châu hoàng kim dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        32000,
        'Trân châu đen,Trân châu trắng,Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '9fa14432-a32d-4de8-b980-ea901450cb6a',
        'Trà sữa sencha socola',
        'Trà sữa sencha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        30000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese,Socola chip',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'ae058cd8-a77c-49d6-b6db-f5842c1bf95b',
        'Trà sữa sencha vị trái cây',
        'Trà sữa sencha kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        27000,
        'Trân châu đen,Trân châu trắng,Thạch trái cây,Kem cheese',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'bf649ffe-4969-4aed-bd69-564b50b9ec3d',
        'Trà sữa sencha ít ngọt',
        'Trà sữa sencha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        30000,
        'Trân châu đen,Trân châu trắng,Thạch trái cây,Aloe vera,Kem cheese ít béo',
        'active',
        'e91b6ddb-e81c-4036-a93f-f1bcbbd48493',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa genmaicha
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'f49b375f-783f-433e-b110-7e7e1606b49f',
        'Trà sữa genmaicha truyền thống',
        'Trà sữa genmaicha pha chế theo công thức truyền thống, sử dụng trà genmaicha nguyên chất và sữa tươi.',
        28000,
        'Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '2e9e4bfe-a1c1-4a63-b081-183ac735695f',
        'Trà sữa genmaicha kem cheese',
        'Trà sữa genmaicha kết hợp với lớp kem cheese béo ngậy, tạo nên hương vị độc đáo, hấp dẫn.',
        33000,
        'Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'c1a20038-13a5-4e55-98d8-85cdcea49205',
        'Trà sữa genmaicha trái cây',
        'Trà sữa genmaicha kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        30000,
        'Trân châu hoàng kim,Thạch trái cây,Kem cheese',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '275fdf99-5001-4015-a2bc-0959028d781b',
        'Trà sữa genmaicha ít ngọt',
        'Trà sữa genmaicha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        25000,
        'Trân châu hoàng kim,Thạch,Kem cheese ít béo',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'b4fd87ab-3912-42b8-9e9e-fc02b984230b',
        'Trà sữa genmaicha socola',
        'Trà sữa genmaicha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        32000,
        'Trân châu hoàng kim,Thạch,Kem cheese,Socola chip',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '0a19eedd-f121-4847-b96f-ed0c62d9625f',
        'Trà sữa genmaicha thạch nha',
        'Trà sữa genmaicha kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        30000,
        'Trân châu hoàng kim,Thạch nha,Kem cheese',
        'active',
        'e911945f-5307-4474-beea-65343027b760',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa matcha kem cheese
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'f320ca1b-44a1-4529-b047-5659ba591313',
        'Trà sữa matcha kem cheese truyền thống',
        'Trà sữa matcha kem cheese pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất, sữa tươi và kem cheese.',
        30000,
        'Trân châu đen,Trân châu trắng,Pudding,Kem cheese',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '702f7e43-9844-401e-855f-18191e5031ad',
        'Trà sữa matcha kem cheese trân châu hoàng kim',
        'Trà sữa matcha kem cheese kết hợp với trân châu hoàng kim dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        35000,
        'Trân châu đen,Trân châu trắng,Trân châu hoàng kim,Pudding,Kem cheese',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '6a835c89-7377-4dd7-8d04-0545629c20fb',
        'Trà sữa matcha kem cheese thạch trái cây',
        'Trà sữa matcha kem cheese kết hợp với thạch trái cây dai dai, nhiều màu sắc, tạo nên hương vị thú vị.',
        33000,
        'Trân châu đen,Trân châu trắng,Pudding,Thạch trái cây,Kem cheese',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'c9c871c3-85c1-4a0a-a9d9-8570635a4ced',
        'Trà sữa matcha kem cheese ít ngọt',
        'Trà sữa matcha kem cheese pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        28000,
        'Trân châu đen,Trân châu trắng,Pudding,Kem cheese ít béo',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '11b2beed-bd4d-4ffb-9561-0e12def7afe7',
        'Trà sữa matcha kem cheese socola',
        'Trà sữa matcha kem cheese kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        34000,
        'Trân châu đen,Trân châu trắng,Pudding,Kem cheese,Socola chip',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '7342238d-b915-488a-afc8-e098b56fb0d4',
        'Trà sữa matcha kem cheese thạch nha',
        'Trà sữa matcha kem cheese kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        32000,
        'Trân châu đen,Trân châu trắng,Pudding,Thạch nha,Kem cheese',
        'active',
        'defb69dc-dd23-4daf-96b0-8a9191ef250a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa sencha kem cheese
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '95b7e5e8-e512-4dda-a647-0935789574c4',
        'Trà sữa sencha kem cheese truyền thống',
        'Trà sữa sencha kem cheese pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất, sữa tươi và kem cheese.',
        30000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '19aad4fa-d6e7-4290-a4d9-0080e590374c',
        'Trà sữa sencha kem cheese trân châu hoàng kim',
        'Trà sữa sencha kem cheese kết hợp với trân châu hoàng kim dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        35000,
        'Trân châu đen,Trân châu trắng,Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'd47c2df2-3841-4eeb-961f-bb9120b915dc',
        'Trà sữa sencha kem cheese thạch trái cây',
        'Trà sữa sencha kem cheese kết hợp với thạch trái cây dai dai, nhiều màu sắc, tạo nên hương vị thú vị.',
        33000,
        'Trân châu đen,Trân châu trắng,Thạch trái cây,Kem cheese',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '27bc8b3e-5e2d-4604-be6c-0ef332a2e87d',
        'Trà sữa sencha kem cheese ít ngọt',
        'Trà sữa sencha kem cheese pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        28000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese ít béo',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '97e3809f-15ba-44d4-824c-becfa731b5a4',
        'Trà sữa sencha kem cheese socola',
        'Trà sữa sencha kem cheese kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        34000,
        'Trân châu đen,Trân châu trắng,Thạch,Kem cheese,Socola chip',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '18edeb02-320a-47d5-9cb5-40449726e758',
        'Trà sữa sencha kem cheese thạch nha',
        'Trà sữa sencha kem cheese kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        32000,
        'Trân châu đen,Trân châu trắng,Thạch nha,Kem cheese',
        'active',
        '2a19695b-9b6b-40d7-a6f7-c810d8ce0bb9',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa genmaicha kem cheese
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'f414d636-eea9-4c6c-92e3-5ceab5be1ba8',
        'Trà sữa genmaicha kem cheese truyền thống',
        'Trà sữa genmaicha kem cheese pha chế theo công thức truyền thống, sử dụng trà genmaicha nguyên chất, sữa tươi và kem cheese.',
        33000,
        'Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '9354a9fc-e11b-4914-b5a5-f1ff933343cb',
        'Trà sữa genmaicha kem cheese macchiato',
        'Trà sữa genmaicha kem cheese kết hợp với lớp kem sữa béo ngậy, tạo nên hương vị độc đáo, hấp dẫn',
        35000,
        'Trân châu hoàng kim,Thạch,Kem cheese',
        'active',
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '727197fd-5b88-48ad-96a8-160d469d366a',
        'Trà sữa genmaicha kem cheese socola',
        'Trà sữa genmaicha kem cheese kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        36000,
        'Trân châu hoàng kim,Thạch,Kem cheese,Socola chip',
        'active',
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'bd40f324-f13b-4230-b779-a2604feb8024',
        'Trà sữa genmaicha kem cheese trái cây',
        'Trà sữa genmaicha kem cheese kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        34000,
        'Trân châu hoàng kim,Thạch trái cây,Kem cheese',
        'active',
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'd073615c-f7a7-48de-b705-badf2124d93f',
        'Trà sữa genmaicha kem cheese thạch nha',
        'Trà sữa genmaicha kem cheese kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        32000,
        'Trân châu hoàng kim,Thạch nha,Kem cheese',
        'active',
        '8aa76d31-063f-4708-894b-ada7edc6d21b',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa matcha trân châu
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'a7d0ebcf-5a0d-4f63-ab59-642f42622969',
        'Trà sữa matcha trân châu đen truyền thống',
        'Trà sữa matcha trân châu đen pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất, sữa tươi, trân châu đen và kem cheese.',
        35000,
        'Trân châu đen,Kem cheese',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '27bcafc0-7ea6-4110-a5f3-079872a147e8',
        'Trà sữa matcha trân châu trắng',
        'Trà sữa matcha trân châu trắng pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất, sữa tươi, trân châu trắng và kem cheese.',
        35000,
        'Trân châu trắng,Kem cheese',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '94516d0c-60af-48f4-8692-bdec458ef796',
        'Trà sữa matcha trân châu hoàng kim',
        'Trà sữa matcha kết hợp với trân châu hoàng kim dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        38000,
        'Trân châu hoàng kim,Kem cheese',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'de5caa80-1a8a-4d69-9d3f-14638de8cade',
        'Trà sữa matcha trân châu ít ngọt',
        'Trà sữa matcha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Trân châu đen,Trân châu trắng,Kem cheese ít béo',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '67915dd2-6dd4-4dff-a482-0fe06bd25585',
        'Trà sữa matcha trân châu socola',
        'Trà sữa matcha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Trân châu đen,Trân châu trắng,Kem cheese,Socola chip',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '67e32ff4-7f40-412f-b29a-b022a780e597',
        'Trà sữa matcha trân châu thạch nha',
        'Trà sữa matcha kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        35000,
        'Trân châu đen,Trân châu trắng,Kem cheese,Thạch nha',
        'active',
        '1cde07aa-8807-4286-a460-73b140e01378',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa sencha trân châu
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '83be1bc3-ba71-431b-b842-e55ab2b5195e',
        'Trà sữa sencha trân châu trắng truyền thống',
        'Trà sữa sencha trân châu trắng pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất, sữa tươi, trân châu trắng và kem cheese.',
        35000,
        'Trân châu trắng,Kem cheese',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '70f24ec8-84a1-44dc-92eb-84c104d22246',
        'Trà sữa sencha trân châu hoàng kim',
        'Trà sữa sencha trân châu hoàng kim pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất, sữa tươi, trân châu hoàng kim và kem cheese.',
        38000,
        'Trân châu hoàng kim,Kem cheese',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'a44cbb13-e654-440c-9dd4-fb8719113124',
        'Trà sữa sencha trân châu đen',
        'Trà sữa sencha kết hợp với trân châu đen dai dai, bùi bùi, tạo nên hương vị độc đáo.',
        36000,
        'Trân châu đen,Kem cheese',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '37828e6a-84b9-48e4-95ec-d295a8d9f78e',
        'Trà sữa sencha trân châu ít ngọt',
        'Trà sữa sencha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Trân châu trắng,Trân châu đen,Kem cheese ít béo',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'c070927c-a7f2-4e66-a157-1cd53b977a86',
        'Trà sữa sencha trân châu socola',
        'Trà sữa sencha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Trân châu trắng,Trân châu đen,Kem cheese,Socola chip',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '7eea3ec1-dcea-42e6-b0f8-1bfcf1799a1a',
        'Trà sữa sencha trân châu thạch nha',
        'Trà sữa sencha kết hợp với thạch nha dai dai, thanh mát, tạo nên hương vị độc đáo.',
        35000,
        'Trân châu trắng,Trân châu đen,Kem cheese,Thạch nha',
        'active',
        '0cca1053-5ee3-4d80-ade3-1c3609d61d47',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa genmaicha trân châu
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '7ff3c3ce-23e4-4f0d-8678-1e73c529364c',
        'Trà sữa genmaicha trân châu hoàng kim truyền thống',
        'Trà sữa genmaicha trân châu hoàng kim pha chế theo công thức truyền thống, sử dụng trà genmaicha nguyên chất, sữa tươi, trân châu hoàng kim và kem cheese.',
        38000,
        'Trân châu hoàng kim,Kem cheese',
        'active',
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '40adac61-70cd-4347-a90c-fc8fc88fe3f9',
        'Trà sữa genmaicha trân châu mix',
        'Trà sữa genmaicha trân châu mix kết hợp với nhiều loại topping đa dạng, mang đến trải nghiệm hương vị phong phú.',
        40000,
        'Trân châu hoàng kim,Trân châu đen,Trân châu trắng,Kem cheese,Thạch nha,Pudding',
        'active',
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '415aff6d-815c-44d1-aa2d-31f1873657f2',
        'Trà sữa genmaicha trân châu ít ngọt',
        'Trà sữa genmaicha pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        35000,
        'Trân châu hoàng kim,Trân châu đen,Trân châu trắng,Kem cheese ít béo',
        'active',
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '58f761c6-5102-4a13-ab13-aa16da6b4422',
        'Trà sữa genmaicha trân châu socola',
        'Trà sữa genmaicha kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        41000,
        'Trân châu hoàng kim,Trân châu đen,Trân châu trắng,Kem cheese,Socola chip',
        'active',
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '1f30eae5-a414-4a0d-8acd-cf13c747abc3',
        'Trà sữa genmaicha trân châu thạch trái cây',
        'Trà sữa genmaicha kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        39000,
        'Trân châu hoàng kim,Trân châu đen,Trân châu trắng,Kem cheese,Thạch trái cây',
        'active',
        'b8e47d78-7052-4567-8e1e-0fb7345e6156',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa matcha pudding
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '709c3867-3a59-4001-9690-168460312fd6',
        'Trà sữa matcha pudding truyền thống',
        'Trà sữa matcha pudding pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất, sữa tươi, pudding trà xanh và kem cheese.',
        35000,
        'Pudding trà xanh,Kem cheese',
        'active',
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '5668b3e9-0a22-4057-baad-46f46fc184a6',
        'Trà sữa matcha pudding trân châu',
        'Trà sữa matcha pudding kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        40000,
        'Pudding trà xanh,Trân châu đen,Trân châu trắng,Kem cheese',
        'active',
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '24bd8ecb-7ba7-4670-a078-1a0bd11d5c25',
        'Trà sữa matcha pudding thạch trái cây',
        'Trà sữa matcha pudding kết hợp với thạch trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        38000,
        'Pudding trà xanh,Thạch trái cây,Kem cheese',
        'active',
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'b529b215-797d-4bd9-87b8-8c492da21366',
        'Trà sữa matcha pudding ít ngọt',
        'Trà sữa matcha pudding pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Pudding trà xanh,Kem cheese ít béo',
        'active',
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '007254db-e267-4e66-84e8-74291941fcb0',
        'Trà sữa matcha pudding socola',
        'Trà sữa matcha pudding kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Pudding trà xanh,Trân châu đen,Trân châu trắng,Kem cheese,Socola chip',
        'active',
        'caca7956-2b0d-4293-9ec6-b65f6e5996c1',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa sencha pudding
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '60652d28-e29a-4d1b-9a90-bc4b06b57cd4',
        'Trà sữa sencha pudding truyền thống',
        'Trà sữa sencha pudding pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất, sữa tươi, pudding caramel và kem cheese.',
        35000,
        'Pudding caramel,Kem cheese',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'a389cdbf-be92-4e93-a25f-1e78c096fd39',
        'Trà sữa sencha pudding thạch',
        'Trà sữa sencha pudding kết hợp với thạch dai dai, tạo nên hương vị thơm ngon, thanh mát, giòn giòn.',
        40000,
        'Pudding caramel,Thạch,Kem cheese',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '5ec9ec5c-0046-4e29-8009-37a615b2e28c',
        'Trà sữa sencha pudding trân châu',
        'Trà sữa sencha pudding kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        42000,
        'Pudding caramel,Trân châu đen,Trân châu trắng,Kem cheese',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '69410ee5-d9a7-4c06-8bb9-5267be4d2a16',
        'Trà sữa sencha pudding trái cây',
        'Trà sữa sencha pudding kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        38000,
        'Pudding caramel,Thạch trái cây,Kem cheese',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '87ff3d9e-63e3-4dc7-8488-686cb8b55583',
        'Trà sữa sencha pudding ít ngọt',
        'Trà sữa sencha pudding pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Pudding caramel,Kem cheese ít béo',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '822ea2c5-00ca-48d4-8043-b148af85444e',
        'Trà sữa sencha pudding socola',
        'Trà sữa sencha pudding kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Pudding caramel,Trân châu đen,Trân châu trắng,Kem cheese,Socola chip',
        'active',
        'ee7ff525-7337-41c5-b527-d82637d22b0a',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa genmaicha pudding
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '9c3347d0-4c6b-4be8-a266-3cf894008575',
        'Trà sữa genmaicha pudding truyền thống',
        'Trà sữa genmaicha pudding pha chế theo công thức truyền thống, sử dụng trà genmaicha nguyên chất, sữa tươi, pudding socola và kem cheese.',
        38000,
        'Pudding socola,Kem cheese',
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '577a98c5-7e27-4fee-902c-fde64dbd2569',
        'Trà sữa genmaicha pudding macchiato',
        'Trà sữa genmaicha pudding kết hợp với lớp kem sữa béo ngậy, tạo nên hương vị độc đáo, hấp dẫn.',
        43000,
        null,
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '453dba57-dbec-4e29-96e6-4c0c7201252a',
        'Trà sữa genmaicha pudding trân châu',
        'Trà sữa genmaicha pudding kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        45000,
        'Pudding socola,Trân châu đen,Trân châu trắng,Kem cheese',
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'bb0c2519-99d1-4c00-b483-51a8dc9613d1',
        'Trà sữa genmaicha pudding trái cây',
        'Trà sữa genmaicha pudding kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        40000,
        'Pudding socola,Thạch trái cây,Kem cheese',
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'ca59b93b-86dc-4e96-b03c-e5547f444da4',
        'Trà sữa genmaicha pudding ít ngọt',
        'Trà sữa genmaicha pudding pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        35000,
        'Pudding socola,Kem cheese ít béo',
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '93add562-36fc-4f6f-a616-053b223b0f74',
        'Trà sữa genmaicha pudding socola',
        'Trà sữa genmaicha pudding kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        41000,
        'Pudding socola,Trân châu đen,Trân châu trắng,Kem cheese,Socola chip',
        'active',
        '891885a8-44ee-43ab-bde6-15bd170642db',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa matcha macchiato
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '48c47d3a-42b4-4764-aeb7-57a196cefa08',
        'Trà sữa matcha macchiato truyền thống',
        'Trà sữa matcha macchiato pha chế theo công thức truyền thống, sử dụng trà matcha nguyên chất, sữa tươi và kem sữa béo ngậy.',
        35000,
        'Kem sữa',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '7cc4c6ed-ad64-4f52-b27f-524e69a3d8ca',
        'Trà sữa matcha macchiato trân châu',
        'Trà sữa matcha macchiato kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        40000,
        'Trân châu đen,Trân châu trắng,Kem sữa',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'ae0c99e8-66fb-4c46-8e03-66fda78db190',
        'Trà sữa matcha macchiato thạch',
        'Trà sữa matcha macchiato kết hợp với thạch dai dai, tạo nên hương vị thơm ngon, thanh mát, giòn giòn.',
        38000,
        'Thạch trái cây,Thạch dừa,Kem sữa',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'c8d97991-ecd7-41a4-926a-aacba2173fe8',
        'Trà sữa matcha macchiato trái cây',
        'Trà sữa matcha macchiato kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        39000,
        'Thạch trái cây,Kem sữa',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '6ed002e4-8663-471e-9f63-c26b8c498553',
        'Trà sữa matcha macchiato ít ngọt',
        'Trà sữa matcha macchiato pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Kem sữa ít béo',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'a72733f1-f74c-496d-8da4-d5ea5ef13d71',
        'Trà sữa matcha macchiato socola',
        'Trà sữa matcha macchiato kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Trân châu đen,Trân châu trắng,Kem sữa,Socola chip',
        'active',
        'fb59d74c-a983-48a5-a476-7465e32f5ce2',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa sencha macchiato
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        '36fe0248-1317-4cc9-b071-6c1cf3e41d82',
        'Trà sữa sencha macchiato truyền thống',
        'Trà sữa sencha macchiato pha chế theo công thức truyền thống, sử dụng trà sencha nguyên chất, sữa tươi và kem sữa béo ngậy.',
        35000,
        'Kem sữa',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'b5273357-035b-49f3-b2b3-6b2de040c440',
        'Trà sữa sencha macchiato trân châu',
        'Trà sữa sencha macchiato kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        40000,
        'Trân châu đen,Trân châu trắng,Kem sữa',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'b2042554-8336-4d94-9415-fb0f650f0748',
        'Trà sữa sencha macchiato thạch',
        'Trà sữa sencha macchiato kết hợp với thạch dai dai, tạo nên hương vị thơm ngon, thanh mát, giòn giòn.',
        38000,
        'Thạch trái cây,Thạch dừa,Kem sữa',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '437d858e-87f4-4417-a23d-a572e365b2ee',
        'Trà sữa sencha macchiato trái cây',
        'Trà sữa sencha macchiato kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        39000,
        'Thạch trái cây,Kem sữa',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'b24ccb65-0f35-46bb-b2e1-ec34f9bd37d8',
        'Trà sữa sencha macchiato ít ngọt',
        'Trà sữa sencha macchiato pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        32000,
        'Kem sữa ít béo',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '405cb7a6-ad19-4f1b-bf0e-ef31661d8781',
        'Trà sữa sencha macchiato socola',
        'Trà sữa sencha macchiato kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        37000,
        'Trân châu đen,Trân châu trắng,Kem sữa,Socola chip',
        'active',
        '6334b6db-a167-4d8c-b6de-bfad14465b7c',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );

-- Thêm sản phầm cho Trà sữa genmaicha macchiato
INSERT INTO
    `products` (
        id,
        name,
        description,
        price,
        toppings,
        is_active,
        category_id,
        product_params_id
    )
VALUES
    (
        'bb1d61a2-ad89-4c16-9a7e-7b1508e4b4a4',
        'Trà sữa genmaicha macchiato truyền thống',
        'Trà sữa genmaicha macchiato pha chế theo công thức truyền thống, sử dụng trà genmaicha nguyên chất, sữa tươi và kem sữa béo ngậy.',
        38000,
        'Kem sữa',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '1da7b843-caf3-4c36-9a98-1758f9e32898',
        'Trà sữa genmaicha macchiato trân châu',
        'Trà sữa genmaicha macchiato kết hợp với trân châu dai dai, tạo nên hương vị thơm ngon, béo ngậy, giòn giòn.',
        43000,
        'Trân châu đen,Trân châu trắng,Kem sữa',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'e6967a1b-c4a8-409b-b444-301cacfe06e8',
        'Trà sữa genmaicha macchiato thạch',
        'Trà sữa genmaicha macchiato kết hợp với thạch dai dai, tạo nên hương vị thơm ngon, thanh mát, giòn giòn.',
        40000,
        'Thạch trái cây,Thạch dừa,Kem sữa',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '0f3c2fc3-4235-449b-a7c0-1eaf59259db0',
        'Trà sữa genmaicha macchiato trái cây',
        'Trà sữa genmaicha macchiato kết hợp với vị trái cây thanh mát, tạo nên hương vị mới lạ, độc đáo.',
        41000,
        'Thạch trái cây,Kem sữa',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        '9c6cce37-632f-4916-82da-7f627b77dd4c',
        'Trà sữa genmaicha macchiato ít ngọt',
        'Trà sữa genmaicha macchiato pha chế với lượng đường ít, phù hợp cho người ăn kiêng.',
        35000,
        'Kem sữa ít béo',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    ),
    (
        'd2023f8f-cde3-47cf-a73a-d07490a7fe0c',
        'Trà sữa genmaicha macchiato socola',
        'Trà sữa genmaicha macchiato kết hợp với socola béo ngậy, tạo nên hương vị hòa quyện hoàn hảo.',
        39000,
        'Trân châu đen,Trân châu trắng,Kem sữa,Socola chip',
        'active',
        'fab75cb4-0d93-42b0-b614-6ad1aad5d831',
        '2849b1bb-63cd-4280-8496-a94afd87e461'
    );