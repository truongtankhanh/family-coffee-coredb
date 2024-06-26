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
exports.ProductCategoryEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const product_entity_1 = require("./product.entity");
const category_entity_1 = require("./category.entity");
let ProductCategoryEntity = class ProductCategoryEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.ProductCategoryEntity = ProductCategoryEntity;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'product_id',
        length: 36,
        comment: 'ID sản phẩm (khóa ngoại kết nối đến bảng Products)',
    }),
    __metadata("design:type", String)
], ProductCategoryEntity.prototype, "productId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'category_id',
        length: 36,
        comment: 'ID danh mục sản phẩm (khóa ngoại kết nối đến bảng Categories)',
    }),
    __metadata("design:type", String)
], ProductCategoryEntity.prototype, "categoryId", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => product_entity_1.ProductEntity),
    (0, typeorm_1.JoinColumn)([{ name: 'product_id', referencedColumnName: 'id' }]),
    __metadata("design:type", product_entity_1.ProductEntity)
], ProductCategoryEntity.prototype, "product", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => category_entity_1.CategoryEntity),
    (0, typeorm_1.JoinColumn)([{ name: 'category_id', referencedColumnName: 'id' }]),
    __metadata("design:type", category_entity_1.CategoryEntity)
], ProductCategoryEntity.prototype, "category", void 0);
exports.ProductCategoryEntity = ProductCategoryEntity = __decorate([
    (0, typeorm_1.Entity)('product_category', {
        schema: 'family_coffee_db',
        comment: ' Lưu trữ mối quan hệ nhiều-đối-nhiều giữa các sản phẩm và danh mục sản phẩm',
    }),
    __metadata("design:paramtypes", [])
], ProductCategoryEntity);
//# sourceMappingURL=product-category.entity.js.map