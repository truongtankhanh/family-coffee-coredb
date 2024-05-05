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
exports.UserEntity = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const order_entity_1 = require("./order.entity");
const user_role_entity_1 = require("./user-role.entity");
const enum_1 = require("../../../enum");
const maketing_1 = require("../maketing");
let UserEntity = class UserEntity extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.UserEntity = UserEntity;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'email',
        length: 100,
        nullable: true,
        comment: 'Địa chỉ email của người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'password',
        length: 255,
        comment: 'Mật khẩu được mã hóa của người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "password", void 0);
__decorate([
    (0, typeorm_1.Column)('nvarchar', {
        name: 'full_name',
        length: 255,
        comment: 'Họ và tên của người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "fullName", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'address', comment: 'Địa chỉ của người dùng' }),
    __metadata("design:type", String)
], UserEntity.prototype, "address", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'phone_number',
        length: 20,
        unique: true,
        comment: 'Số điện thoại của người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "phoneNumber", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của tài khoản (active/inactive)',
        enum: Object.values(enum_1.ACTIVE_STATUS),
        default: enum_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'role_id',
        length: 36,
        comment: 'Vai trò của người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "roleId", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'jwt_token',
        length: 255,
        unique: true,
        comment: 'Lưu trữ token JWT cho mỗi người dùng',
    }),
    __metadata("design:type", String)
], UserEntity.prototype, "jwtToken", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => order_entity_1.OrderEntity, _object => _object.user),
    __metadata("design:type", Promise)
], UserEntity.prototype, "orders", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => maketing_1.BlogPostEntity, _object => _object.user),
    __metadata("design:type", Promise)
], UserEntity.prototype, "blogs", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => maketing_1.CommentEntity, _object => _object.user),
    __metadata("design:type", Promise)
], UserEntity.prototype, "comments", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => maketing_1.FeedbackEntity, _object => _object.user),
    __metadata("design:type", Promise)
], UserEntity.prototype, "feedbacks", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => user_role_entity_1.UserRoleEntity, _object => _object.users),
    (0, typeorm_1.JoinColumn)([{ name: 'role_id', referencedColumnName: 'id' }]),
    __metadata("design:type", user_role_entity_1.UserRoleEntity)
], UserEntity.prototype, "role", void 0);
exports.UserEntity = UserEntity = __decorate([
    (0, typeorm_1.Entity)('users', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin người dùng cho quán cà phê',
    }),
    __metadata("design:paramtypes", [])
], UserEntity);
//# sourceMappingURL=user.entity.js.map