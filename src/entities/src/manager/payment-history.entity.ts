import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, OneToOne} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {OrderEntity} from './order.entity';
import {PaymentEntity} from './payment.entity';

@Entity('payment_history', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ lịch sử chi tiết về các khoản thanh toán',
})
export class PaymentHistoryEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    name: 'payment_id',
    length: 36,
    comment: 'ID thanh toán (khóa ngoại kết nối đến bảng Payments)',
  })
  paymentId: string | undefined;

  @Column('varchar', {
    name: 'order_id',
    length: 36,
    comment:
      'ID đơn hàng liên quan đến thanh toán (khóa ngoại kết nối đến bảng Orders)',
  })
  orderId: string | undefined;

  @Column('float', {comment: 'Số tiền thanh toán'})
  amount: number | undefined;

  @OneToOne(() => PaymentEntity)
  @JoinColumn([{name: 'payment_id', referencedColumnName: 'id'}])
  payment: PaymentEntity | undefined;

  @OneToOne(() => OrderEntity)
  @JoinColumn([{name: 'order_id', referencedColumnName: 'id'}])
  order: OrderEntity | undefined;
}
