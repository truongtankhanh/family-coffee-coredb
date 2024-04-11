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
exports.Payment = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const enum_1 = require("../../enum");
const order_1 = require("./order");
const base_entity_1 = require("../base-entity");
let Payment = class Payment extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Payment = Payment;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'order_id',
        length: 36,
        comment: 'ID đơn hàng liên quan đến thanh toán (khóa ngoại kết nối đến bảng Orders)',
    }),
    __metadata("design:type", String)
], Payment.prototype, "orderId", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'payment_method',
        comment: 'Phương thức thanh toán',
        enum: Object.values(enum_1.PAYMENT_METHOD),
    }),
    __metadata("design:type", String)
], Payment.prototype, "paymentMethod", void 0);
__decorate([
    (0, typeorm_1.Column)('float', { name: 'amount', comment: 'Số tiền thanh toán' }),
    __metadata("design:type", Number)
], Payment.prototype, "amount", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'payment_date',
        default: () => 'CURRENT_TIMESTAMP',
        comment: 'Ngày và thời điểm thanh toán',
    }),
    __metadata("design:type", Date)
], Payment.prototype, "paymentDate", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'status',
        comment: 'Trạng thái thanh toán',
        enum: Object.values(enum_1.PAYMENT_STATUS),
    }),
    __metadata("design:type", String)
], Payment.prototype, "status", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => order_1.Order),
    (0, typeorm_1.JoinColumn)([{ name: 'order_id', referencedColumnName: 'id' }]),
    __metadata("design:type", order_1.Order)
], Payment.prototype, "order", void 0);
exports.Payment = Payment = __decorate([
    (0, typeorm_1.Entity)('payments', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các khoản thanh toán',
    }),
    __metadata("design:paramtypes", [])
], Payment);
//# sourceMappingURL=payment.js.map