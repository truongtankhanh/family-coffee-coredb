import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, OneToOne} from 'typeorm';
import {Order} from './order';
import {Payment} from './payment';
import {BaseEntity} from '../base-entity';
import {PAYMENT_STATUS, TypePaymentStatus} from '../../enum';

@Entity('payment_history', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ lịch sử chi tiết về các khoản thanh toán',
})
export class PaymentHistory extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('int', {
    name: 'payment_id',
    comment: 'ID thanh toán (khóa ngoại kết nối đến bảng Payments)',
  })
  paymentId: number | undefined;

  @Column('varchar', {
    name: 'order_id',
    length: 36,
    comment:
      'ID đơn hàng liên quan đến thanh toán (khóa ngoại kết nối đến bảng Orders)',
  })
  orderId: string | undefined;

  @Column('float', {name: 'amount', comment: 'Số tiền thanh toán'})
  amount: number | undefined;

  @Column('enum', {
    name: 'status',
    comment: 'Trạng thái thanh toán',
    enum: Object.values(PAYMENT_STATUS),
  })
  status: TypePaymentStatus | undefined;

  @OneToOne(() => Payment)
  @JoinColumn([{name: 'payment_id', referencedColumnName: 'id'}])
  payment: Payment | undefined;

  @OneToOne(() => Order)
  @JoinColumn([{name: 'order_id', referencedColumnName: 'id'}])
  order: Order | undefined;
}
