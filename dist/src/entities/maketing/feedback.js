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
exports.Feedback = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const manager_1 = require("../manager");
const restaurant_1 = require("./restaurant");
const base_entity_1 = require("../base-entity");
let Feedback = class Feedback extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Feedback = Feedback;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'message', comment: 'Nội dung phản hồi' }),
    __metadata("design:type", String)
], Feedback.prototype, "message", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'restaurant_id', length: 36 }),
    __metadata("design:type", String)
], Feedback.prototype, "restaurantId", void 0);
__decorate([
    (0, typeorm_1.Column)('int', { comment: 'Đánh giá của khách hàng' }),
    __metadata("design:type", Number)
], Feedback.prototype, "rating", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], Feedback.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => restaurant_1.Restaurant, _object => _object.feedback),
    (0, typeorm_1.JoinColumn)([{ name: 'restaurant_id', referencedColumnName: 'id' }]),
    __metadata("design:type", restaurant_1.Restaurant)
], Feedback.prototype, "restaurant", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => manager_1.User, _object => _object.blogs),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", manager_1.User)
], Feedback.prototype, "user", void 0);
exports.Feedback = Feedback = __decorate([
    (0, typeorm_1.Entity)('feedback', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng',
    }),
    __metadata("design:paramtypes", [])
], Feedback);
//# sourceMappingURL=feedback.js.map