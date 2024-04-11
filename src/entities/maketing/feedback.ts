import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {Restaurant} from './restaurant';
import {BaseEntity} from '../base-entity';

@Entity('feedback', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng',
})
export class Feedback extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('nvarchar', {
    name: 'customer_name',
    length: 255,
    comment: 'Tên khách hàng gửi phản hồi',
  })
  customerName: string | undefined;

  @Column('text', {name: 'message', comment: 'Nội dung phản hồi'})
  message: string | undefined;

  @Column('varchar', {name: 'restaurant_id', length: 36})
  restaurantId: string;

  @Column('int', {comment: 'Đánh giá của khách hàng'})
  rating: number | undefined;

  @ManyToOne(() => Restaurant, restaurant => restaurant.feedback)
  @JoinColumn([{name: 'restaurant_id', referencedColumnName: 'id'}])
  restaurant: Restaurant;
}
