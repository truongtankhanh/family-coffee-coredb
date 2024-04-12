"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RATING_VALUE = exports.ROLE_TYPE = exports.ACCOUNT_STATUS = exports.PRODUCT_STATUS = exports.PAYMENT_METHOD = exports.PAYMENT_STATUS = exports.ORDER_STATUS = exports.ACTIVE_STATUS = void 0;
exports.ACTIVE_STATUS = {
    ACTIVE: 'active',
    INACTIVE: 'inactive',
};
exports.ORDER_STATUS = {
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
exports.PAYMENT_STATUS = {
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
exports.PAYMENT_METHOD = {
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
exports.PRODUCT_STATUS = {
    ACTIVE: 'active',
    INACTIVE: 'inactive',
};
exports.ACCOUNT_STATUS = {
    ACTIVE: 'active',
    INACTIVE: 'inactive',
};
exports.ROLE_TYPE = {
    CUSTOMER: 'customer',
    STAFF: 'staff',
    ADMIN: 'admin',
};
exports.RATING_VALUE = {
    ONE: '1',
    TWO: '2',
    THREE: '3',
    FOUR: '4',
    FIVE: '5',
};
//# sourceMappingURL=index.js.map