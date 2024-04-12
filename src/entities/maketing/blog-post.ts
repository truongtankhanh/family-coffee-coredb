import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';
import {User} from '../manager';
import {Comment} from './comment';
import {BaseEntity} from '../base-entity';
import {ACTIVE_STATUS, ActiveStatus} from '../../enum';

@Entity('blog_posts', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin các bài viết blog',
})
export class BlogPost extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'title', comment: 'Tiêu đề bài viết'})
  title: string | undefined;

  @Column('text', {name: 'content', comment: 'Nội dung bài viết'})
  content: string | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của bài viết (active/inactive)',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: ActiveStatus | undefined;

  @Column('varchar', {name: 'user_id', length: 36})
  userId: string;

  @OneToMany(() => Comment, _object => _object.blogPost)
  comments: Promise<Comment[]> | undefined;

  @ManyToOne(() => User, _object => _object.blogs)
  @JoinColumn([{name: 'user_id', referencedColumnName: 'id'}])
  user: User | undefined;
}
