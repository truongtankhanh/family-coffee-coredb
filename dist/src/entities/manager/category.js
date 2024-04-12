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
exports.Category = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const product_1 = require("./product");
const enum_1 = require("../../enum");
const base_entity_1 = require("../base-entity");
let Category = class Category extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Category = Category;
__decorate([
    (0, typeorm_1.Column)('nvarchar', { length: 255, comment: 'Tên danh mục sản phẩm' }),
    __metadata("design:type", String)
], Category.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Mô tả ngắn gọn về danh mục' }),
    __metadata("design:type", String)
], Category.prototype, "description", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của danh mục',
        enum: Object.values(enum_1.ACTIVE_STATUS),
        default: enum_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", Boolean)
], Category.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.Column)('int', {
        name: 'parent_id',
        nullable: true,
        comment: 'ID danh mục cha (để hỗ trợ danh mục con, khóa ngoại tham chiếu đến chính bảng Categories)',
    }),
    __metadata("design:type", Number)
], Category.prototype, "parentId", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => product_1.Product, _object => _object.category),
    __metadata("design:type", Promise)
], Category.prototype, "products", void 0);
exports.Category = Category = __decorate([
    (0, typeorm_1.Entity)('categories', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ danh mục sản phẩm cho quán cà phê',
    }),
    __metadata("design:paramtypes", [])
], Category);
//# sourceMappingURL=category.js.map