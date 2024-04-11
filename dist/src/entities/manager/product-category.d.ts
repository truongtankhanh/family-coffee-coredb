import { Product } from './product';
import { Category } from './category';
import { BaseEntity } from '../base-entity';
export declare class ProductCategory extends BaseEntity {
    constructor();
    productId: number | undefined;
    categoryId: number | undefined;
    product: Product | undefined;
    category: Category | undefined;
}
