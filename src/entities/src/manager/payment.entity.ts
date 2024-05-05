import {v4 as uuidv4} from 'uuid';
import {Column, Entity} from 'typeorm';

import {BaseEntity} from '../base-entity';

@Entity('payments', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các khoản thanh toán',
})
export class PaymentEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    length: 50,
    comment: 'Phương thức thanh toán',
  })
  method: string | undefined;

  @Column('text', {comment: 'Mô tả về phương thức thanh toán'})
  description: string | undefined;
}
