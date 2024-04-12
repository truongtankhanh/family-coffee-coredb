import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {User} from '../manager';
import {BlogPost} from './blog-post';
import {BaseEntity} from '../base-entity';
import {RATING_VALUE, RatingValue} from '../../enum';

@Entity('comments', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin bình luận của người dùng về các bài viết blog',
})
export class Comment extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'content', comment: 'Nội dung bình luận'})
  content: string | undefined;

  @Column('enum', {
    comment: 'Đánh giá của người dùng (1-5 sao)',
    enum: Object.values(RATING_VALUE),
  })
  rating: RatingValue | undefined;

  @Column('varchar', {name: 'blog_id', length: 36})
  blogId: string;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string;

  @ManyToOne(() => BlogPost, _object => _object.comments)
  @JoinColumn([{name: 'blog_id', referencedColumnName: 'id'}])
  blogPost: BlogPost | undefined;

  @ManyToOne(() => User, _object => _object.blogs)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: User | undefined;
}
