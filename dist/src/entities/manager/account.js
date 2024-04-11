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
exports.Account = void 0;
const uuid_1 = require("uuid");
const typeorm_1 = require("typeorm");
const base_entity_1 = require("../base-entity");
const enum_1 = require("../../enum");
let Account = class Account extends base_entity_1.BaseEntity {
    constructor() {
        super();
        this.id = (0, uuid_1.v4)();
    }
};
exports.Account = Account;
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'email',
        length: 100,
        nullable: true,
        comment: 'Địa chỉ email của người dùng',
    }),
    __metadata("design:type", String)
], Account.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'password',
        length: 50,
        comment: 'Mật khẩu được mã hóa của người dùng',
    }),
    __metadata("design:type", String)
], Account.prototype, "password", void 0);
__decorate([
    (0, typeorm_1.Column)('nvarchar', {
        name: 'full_name',
        length: 255,
        comment: 'Họ và tên của người dùng',
    }),
    __metadata("design:type", String)
], Account.prototype, "fullName", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { name: 'address', comment: 'Địa chỉ của người dùng' }),
    __metadata("design:type", String)
], Account.prototype, "address", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'phone_number',
        length: 20,
        unique: true,
        comment: 'Số điện thoại của người dùng',
    }),
    __metadata("design:type", String)
], Account.prototype, "phoneNumber", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_active',
        comment: 'Trạng thái hoạt động của tài khoản (active/inactive)',
        enum: Object.values(enum_1.ACTIVE_STATUS),
        default: enum_1.ACTIVE_STATUS.ACTIVE,
    }),
    __metadata("design:type", String)
], Account.prototype, "isActive", void 0);
__decorate([
    (0, typeorm_1.Column)('enum', {
        name: 'is_role',
        comment: 'Vai trò của người dùng',
        enum: Object.values(enum_1.ROLE_TYPE),
        default: enum_1.ROLE_TYPE.CUSTOMER,
    }),
    __metadata("design:type", String)
], Account.prototype, "isRole", void 0);
__decorate([
    (0, typeorm_1.Column)('varchar', {
        name: 'jwt_token',
        length: 255,
        nullable: true,
        comment: 'Lưu trữ token JWT cho mỗi người dùng',
    }),
    __metadata("design:type", String)
], Account.prototype, "jwtToken", void 0);
exports.Account = Account = __decorate([
    (0, typeorm_1.Entity)('account', {
        schema: 'family_coffee_db',
        comment: 'Lưu trữ thông tin của người dùng',
    }),
    __metadata("design:paramtypes", [])
], Account);
//# sourceMappingURL=account.js.map