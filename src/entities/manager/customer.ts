import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';
import {Order} from './order';
import {BaseEntity} from '../base-entity';

@Entity('customers', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin khách hàng',
})
export class Customer extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('nvarchar', {length: 255, comment: 'Tên khách hàng'})
  name: string | undefined;

  @Column('varchar', {
    length: 20,
    name: 'phone_number',
    comment: 'Số điện thoại khách hàng',
  })
  phoneNumber: string | undefined;

  @Column('varchar', {length: 100, nullable: true, comment: 'Địa chỉ email'})
  email: string | undefined;

  @Column('text', {nullable: true, comment: 'Địa chỉ giao hàng'})
  address: string | undefined;

  @Column('int', {
    name: 'loyalty_points',
    nullable: true,
    comment: 'Điểm tích lũy',
  })
  loyaltyPoints: number | undefined;

  @OneToMany(() => Order, order => order.customer)
  orders: Promise<Order[]> | undefined;
}
