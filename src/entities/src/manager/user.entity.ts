import {v4 as uuidv4} from 'uuid';
import {ACTIVE_STATUS, ActiveStatus} from '@apps/enums';
import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {OrderEntity} from './order.entity';
import {UserRoleEntity} from './user-role.entity';
import {BlogPostEntity, CommentEntity, FeedbackEntity} from '../maketing';

@Entity('users', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin người dùng cho quán cà phê',
})
export class UserEntity extends BaseEntity {
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
    length: 255,
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

  @Column('varchar', {
    name: 'role_id',
    length: 36,
    comment: 'Vai trò của người dùng',
  })
  roleId: string | undefined;

  @Column('varchar', {
    name: 'jwt_token',
    length: 255,
    unique: true,
    comment: 'Lưu trữ token JWT cho mỗi người dùng',
  })
  jwtToken: string | undefined;

  @OneToMany(() => OrderEntity, _object => _object.user)
  orders: Promise<OrderEntity[]> | undefined;

  @OneToMany(() => BlogPostEntity, _object => _object.user)
  blogs: Promise<BlogPostEntity[]> | undefined;

  @OneToMany(() => CommentEntity, _object => _object.user)
  comments: Promise<CommentEntity[]> | undefined;

  @OneToMany(() => FeedbackEntity, _object => _object.user)
  feedbacks: Promise<FeedbackEntity[]> | undefined;

  @ManyToOne(() => UserRoleEntity, _object => _object.users)
  @JoinColumn([{name: 'role_id', referencedColumnName: 'id'}])
  role: UserRoleEntity | undefined;
}
