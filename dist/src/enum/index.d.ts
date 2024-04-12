export declare const ACTIVE_STATUS: {
    ACTIVE: string;
    INACTIVE: string;
};
export type ActiveStatus = (typeof ACTIVE_STATUS)[keyof typeof ACTIVE_STATUS];
export declare const ORDER_STATUS: {
    CONFIRMED: string;
    OUT_FOR_DELIVERY: string;
    DELIVERED: string;
    COMPLETED: string;
    CANCELLED: string;
    PENDING_CONFIRMATION: string;
    PENDING_PROCESSING: string;
    PENDING_SHIPMENT: string;
    PENDING_PAYMENT: string;
    REFUNDED: string;
    PROCESSING: string;
    AWAITING_PAYMENT_CONFIRMATION: string;
    REATTEMPTING_DELIVERY: string;
    RETURNED: string;
    REJECTED: string;
    OTHER: string;
};
export type TypeOrderStatus = (typeof ORDER_STATUS)[keyof typeof ORDER_STATUS];
export declare const PAYMENT_STATUS: {
    UNPAID: string;
    PENDING: string;
    PAID: string;
    CANCELLED: string;
    REFUNDED: string;
    REJECTED: string;
    ERROR: string;
    PROCESSING: string;
    PENDING_CONFIRMATION: string;
    PENDING_PAYMENT_ROCESSING: string;
    FAILED: string;
    OTHER: string;
};
export type TypePaymentStatus = (typeof PAYMENT_STATUS)[keyof typeof PAYMENT_STATUS];
export declare const PAYMENT_METHOD: {
    CASH: string;
    CREDIT_CARD: string;
    BANK_TRANSFER: string;
    EWALLET: string;
    PAYPAL: string;
    ZALOPAY: string;
    MOMO: string;
    APPLE_PAY: string;
    GOOGLE_PAY: string;
    VOUCHER: string;
    OTHER: string;
};
export type TypePamentMethod = (typeof PAYMENT_METHOD)[keyof typeof PAYMENT_METHOD];
export declare const PRODUCT_STATUS: {
    ACTIVE: string;
    INACTIVE: string;
};
export type ProductStatus = (typeof PRODUCT_STATUS)[keyof typeof PRODUCT_STATUS];
export declare const ACCOUNT_STATUS: {
    ACTIVE: string;
    INACTIVE: string;
};
export type AccountStatus = (typeof ACCOUNT_STATUS)[keyof typeof ACCOUNT_STATUS];
export declare const ROLE_TYPE: {
    CUSTOMER: string;
    STAFF: string;
    ADMIN: string;
};
export type RoleType = (typeof ROLE_TYPE)[keyof typeof ROLE_TYPE];
export declare const RATING_VALUE: {
    ONE: string;
    TWO: string;
    THREE: string;
    FOUR: string;
    FIVE: string;
};
export type RatingValue = (typeof RATING_VALUE)[keyof typeof RATING_VALUE];
