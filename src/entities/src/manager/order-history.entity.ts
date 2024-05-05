import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToOne} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {OrderEntity} from './order.entity';
import {ProductEntity} from './product.entity';

@Entity('order_history', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ chi tiết các sản phẩm trong một đơn hàng',
})
export class OrderHistoryEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('int', {
    comment: 'Số lượng sản phẩm được đặt trong đơn hàng',
  })
  quantity: number | undefined;

  @Column('int', {
    name: 'subtotal',
    comment: 'Tổng giá của sản phẩm trong đơn hàng, tự động tính toán',
  })
  subtotal: number | undefined;

  @Column('varchar', {
    name: 'order_id',
    length: 36,
    comment: 'ID của đơn hàng',
  })
  orderId: string | undefined;

  @ManyToOne(() => OrderEntity, _object => _object.orderHistories)
  @JoinColumn([{name: 'order_id', referencedColumnName: 'id'}])
  order: OrderEntity | undefined;

  @Column('varchar', {
    name: 'product_id',
    length: 36,
    comment: 'ID của sản phẩm',
  })
  productId: string | undefined;

  @OneToOne(() => ProductEntity)
  @JoinColumn([{name: 'product_id', referencedColumnName: 'id'}])
  product: ProductEntity | undefined;
}
