import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';

import {UserEntity} from '../manager';
import {BaseEntity} from '../base-entity';
import {RatingEntity} from './rating.entity';
import {BlogPostEntity} from './blog-post.entity';

@Entity('comments', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin bình luận của người dùng về các bài viết blog',
})
export class CommentEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'content', comment: 'Nội dung bình luận'})
  content: string | undefined;

  @Column('varchar', {
    name: 'rate_id',
    length: 36,
    comment: 'Đánh giá của người dùng (1-5 sao)',
  })
  rateId: string | undefined;

  @Column('varchar', {name: 'blog_id', length: 36})
  blogId: string | undefined;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string | undefined;

  @ManyToOne(() => BlogPostEntity, _object => _object.comments)
  @JoinColumn([{name: 'blog_id', referencedColumnName: 'id'}])
  blogPost: BlogPostEntity | undefined;

  @ManyToOne(() => UserEntity, _object => _object.blogs)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: UserEntity | undefined;

  @ManyToOne(() => RatingEntity, _object => _object.comments)
  @JoinColumn([{name: 'rate_id', referencedColumnName: 'id'}])
  rating: RatingEntity | undefined;
}
