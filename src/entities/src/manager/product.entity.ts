import {v4 as uuidv4} from 'uuid';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToMany,
  OneToOne,
} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {CategoryEntity} from './category.entity';
import {ProductImageEntity} from './product-image.entity';
import {ProductParamsEnity} from './product-params.entity';
import {ACTIVE_STATUS, ActiveStatus} from '../../../enum';

@Entity('products', {
  schema: 'family_coffee_db',
  comment: ' Lưu trữ thông tin về các sản phẩm được bán tại quán cà phê',
})
export class ProductEntity extends BaseEntity {
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

  @Column('text', {
    nullable: true,
    comment: 'Topings hoặc thành phần của sản phẩm',
  })
  toppings: string | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của sản phẩm (active/inactive)',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: ActiveStatus | undefined;

  @Column('varchar', {name: 'category_id', length: 36})
  categoryId: string | undefined;

  @ManyToOne(() => CategoryEntity, _object => _object.products)
  @JoinColumn([{name: 'category_id', referencedColumnName: 'id'}])
  category: CategoryEntity | undefined;

  @OneToMany(() => ProductImageEntity, _object => _object.product)
  images: Promise<ProductImageEntity[]> | undefined;

  @Column('varchar', {name: 'product_params_id', length: 36})
  productParamsId: string | undefined;

  @OneToOne(() => ProductParamsEnity)
  @JoinColumn([{name: 'product_params_id', referencedColumnName: 'id'}])
  productParams: ProductParamsEnity | undefined;
}
