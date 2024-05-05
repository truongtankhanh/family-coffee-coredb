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
exports.ProductEntity = void 0;
const uuid_1 = require("uuid");
const enums_1 = require("@apps/enums");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const category_entity_1 = require("./category.entity");
const product_image_entity_1 = require("./product-image.entity");
const product_params_entity_1 = require("./product-params.entity");
let ProductEntity = class ProductEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.ProductEntity = ProductEntity;
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Tên sản phẩm' }),
    __metadata("design:type", String)
], ProductEntity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Mô tả sản phẩm' }),
    __metadata("design:type", String)
], ProductEntity.prototype, "description", void 0);
__decorate([
    (0, typeorm_1.Column)('float', { comment: 'Giá sản phẩm' }),
    __metadata("design:type", Number)
], ProductEntity.prototype, "price", void 0);
__decorate([
    (0, typeorm_1.Column)('text', {
        nullable: true,
        comment: 'Topings hoặc thành phần của sản phẩm',
    }),
    __metadata("design:type", String)
], ProductEntity.prototype, "toppings", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của sản phẩm (active/inactive)',
        enum: Object.values(enums_1.ACTIVE_STATUS),
        default: enums_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], ProductEntity.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'category_id', length: 36 }),
    __metadata("design:type", String)
], ProductEntity.prototype, "categoryId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => category_entity_1.CategoryEntity, _object => _object.products),
    (0, typeorm_1.JoinColumn)([{ name: 'category_id', referencedColumnName: 'id' }]),
    __metadata("design:type", category_entity_1.CategoryEntity)
], ProductEntity.prototype, "category", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => product_image_entity_1.ProductImageEntity, _object => _object.product),
    __metadata("design:type", Promise)
], ProductEntity.prototype, "images", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'product_params_id', length: 36 }),
    __metadata("design:type", String)
], ProductEntity.prototype, "productParamsId", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => product_params_entity_1.ProductParamsEnity),
    (0, typeorm_1.JoinColumn)([{ name: 'product_params_id', referencedColumnName: 'id' }]),
    __metadata("design:type", product_params_entity_1.ProductParamsEnity)
], ProductEntity.prototype, "productParams", void 0);
exports.ProductEntity = ProductEntity = __decorate([
    (0, typeorm_1.Entity)('products', {
        schema: 'family_coffee_db',
        comment: ' Lưu trữ thông tin về các sản phẩm được bán tại quán cà phê',
    }),
    __metadata("design:paramtypes", [])
], ProductEntity);
//# sourceMappingURL=product.entity.js.map