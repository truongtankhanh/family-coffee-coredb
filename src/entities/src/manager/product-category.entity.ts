import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, OneToOne} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {ProductEntity} from './product.entity';
import {CategoryEntity} from './category.entity';

@Entity('product_category', {
  schema: 'family_coffee_db',
  comment:
    ' Lưu trữ mối quan hệ nhiều-đối-nhiều giữa các sản phẩm và danh mục sản phẩm',
})
export class ProductCategoryEntity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {
    name: 'product_id',
    length: 36,
    comment: 'ID sản phẩm (khóa ngoại kết nối đến bảng Products)',
  })
  productId: string | undefined;

  @Column('varchar', {
    name: 'category_id',
    length: 36,
    comment: 'ID danh mục sản phẩm (khóa ngoại kết nối đến bảng Categories)',
  })
  categoryId: string | undefined;

  @OneToOne(() => ProductEntity)
  @JoinColumn([{name: 'product_id', referencedColumnName: 'id'}])
  product: ProductEntity | undefined;

  @OneToOne(() => CategoryEntity)
  @JoinColumn([{name: 'category_id', referencedColumnName: 'id'}])
  category: CategoryEntity | undefined;
}
