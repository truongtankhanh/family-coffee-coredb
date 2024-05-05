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
exports.BlogPostEntity = void 0;
const uuid_1 = require("uuid");
const enums_1 = require("@apps/enums");
const typeorm_1 = require("typeorm");
const manager_1 = require("../manager");
const base_entity_1 = require("../base-entity");
const comment_entity_1 = require("./comment.entity");
let BlogPostEntity = class BlogPostEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.BlogPostEntity = BlogPostEntity;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'title', comment: 'Tiêu đề bài viết' }),
    __metadata("design:type", String)
], BlogPostEntity.prototype, "title", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'content', comment: 'Nội dung bài viết' }),
    __metadata("design:type", String)
], BlogPostEntity.prototype, "content", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của bài viết (active/inactive)',
        enum: Object.values(enums_1.ACTIVE_STATUS),
        default: enums_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], BlogPostEntity.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], BlogPostEntity.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => comment_entity_1.CommentEntity, _object => _object.blogPost),
    __metadata("design:type", Promise)
], BlogPostEntity.prototype, "comments", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => manager_1.UserEntity, _object => _object.blogs),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", manager_1.UserEntity)
], BlogPostEntity.prototype, "user", void 0);
exports.BlogPostEntity = BlogPostEntity = __decorate([
    (0, typeorm_1.Entity)('blog_posts', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin các bài viết blog',
    }),
    __metadata("design:paramtypes", [])
], BlogPostEntity);
//# sourceMappingURL=blog-post.entity.js.map