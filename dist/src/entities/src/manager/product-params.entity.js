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
exports.ProductParamsEnity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const category_entity_1 = require("./category.entity");
let ProductParamsEnity = class ProductParamsEnity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.ProductParamsEnity = ProductParamsEnity;
__decorate([
    (0, typeorm_1.Column)('varchar', { comment: 'Tên size sản phẩm' }),
    __metadata("design:type", String)
], ProductParamsEnity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('int', { comment: 'Dung tích sản phẩm theo size(đơn vị là ml)' }),
    __metadata("design:type", Number)
], ProductParamsEnity.prototype, "capacity", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', { name: 'category_id', length: 36 }),
    __metadata("design:type", String)
], ProductParamsEnity.prototype, "categoryId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => category_entity_1.CategoryEntity, _object => _object.productParams),
    (0, typeorm_1.JoinColumn)([{ name: 'category_id', referencedColumnName: 'id' }]),
    __metadata("design:type", category_entity_1.CategoryEntity)
], ProductParamsEnity.prototype, "category", void 0);
exports.ProductParamsEnity = ProductParamsEnity = __decorate([
    (0, typeorm_1.Entity)('product_params', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin về các size của sản phẩm',
    }),
    __metadata("design:paramtypes", [])
], ProductParamsEnity);
//# sourceMappingURL=product-params.entity.js.map