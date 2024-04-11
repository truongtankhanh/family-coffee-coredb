import {v4 as uuidv4} from 'uuid';
import {Column, Entity} from 'typeorm';
import {BaseEntity} from '../base-entity';
import {ACTIVE_STATUS, ActiveStatus, ROLE_TYPE, RoleType} from '../../enum';

@Entity('account', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin của người dùng',
})
export class Account extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    name: 'email',
    length: 100,
    nullable: true,
    comment: 'Địa chỉ email của người dùng',
  })
  email: string | undefined;

  @Column('varchar', {
    name: 'password',
    length: 50,
    comment: 'Mật khẩu được mã hóa của người dùng',
  })
  password: string | undefined;

  @Column('nvarchar', {
    name: 'full_name',
    length: 255,
    comment: 'Họ và tên của người dùng',
  })
  fullName: string | undefined;

  @Column('text', {name: 'address', comment: 'Địa chỉ của người dùng'})
  address: string | undefined;

  @Column('varchar', {
    name: 'phone_number',
    length: 20,
    unique: true,
    comment: 'Số điện thoại của người dùng',
  })
  phoneNumber: string | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của tài khoản (active/inactive)',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: ActiveStatus | undefined;

  @Column('enum', {
    name: 'is_role',
    comment: 'Vai trò của người dùng',
    enum: Object.values(ROLE_TYPE),
    default: ROLE_TYPE.CUSTOMER,
  })
  isRole: RoleType | undefined;

  @Column('varchar', {
    name: 'jwt_token',
    length: 255,
    nullable: true,
    comment: 'Lưu trữ token JWT cho mỗi người dùng',
  })
  jwtToken: string;
}
