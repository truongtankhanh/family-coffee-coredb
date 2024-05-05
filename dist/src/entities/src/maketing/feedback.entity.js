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
exports.FeedbackEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const manager_1 = require("../manager");
const base_entity_1 = require("../base-entity");
const rating_entity_1 = require("./rating.entity");
const restaurant_entity_1 = require("./restaurant.entity");
let FeedbackEntity = class FeedbackEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.FeedbackEntity = FeedbackEntity;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'message', comment: 'Nội dung phản hồi' }),
    __metadata("design:type", String)
], FeedbackEntity.prototype, "message", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'restaurant_id', length: 36 }),
    __metadata("design:type", String)
], FeedbackEntity.prototype, "restaurantId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'rate_id',
        length: 36,
        comment: 'Đánh giá của người dùng (1-5 sao)',
    }),
    __metadata("design:type", String)
], FeedbackEntity.prototype, "rateId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], FeedbackEntity.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => restaurant_entity_1.RestaurantEntity, _object => _object.feedback),
    (0, typeorm_1.JoinColumn)([{ name: 'restaurant_id', referencedColumnName: 'id' }]),
    __metadata("design:type", restaurant_entity_1.RestaurantEntity)
], FeedbackEntity.prototype, "restaurant", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => manager_1.UserEntity, _object => _object.blogs),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", manager_1.UserEntity)
], FeedbackEntity.prototype, "user", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => rating_entity_1.RatingEntity, _object => _object.feedbacks),
    (0, typeorm_1.JoinColumn)([{ name: 'rate_id', referencedColumnName: 'id' }]),
    __metadata("design:type", rating_entity_1.RatingEntity)
], FeedbackEntity.prototype, "rating", void 0);
exports.FeedbackEntity = FeedbackEntity = __decorate([
    (0, typeorm_1.Entity)('feedback', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng',
    }),
    __metadata("design:paramtypes", [])
], FeedbackEntity);
//# sourceMappingURL=feedback.entity.js.map