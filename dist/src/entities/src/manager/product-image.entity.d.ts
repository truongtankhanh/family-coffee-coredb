import { BaseEntity } from '../base-entity';
import { ProductEntity } from './product.entity';
export declare class ProductImageEntity extends BaseEntity {
    constructor();
    productId: string | undefined;
    imageUrl: string | undefined;
    isMain: boolean | undefined;
    thumbnailUrl: string | undefined;
    product: ProductEntity | undefined;
}
