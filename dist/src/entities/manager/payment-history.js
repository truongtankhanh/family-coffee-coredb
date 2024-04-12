"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PaymentHistory = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const order_1 = require("./order");
const payment_1 = require("./payment");
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let PaymentHistory = class PaymentHistory extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.PaymentHistory = PaymentHistory;
__decorate([
    (0, typeorm_1.Column)('int', {
        name: 'payment_id',
        comment: 'ID thanh toán (khóa ngoại kết nối đến bảng Payments)',
    }),
    __metadata("design:type", Number)
], PaymentHistory.prototype, "paymentId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'order_id',
        length: 36,
        comment: 'ID đơn hàng liên quan đến thanh toán (khóa ngoại kết nối đến bảng Orders)',
    }),
    __metadata("design:type", String)
], PaymentHistory.prototype, "orderId", void 0);
__decorate([
    (0, typeorm_1.Column)('float', { name: 'amount', comment: 'Số tiền thanh toán' }),
    __metadata("design:type", Number)
], PaymentHistory.prototype, "amount", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'status',
        comment: 'Trạng thái thanh toán',
        enum: Object.values(enum_1.PAYMENT_STATUS),
    }),
    __metadata("design:type", String)
], PaymentHistory.prototype, "status", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => payment_1.Payment),
    (0, typeorm_1.JoinColumn)([{ name: 'payment_id', referencedColumnName: 'id' }]),
    __metadata("design:type", payment_1.Payment)
], PaymentHistory.prototype, "payment", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => order_1.Order),
    (0, typeorm_1.JoinColumn)([{ name: 'order_id', referencedColumnName: 'id' }]),
    __metadata("design:type", order_1.Order)
], PaymentHistory.prototype, "order", void 0);
exports.PaymentHistory = PaymentHistory = __decorate([
    (0, typeorm_1.Entity)('payment_history', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ lịch sử chi tiết về các khoản thanh toán',
    }),
    __metadata("design:paramtypes", [])
], PaymentHistory);
//# sourceMappingURL=payment-history.js.map