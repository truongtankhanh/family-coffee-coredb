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
exports.RatingEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const enums_1 = require("@apps/enums");
const base_entity_1 = require("../base-entity");
const comment_entity_1 = require("./comment.entity");
const feedback_entity_1 = require("./feedback.entity");
let RatingEntity = class RatingEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.RatingEntity = RatingEntity;
__decorate([
    (0, typeorm_1.Column)('enum', {
        comment: 'Tên đánh giá',
        enum: Object.keys(enums_1.RATING_VALUE),
    }),
    __metadata("design:type", String)
], RatingEntity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { length: 10, comment: 'Giá trị đánh giá' }),
    __metadata("design:type", String)
], RatingEntity.prototype, "value", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => comment_entity_1.CommentEntity, _object => _object.rating),
    __metadata("design:type", Promise)
], RatingEntity.prototype, "comments", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => feedback_entity_1.FeedbackEntity, _object => _object.rating),
    __metadata("design:type", Promise)
], RatingEntity.prototype, "feedbacks", void 0);
exports.RatingEntity = RatingEntity = __decorate([
    (0, typeorm_1.Entity)('rating', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ các mức đánh giá',
    }),
    __metadata("design:paramtypes", [])
], RatingEntity);
//# sourceMappingURL=rating.entity.js.map