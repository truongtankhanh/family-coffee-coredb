import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {OrderEntity} from './order.entity';

@Entity('payment_statuses', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các trạng thái thanh toán đơn hàng',
})
export class PaymentStatusEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    length: 50,
    comment: 'Trạng thái thanh toán',
  })
  name: string | undefined;

  @Column('text', {comment: 'Mô tả về trạng thái thanh toán'})
  description: string | undefined;

  @OneToMany(() => OrderEntity, _object => _object.orderStatus)
  orders: Promise<OrderEntity[]> | undefined;
}
