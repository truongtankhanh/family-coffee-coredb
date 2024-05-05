import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';

import {BaseEntity} from '../base-entity';
import {CategoryEntity} from './category.entity';

@Entity('product_params', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các size của sản phẩm',
})
export class ProductParamsEnity extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('varchar', {comment: 'Tên size sản phẩm'})
  name: string | undefined;

  @Column('int', {comment: 'Dung tích sản phẩm theo size(đơn vị là ml)'})
  capacity: number | undefined;

  @Column('varchar', {name: 'category_id', length: 36})
  categoryId: string | undefined;

  @ManyToOne(() => CategoryEntity, _object => _object.productParams)
  @JoinColumn([{name: 'category_id', referencedColumnName: 'id'}])
  category: CategoryEntity | undefined;
}
