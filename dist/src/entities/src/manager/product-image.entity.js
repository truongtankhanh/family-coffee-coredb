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
exports.ProductImageEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const product_entity_1 = require("./product.entity");
let ProductImageEntity = class ProductImageEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.ProductImageEntity = ProductImageEntity;
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'product_id', length: 36, comment: 'ID sản phẩm' }),
    __metadata("design:type", String)
], ProductImageEntity.prototype, "productId", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'image_url', comment: 'URL ảnh sản phẩm' }),
    __metadata("design:type", String)
], ProductImageEntity.prototype, "imageUrl", void 0);
__decorate([
    (0, typeorm_1.Column)('bool', {
        name: 'is_main',
        comment: 'Ảnh đại diện cho sản phẩm',
        default: false,
    }),
    __metadata("design:type", Boolean)
], ProductImageEntity.prototype, "isMain", void 0);
__decorate([
    (0, typeorm_1.Column)('text', {
        name: 'thumbnail_url',
        nullable: true,
        comment: 'URL đường dẫn đến ảnh thu gọn của ảnh chính',
    }),
    __metadata("design:type", String)
], ProductImageEntity.prototype, "thumbnailUrl", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => product_entity_1.ProductEntity, _object => _object.images),
    (0, typeorm_1.JoinColumn)([{ name: 'product_id', referencedColumnName: 'id' }]),
    __metadata("design:type", product_entity_1.ProductEntity)
], ProductImageEntity.prototype, "product", void 0);
exports.ProductImageEntity = ProductImageEntity = __decorate([
    (0, typeorm_1.Entity)('product_images', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các ảnh sản phẩm',
    }),
    __metadata("design:paramtypes", [])
], ProductImageEntity);
//# sourceMappingURL=product-image.entity.js.map