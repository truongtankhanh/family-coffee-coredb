import { BaseEntity } from '../base-entity';
import { ProductEntity } from './product.entity';
import { CategoryEntity } from './category.entity';
export declare class ProductCategoryEntity extends BaseEntity {
    constructor();
    productId: string | undefined;
    categoryId: string | undefined;
    product: ProductEntity | undefined;
    category: CategoryEntity | undefined;
}
