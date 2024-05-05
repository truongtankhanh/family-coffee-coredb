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
exports.UserRoleEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const user_entity_1 = require("./user.entity");
const base_entity_1 = require("../base-entity");
let UserRoleEntity = class UserRoleEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.UserRoleEntity = UserRoleEntity;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        length: 50,
        comment: 'Vai trò của người dùng',
    }),
    __metadata("design:type", String)
], UserRoleEntity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { comment: 'Mô tả về vai trò của người dùng' }),
    __metadata("design:type", String)
], UserRoleEntity.prototype, "description", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => user_entity_1.UserEntity, _object => _object.role),
    __metadata("design:type", Promise)
], UserRoleEntity.prototype, "users", void 0);
exports.UserRoleEntity = UserRoleEntity = __decorate([
    (0, typeorm_1.Entity)('user_roles', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ về các vai trò của người dùng',
    }),
    __metadata("design:paramtypes", [])
], UserRoleEntity);
//# sourceMappingURL=user-role.entity.js.map