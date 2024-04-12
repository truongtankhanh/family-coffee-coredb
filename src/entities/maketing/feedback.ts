import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {User} from '../manager';
import {Restaurant} from './restaurant';
import {BaseEntity} from '../base-entity';
import {RATING_VALUE, RatingValue} from '../../enum';

@Entity('feedback', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin phản hồi của khách hàng về nhà hàng',
})
export class Feedback extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'message', comment: 'Nội dung phản hồi'})
  message: string | undefined;

  @Column('varchar', {name: 'restaurant_id', length: 36})
  restaurantId: string | undefined;

  @Column('enum', {
    comment: 'Đánh giá của khách hàng',
    enum: Object.values(RATING_VALUE),
  })
  rating: RatingValue | undefined;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string | undefined;

  @ManyToOne(() => Restaurant, _object => _object.feedback)
  @JoinColumn([{name: 'restaurant_id', referencedColumnName: 'id'}])
  restaurant: Restaurant | undefined;

  @ManyToOne(() => User, _object => _object.blogs)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: User | undefined;
}
