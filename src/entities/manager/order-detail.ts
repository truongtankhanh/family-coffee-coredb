import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToOne} from 'typeorm';
import {Order} from './order';
import {Product} from './product';
import {BaseEntity} from '../base-entity';

@Entity('order_detail', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ chi tiết các sản phẩm trong một đơn hàng',
})
export class OrderDetail extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('int', {name: 'product_id', comment: 'ID của sản phẩm'})
  productId: number | undefined;

  @Column('int', {
    name: 'quantity',
    comment: 'Số lượng sản phẩm được đặt trong đơn hàng',
  })
  quantity: number | undefined;

  @Column('int', {name: 'unit_price', comment: 'Giá của một đơn vị sản phẩm'})
  unitPrice: number | undefined;

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
  orderId: string;

  @ManyToOne(() => Order, order => order.orderDetails)
  @JoinColumn([{name: 'order_id', referencedColumnName: 'id'}])
  order: Order | undefined;

  @OneToOne(() => Product)
  @JoinColumn([{name: 'product_id', referencedColumnName: 'id'}])
  product: Product | undefined;
}
