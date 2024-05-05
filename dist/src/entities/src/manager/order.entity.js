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
exports.OrderEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const user_entity_1 = require("./user.entity");
const base_entity_1 = require("../base-entity");
const order_history_entity_1 = require("./order-history.entity");
const order_status_entity_1 = require("./order-status.entity");
const payment_status_entity_1 = require("./payment-status.entity");
let OrderEntity = class OrderEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.OrderEntity = OrderEntity;
__decorate([
    (0, typeorm_1.Column)('decimal', {
        name: 'total_amount',
        comment: 'Tổng số tiền của đơn hàng',
    }),
    __metadata("design:type", Number)
], OrderEntity.prototype, "totalAmount", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'delivery_address', comment: 'Địa chỉ giao hàng' }),
    __metadata("design:type", String)
], OrderEntity.prototype, "deliveryAddress", void 0);
__decorate([
    (0, typeorm_1.Column)('decimal', {
        name: 'delivery_fee',
        comment: 'Phí giao hàng (nếu có)',
        default: 0,
    }),
    __metadata("design:type", Number)
], OrderEntity.prototype, "deliveryFee", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Ghi chú của khách hàng' }),
    __metadata("design:type", String)
], OrderEntity.prototype, "note", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'order_status_id',
        length: 36,
        comment: 'Trạng thái đơn hàng',
    }),
    __metadata("design:type", String)
], OrderEntity.prototype, "orderStatusId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'payment_status_id',
        comment: 'Trạng thái thanh toán',
    }),
    __metadata("design:type", String)
], OrderEntity.prototype, "paymentStatusId", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'paid_at',
        nullable: true,
        comment: 'Thời điểm khách hàng thanh toán cho đơn hàng',
    }),
    __metadata("design:type", Date)
], OrderEntity.prototype, "paidAt", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'cancel_at',
        nullable: true,
        comment: 'Thời điểm khách hàng huỷ đơn hàng',
    }),
    __metadata("design:type", Date)
], OrderEntity.prototype, "cancelAt", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], OrderEntity.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => user_entity_1.UserEntity, _object => _object.orders),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", user_entity_1.UserEntity)
], OrderEntity.prototype, "user", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => order_history_entity_1.OrderHistoryEntity, _object => _object.order),
    __metadata("design:type", Promise)
], OrderEntity.prototype, "orderHistories", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => order_status_entity_1.OrderStatusEntity, _object => _object.orders),
    (0, typeorm_1.JoinColumn)([{ name: 'order_status_id', referencedColumnName: 'id' }]),
    __metadata("design:type", order_status_entity_1.OrderStatusEntity)
], OrderEntity.prototype, "orderStatus", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => payment_status_entity_1.PaymentStatusEntity, _object => _object.orders),
    (0, typeorm_1.JoinColumn)([{ name: 'payment_status_id', referencedColumnName: 'id' }]),
    __metadata("design:type", payment_status_entity_1.PaymentStatusEntity)
], OrderEntity.prototype, "paymentStatus", void 0);
exports.OrderEntity = OrderEntity = __decorate([
    (0, typeorm_1.Entity)('orders', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các đơn hàng',
    }),
    __metadata("design:paramtypes", [])
], OrderEntity);
//# sourceMappingURL=order.entity.js.map