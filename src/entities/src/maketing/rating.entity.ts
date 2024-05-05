import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {RATING_VALUE} from '../../../enum';
import {CommentEntity} from './comment.entity';
import {FeedbackEntity} from './feedback.entity';

@Entity('rating', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ các mức đánh giá',
})
export class RatingEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }
  @Column('enum', {
    comment: 'Tên đánh giá',
    enum: Object.keys(RATING_VALUE),
  })
  name: string | undefined;

  @Column('varchar', {length: 10, comment: 'Giá trị đánh giá'})
  value: string | undefined;

  @OneToMany(() => CommentEntity, _object => _object.rating)
  comments: Promise<CommentEntity[]> | undefined;

  @OneToMany(() => FeedbackEntity, _object => _object.rating)
  feedbacks: Promise<FeedbackEntity[]> | undefined;
}
