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
exports.Customer = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const order_1 = require("./order");
const base_entity_1 = require("../base-entity");
let Customer = class Customer extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Customer = Customer;
__decorate([
    (0, typeorm_1.Column)('nvarchar', { length: 255, comment: 'Tên khách hàng' }),
    __metadata("design:type", String)
], Customer.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        length: 20,
        name: 'phone_number',
        comment: 'Số điện thoại khách hàng',
    }),
    __metadata("design:type", String)
], Customer.prototype, "phoneNumber", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { length: 100, nullable: true, comment: 'Địa chỉ email' }),
    __metadata("design:type", String)
], Customer.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { nullable: true, comment: 'Địa chỉ giao hàng' }),
    __metadata("design:type", String)
], Customer.prototype, "address", void 0);
__decorate([
    (0, typeorm_1.Column)('int', {
        name: 'loyalty_points',
        nullable: true,
        comment: 'Điểm tích lũy',
    }),
    __metadata("design:type", Number)
], Customer.prototype, "loyaltyPoints", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => order_1.Order, order => order.customer),
    __metadata("design:type", Promise)
], Customer.prototype, "orders", void 0);
exports.Customer = Customer = __decorate([
    (0, typeorm_1.Entity)('customers', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin khách hàng',
    }),
    __metadata("design:paramtypes", [])
], Customer);
//# sourceMappingURL=customer.js.map