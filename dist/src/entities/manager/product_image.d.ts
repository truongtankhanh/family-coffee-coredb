import { Product } from './product';
import { BaseEntity } from '../base-entity';
export declare class ProductImage extends BaseEntity {
    constructor();
    productId: string | undefined;
    imageUrl: string | undefined;
    isMain: boolean | undefined;
    product: Product | undefined;
}
