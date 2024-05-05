import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';

import {UserEntity} from './user.entity';
import {BaseEntity} from '../base-entity';
import {OrderHistoryEntity} from './order-history.entity';
import {OrderStatusEntity} from './order-status.entity';
import {PaymentStatusEntity} from './payment-status.entity';

@Entity('orders', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các đơn hàng',
})
export class OrderEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('decimal', {
    name: 'total_amount',
    comment: 'Tổng số tiền của đơn hàng',
  })
  totalAmount: number | undefined;

  @Column('text', {name: 'delivery_address', comment: 'Địa chỉ giao hàng'})
  deliveryAddress: string | undefined;

  @Column('decimal', {
    name: 'delivery_fee',
    comment: 'Phí giao hàng (nếu có)',
    default: 0,
  })
  deliveryFee: number | undefined;

  @Column('text', {comment: 'Ghi chú của khách hàng'})
  note: string | undefined;

  @Column('varchar', {
    name: 'order_status_id',
    length: 36,
    comment: 'Trạng thái đơn hàng',
  })
  orderStatusId: string | undefined;

  @Column('varchar', {
    name: 'payment_status_id',
    comment: 'Trạng thái thanh toán',
  })
  paymentStatusId: string | undefined;

  @Column('datetime', {
    name: 'paid_at',
    nullable: true,
    comment: 'Thời điểm khách hàng thanh toán cho đơn hàng',
  })
  paidAt: Date | undefined;

  @Column('datetime', {
    name: 'cancel_at',
    nullable: true,
    comment: 'Thời điểm khách hàng huỷ đơn hàng',
  })
  cancelAt: Date | undefined;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string | undefined;

  @ManyToOne(() => UserEntity, _object => _object.orders)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: UserEntity | undefined;

  @OneToMany(() => OrderHistoryEntity, _object => _object.order)
  orderHistories: Promise<OrderHistoryEntity[]> | undefined;

  @ManyToOne(() => OrderStatusEntity, _object => _object.orders)
  @JoinColumn([{name: 'order_status_id', referencedColumnName: 'id'}])
  orderStatus: OrderStatusEntity | undefined;

  @ManyToOne(() => PaymentStatusEntity, _object => _object.orders)
  @JoinColumn([{name: 'payment_status_id', referencedColumnName: 'id'}])
  paymentStatus: PaymentStatusEntity | undefined;
}
