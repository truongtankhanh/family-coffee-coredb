import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';
import {Category} from './category';
import {BaseEntity} from '../base-entity';
import {ProductImage} from './product_image';
import {ACTIVE_STATUS, ActiveStatus} from '../../enum';

@Entity('products', {
  schema: 'family_coffee_db',
  comment: ' Lưu trữ thông tin về các sản phẩm được bán tại quán cà phê',
})
export class Product extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {comment: 'Tên sản phẩm'})
  name: string | undefined;

  @Column('text', {comment: 'Mô tả sản phẩm'})
  description: string | undefined;

  @Column('float', {comment: 'Giá sản phẩm'})
  price: number | undefined;

  @Column('float', {comment: 'Dung tích sản phẩm'})
  capacity: number | undefined;

  @Column('int', {comment: 'Số lượng sản phẩm còn hàng'})
  stock: number | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của sản phẩm (active/inactive)',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: ActiveStatus | undefined;

  @Column('varchar', {name: 'category_id', length: 36})
  categoryId: string | undefined;

  @ManyToOne(() => Category, _object => _object.products)
  @JoinColumn([{name: 'category_id', referencedColumnName: 'id'}])
  category: Category | undefined;

  @OneToMany(() => ProductImage, _object => _object.product)
  images: Promise<ProductImage[]> | undefined;
}
