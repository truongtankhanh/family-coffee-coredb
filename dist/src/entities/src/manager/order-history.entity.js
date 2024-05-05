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
exports.OrderHistoryEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const order_entity_1 = require("./order.entity");
const product_entity_1 = require("./product.entity");
let OrderHistoryEntity = class OrderHistoryEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.OrderHistoryEntity = OrderHistoryEntity;
__decorate([
    (0, typeorm_1.Column)('int', {
        comment: 'Số lượng sản phẩm được đặt trong đơn hàng',
    }),
    __metadata("design:type", Number)
], OrderHistoryEntity.prototype, "quantity", void 0);
__decorate([
    (0, typeorm_1.Column)('int', {
        name: 'subtotal',
        comment: 'Tổng giá của sản phẩm trong đơn hàng, tự động tính toán',
    }),
    __metadata("design:type", Number)
], OrderHistoryEntity.prototype, "subtotal", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'order_id',
        length: 36,
        comment: 'ID của đơn hàng',
    }),
    __metadata("design:type", String)
], OrderHistoryEntity.prototype, "orderId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => order_entity_1.OrderEntity, _object => _object.orderHistories),
    (0, typeorm_1.JoinColumn)([{ name: 'order_id', referencedColumnName: 'id' }]),
    __metadata("design:type", order_entity_1.OrderEntity)
], OrderHistoryEntity.prototype, "order", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'product_id',
        length: 36,
        comment: 'ID của sản phẩm',
    }),
    __metadata("design:type", String)
], OrderHistoryEntity.prototype, "productId", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => product_entity_1.ProductEntity),
    (0, typeorm_1.JoinColumn)([{ name: 'product_id', referencedColumnName: 'id' }]),
    __metadata("design:type", product_entity_1.ProductEntity)
], OrderHistoryEntity.prototype, "product", void 0);
exports.OrderHistoryEntity = OrderHistoryEntity = __decorate([
    (0, typeorm_1.Entity)('order_history', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ chi tiết các sản phẩm trong một đơn hàng',
    }),
    __metadata("design:paramtypes", [])
], OrderHistoryEntity);
//# sourceMappingURL=order-history.entity.js.map