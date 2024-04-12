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
exports.Restaurant = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const feedback_1 = require("./feedback");
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let Restaurant = class Restaurant extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Restaurant = Restaurant;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'description', comment: 'Mô tả về quán' }),
    __metadata("design:type", String)
], Restaurant.prototype, "description", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'address', comment: 'Địa chỉ quán' }),
    __metadata("design:type", String)
], Restaurant.prototype, "address", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'phone_number',
        length: 20,
        comment: 'Số điện thoại quán',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "phoneNumber", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'email',
        length: 100,
        comment: 'Địa chỉ email liên hệ',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'working_hours',
        length: 35,
        comment: 'Giờ mở cửa và đóng cửa của quán',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "workingHours", void 0);
__decorate([
    (0, typeorm_1.Column)('text', {
        name: 'social_media',
        comment: 'Lưu trữ các liên kết đến trang mạng xã hội của nhà hàng',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "socialMedia", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Đường dẫn ảnh đại diện của nhà hàng' }),
    __metadata("design:type", String)
], Restaurant.prototype, "image", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của nhà hàng (active/inactive)',
        enum: Object.values(enum_1.ACTIVE_STATUS),
        default: enum_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => feedback_1.Feedback, feedback => feedback.restaurant),
    __metadata("design:type", Promise)
], Restaurant.prototype, "feedback", void 0);
exports.Restaurant = Restaurant = __decorate([
    (0, typeorm_1.Entity)('restaurant', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các nhà hàng',
    }),
    __metadata("design:paramtypes", [])
], Restaurant);
//# sourceMappingURL=restaurant.js.map