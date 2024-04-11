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
exports.ProductImage = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const product_1 = require("./product");
const base_entity_1 = require("../base-entity");
let ProductImage = class ProductImage extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.ProductImage = ProductImage;
__decorate([
    (0, typeorm_1.Column)('text', { name: 'product_id', comment: 'ID sản phẩm' }),
    __metadata("design:type", String)
], ProductImage.prototype, "productId", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'image_url', comment: 'URL ảnh sản phẩm' }),
    __metadata("design:type", String)
], ProductImage.prototype, "imageUrl", void 0);
__decorate([
    (0, typeorm_1.Column)('boolean', {
        name: 'is_main',
        comment: 'Ảnh đại diện cho sản phẩm',
        default: false,
    }),
    __metadata("design:type", Boolean)
], ProductImage.prototype, "isMain", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => product_1.Product, _object => _object.images),
    (0, typeorm_1.JoinColumn)([{ name: 'product_id', referencedColumnName: 'id' }]),
    __metadata("design:type", product_1.Product)
], ProductImage.prototype, "product", void 0);
exports.ProductImage = ProductImage = __decorate([
    (0, typeorm_1.Entity)('product_images', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các ảnh sản phẩm',
    }),
    __metadata("design:paramtypes", [])
], ProductImage);
//# sourceMappingURL=product_image.js.map