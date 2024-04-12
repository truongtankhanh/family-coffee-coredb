import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';
import {User} from './user';
import {BaseEntity} from '../base-entity';
import {OrderHistory} from './order-history';
import {
  ORDER_STATUS,
  PAYMENT_STATUS,
  TypeOrderStatus,
  TypePaymentStatus,
} from '../../enum';

@Entity('orders', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các đơn hàng',
})
export class Order extends BaseEntity {
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

  @Column('enum', {
    name: 'order_status',
    comment: 'Trạng thái đơn hàng',
    enum: Object.values(ORDER_STATUS),
  })
  orderStatus: TypeOrderStatus | undefined;

  @Column('enum', {
    name: 'payment_status',
    comment: 'Trạng thái thanh toán',
    enum: Object.values(PAYMENT_STATUS),
  })
  paymentStatus: TypePaymentStatus | undefined;

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

  @ManyToOne(() => User, _object => _object.orders)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: User | undefined;

  @OneToMany(() => OrderHistory, _object => _object.order)
  orderHistories: Promise<OrderHistory[]> | undefined;
}
