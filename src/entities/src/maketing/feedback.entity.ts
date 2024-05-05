import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';

import {UserEntity} from '../manager';
import {BaseEntity} from '../base-entity';
import {RatingEntity} from './rating.entity';
import {RestaurantEntity} from './restaurant.entity';

@Entity('feedback', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng',
})
export class FeedbackEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'message', comment: 'Nội dung phản hồi'})
  message: string | undefined;

  @Column('varchar', {name: 'restaurant_id', length: 36})
  restaurantId: string | undefined;

  @Column('varchar', {
    name: 'rate_id',
    length: 36,
    comment: 'Đánh giá của người dùng (1-5 sao)',
  })
  rateId: string | undefined;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string | undefined;

  @ManyToOne(() => RestaurantEntity, _object => _object.feedback)
  @JoinColumn([{name: 'restaurant_id', referencedColumnName: 'id'}])
  restaurant: RestaurantEntity | undefined;

  @ManyToOne(() => UserEntity, _object => _object.blogs)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: UserEntity | undefined;

  @ManyToOne(() => RatingEntity, _object => _object.feedbacks)
  @JoinColumn([{name: 'rate_id', referencedColumnName: 'id'}])
  rating: RatingEntity | undefined;
}
