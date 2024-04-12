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
exports.Order = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const user_1 = require("./user");
const base_entity_1 = require("../base-entity");
const order_history_1 = require("./order-history");
const enum_1 = require("../../enum");
let Order = class Order extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Order = Order;
__decorate([
    (0, typeorm_1.Column)('decimal', {
        name: 'total_amount',
        comment: 'Tổng số tiền của đơn hàng',
    }),
    __metadata("design:type", Number)
], Order.prototype, "totalAmount", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'delivery_address', comment: 'Địa chỉ giao hàng' }),
    __metadata("design:type", String)
], Order.prototype, "deliveryAddress", void 0);
__decorate([
    (0, typeorm_1.Column)('decimal', {
        name: 'delivery_fee',
        comment: 'Phí giao hàng (nếu có)',
        default: 0,
    }),
    __metadata("design:type", Number)
], Order.prototype, "deliveryFee", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Ghi chú của khách hàng' }),
    __metadata("design:type", String)
], Order.prototype, "note", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'order_status',
        comment: 'Trạng thái đơn hàng',
        enum: Object.values(enum_1.ORDER_STATUS),
    }),
    __metadata("design:type", String)
], Order.prototype, "orderStatus", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'payment_status',
        comment: 'Trạng thái thanh toán',
        enum: Object.values(enum_1.PAYMENT_STATUS),
    }),
    __metadata("design:type", String)
], Order.prototype, "paymentStatus", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'paid_at',
        nullable: true,
        comment: 'Thời điểm khách hàng thanh toán cho đơn hàng',
    }),
    __metadata("design:type", Date)
], Order.prototype, "paidAt", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'cancel_at',
        nullable: true,
        comment: 'Thời điểm khách hàng huỷ đơn hàng',
    }),
    __metadata("design:type", Date)
], Order.prototype, "cancelAt", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], Order.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => user_1.User, _object => _object.orders),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", user_1.User)
], Order.prototype, "user", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => order_history_1.OrderHistory, _object => _object.order),
    __metadata("design:type", Promise)
], Order.prototype, "orderHistories", void 0);
exports.Order = Order = __decorate([
    (0, typeorm_1.Entity)('orders', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các đơn hàng',
    }),
    __metadata("design:paramtypes", [])
], Order);
//# sourceMappingURL=order.js.map