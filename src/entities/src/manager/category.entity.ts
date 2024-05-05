import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';
import {ACTIVE_STATUS, ActiveStatus} from '@apps/enums';

import {BaseEntity} from '../base-entity';
import {ProductEntity} from './product.entity';
import {ProductParamsEnity} from './product-params.entity';

@Entity('categories', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ danh mục sản phẩm cho quán cà phê',
})
export class CategoryEntity extends BaseEntity {
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
  isActive: ActiveStatus | undefined;

  @Column('varchar', {
    name: 'parent_id',
    length: 36,
    nullable: true,
    comment:
      'ID danh mục cha (để hỗ trợ danh mục con, khóa ngoại tham chiếu đến chính bảng Categories)',
  })
  parentId: string | undefined;

  @OneToMany(() => ProductEntity, _object => _object.category)
  products: Promise<ProductEntity[]> | undefined;

  @OneToMany(() => ProductParamsEnity, _object => _object.category)
  productParams: Promise<ProductParamsEnity[]> | undefined;
}
