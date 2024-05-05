export const ACTIVE_STATUS = {
  ACTIVE: 'active',
  INACTIVE: 'inactive',
};

export type ActiveStatus = (typeof ACTIVE_STATUS)[keyof typeof ACTIVE_STATUS];

export const ORDER_STATUS = {
  CONFIRMED: 'Đã xác nhận',
  OUT_FOR_DELIVERY: 'Đang giao hàng',
  DELIVERED: 'Đã giao hàng',
  COMPLETED: 'Đã hoàn thành',
  CANCELLED: 'Đã hủy',
  PENDING_CONFIRMATION: 'Đang chờ xác nhận',
  PENDING_PROCESSING: 'Đang chờ xử lý',
  PENDING_SHIPMENT: 'Đang chờ vận chuyển',
  PENDING_PAYMENT: 'Đang chờ thanh toán',
  REFUNDED: 'Đã trả lại',
  PROCESSING: 'Đang xử lý',
  AWAITING_PAYMENT_CONFIRMATION: 'Chờ xác nhận thanh toán',
  REATTEMPTING_DELIVERY: 'Đang giao lại',
  RETURNED: 'Hoàn lại',
  REJECTED: 'Đã từ chối',
  OTHER: 'Khác',
};

export type TypeOrderStatus = (typeof ORDER_STATUS)[keyof typeof ORDER_STATUS];

export const PAYMENT_STATUS = {
  UNPAID: 'Chưa thanh toán',
  PENDING: 'Đang chờ thanh toán',
  PAID: 'Đã thanh toán',
  CANCELLED: 'Đã hủy',
  REFUNDED: 'Đã hoàn trả',
  REJECTED: 'Đã từ chối',
  ERROR: 'Lỗi',
  PROCESSING: 'Đang xử lý',
  PENDING_CONFIRMATION: 'Chờ xác nhận',
  PENDING_PAYMENT_ROCESSING: 'Chờ xử lý thanh toán',
  FAILED: 'Thất bại',
  OTHER: 'Khác',
};

export type TypePaymentStatus =
  (typeof PAYMENT_STATUS)[keyof typeof PAYMENT_STATUS];

export const PAYMENT_METHOD = {
  CASH: 'Tiền mặt',
  CREDIT_CARD: 'Thẻ tín dụng',
  BANK_TRANSFER: 'Chuyển khoản ngân hàng',
  EWALLET: 'Ví điện tử',
  PAYPAL: 'Paypal',
  ZALOPAY: 'ZaloPay',
  MOMO: 'Momo',
  APPLE_PAY: 'Apple Pay',
  GOOGLE_PAY: 'Google Pay',
  VOUCHER: 'Voucher',
  OTHER: 'Khác',
};

export type TypePamentMethod =
  (typeof PAYMENT_METHOD)[keyof typeof PAYMENT_METHOD];

export const PRODUCT_STATUS = {
  ACTIVE: 'active',
  INACTIVE: 'inactive',
};

export type ProductStatus =
  (typeof PRODUCT_STATUS)[keyof typeof PRODUCT_STATUS];

export const ACCOUNT_STATUS = {
  ACTIVE: 'active',
  INACTIVE: 'inactive',
};

export type AccountStatus =
  (typeof ACCOUNT_STATUS)[keyof typeof ACCOUNT_STATUS];

export const ROLE_TYPE = {
  CUSTOMER: 'customer',
  STAFF: 'staff',
  ADMIN: 'Admin',
};

export type RoleType = (typeof ROLE_TYPE)[keyof typeof ROLE_TYPE];

export const RATING_VALUE = {
  ONE: '1',
  TWO: '2',
  THREE: '3',
  FOUR: '4',
  FIVE: '5',
};

export type RatingValue = (typeof RATING_VALUE)[keyof typeof RATING_VALUE];
