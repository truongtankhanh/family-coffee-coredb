import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';

import {UserEntity} from './user.entity';
import {BaseEntity} from '../base-entity';

@Entity('user_roles', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ về các vai trò của người dùng',
})
export class UserRoleEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    length: 50,
    comment: 'Vai trò của người dùng',
  })
  name: string | undefined;

  @Column('text', {comment: 'Mô tả về vai trò của người dùng'})
  description: string | undefined;

  @OneToMany(() => UserEntity, _object => _object.role)
  users: Promise<UserEntity[]> | undefined;
}
