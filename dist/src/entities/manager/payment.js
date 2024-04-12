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
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let Payment = class Payment extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Payment = Payment;
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'payment_method',
        comment: 'Phương thức thanh toán',
        enum: Object.values(enum_1.PAYMENT_METHOD),
    }),
    __metadata("design:type", String)
], Payment.prototype, "paymentMethod", void 0);
exports.Payment = Payment = __decorate([
    (0, typeorm_1.Entity)('payments', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các khoản thanh toán',
    }),
    __metadata("design:paramtypes", [])
], Payment);
//# sourceMappingURL=payment.js.map