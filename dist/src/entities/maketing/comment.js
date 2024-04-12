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
exports.Comment = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const manager_1 = require("../manager");
const blog_post_1 = require("./blog-post");
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let Comment = class Comment extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Comment = Comment;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'content', comment: 'Nội dung bình luận' }),
    __metadata("design:type", String)
], Comment.prototype, "content", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        comment: 'Đánh giá của người dùng (1-5 sao)',
        enum: Object.values(enum_1.RATING_VALUE),
    }),
    __metadata("design:type", String)
], Comment.prototype, "rating", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'blog_id', length: 36 }),
    __metadata("design:type", String)
], Comment.prototype, "blogId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'user_id', length: 36 }),
    __metadata("design:type", String)
], Comment.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => blog_post_1.BlogPost, _object => _object.comments),
    (0, typeorm_1.JoinColumn)([{ name: 'blog_id', referencedColumnName: 'id' }]),
    __metadata("design:type", blog_post_1.BlogPost)
], Comment.prototype, "blogPost", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => manager_1.User, _object => _object.blogs),
    (0, typeorm_1.JoinColumn)([{ name: 'user_id', referencedColumnName: 'id' }]),
    __metadata("design:type", manager_1.User)
], Comment.prototype, "user", void 0);
exports.Comment = Comment = __decorate([
    (0, typeorm_1.Entity)('comments', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin bình luận của người dùng về các bài viết blog',
    }),
    __metadata("design:paramtypes", [])
], Comment);
//# sourceMappingURL=comment.js.map