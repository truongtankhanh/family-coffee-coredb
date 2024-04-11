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
exports.BlogPost = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const comment_1 = require("./comment");
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let BlogPost = class BlogPost extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.BlogPost = BlogPost;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'title', comment: 'Tiêu đề bài viết' }),
    __metadata("design:type", String)
], BlogPost.prototype, "title", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'content', comment: 'Nội dung bài viết' }),
    __metadata("design:type", String)
], BlogPost.prototype, "content", void 0);
__decorate([
    (0, typeorm_1.Column)('nvarchar', {
        name: 'author',
        length: 255,
        comment: 'Tác giả bài viết',
    }),
    __metadata("design:type", String)
], BlogPost.prototype, "author", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'category', comment: 'Danh mục của bài viết' }),
    __metadata("design:type", String)
], BlogPost.prototype, "category", void 0);
__decorate([
    (0, typeorm_1.Column)('datetime', {
        name: 'published_at',
        default: () => 'CURRENT_TIMESTAMP',
    }),
    __metadata("design:type", Date)
], BlogPost.prototype, "publishedAt", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của bài viết (active/inactive)',
        enum: Object.values(enum_1.ACTIVE_STATUS),
        default: enum_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], BlogPost.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => comment_1.Comment, comment => comment.blogPost),
    __metadata("design:type", Promise)
], BlogPost.prototype, "comments", void 0);
exports.BlogPost = BlogPost = __decorate([
    (0, typeorm_1.Entity)('blog_posts', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin các bài viết blog',
    }),
    __metadata("design:paramtypes", [])
], BlogPost);
//# sourceMappingURL=blog-post.js.map