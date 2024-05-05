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
exports.OrderStatusEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const order_entity_1 = require("./order.entity");
let OrderStatusEntity = class OrderStatusEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.OrderStatusEntity = OrderStatusEntity;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        length: 50,
        comment: 'Trạng thái đơn hàng',
    }),
    __metadata("design:type", String)
], OrderStatusEntity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Mô tả về trạng thái đơn hàng' }),
    __metadata("design:type", String)
], OrderStatusEntity.prototype, "description", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => order_entity_1.OrderEntity, _object => _object.orderStatus),
    __metadata("design:type", Promise)
], OrderStatusEntity.prototype, "orders", void 0);
exports.OrderStatusEntity = OrderStatusEntity = __decorate([
    (0, typeorm_1.Entity)('order_statuses', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các trạng thái đơn hàng',
    }),
    __metadata("design:paramtypes", [])
], OrderStatusEntity);
//# sourceMappingURL=order-status.entity.js.map