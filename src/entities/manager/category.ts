import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';
import {Product} from './product';
import {ACTIVE_STATUS} from '../../enum';
import {BaseEntity} from '../base-entity';

@Entity('categories', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ danh mục sản phẩm cho quán cà phê',
})
export class Category extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('nvarchar', {length: 255, comment: 'Tên danh mục sản phẩm'})
  name: string | undefined;

  @Column('text', {comment: 'Mô tả ngắn gọn về danh mục'})
  description: string | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của danh mục',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: boolean | undefined;

  @Column('int', {
    name: 'parent_id',
    nullable: true,
    comment:
      'ID danh mục cha (để hỗ trợ danh mục con, khóa ngoại tham chiếu đến chính bảng Categories)',
  })
  parentId: number | undefined;

  @OneToMany(() => Product, _object => _object.category)
  products: Promise<Product[]> | undefined;
}
