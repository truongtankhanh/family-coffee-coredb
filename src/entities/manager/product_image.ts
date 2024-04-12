import {v4 as uuidv4} from 'uuid';
import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {Product} from './product';
import {BaseEntity} from '../base-entity';

@Entity('product_images', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các ảnh sản phẩm',
})
export class ProductImage extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'product_id', comment: 'ID sản phẩm'})
  productId: string | undefined;

  @Column('text', {name: 'image_url', comment: 'URL ảnh sản phẩm'})
  imageUrl: string | undefined;

  @Column('boolean', {
    name: 'is_main',
    comment: 'Ảnh đại diện cho sản phẩm',
    default: false,
  })
  isMain: boolean | undefined;

  @Column('text', {
    name: 'thumbnail_url',
    nullable: true,
    comment: 'URL đường dẫn đến ảnh thu gọn của ảnh chính',
  })
  thumbnailUrl: string | undefined;

  @ManyToOne(() => Product, _object => _object.images)
  @JoinColumn([{name: 'product_id', referencedColumnName: 'id'}])
  product: Product | undefined;
}
