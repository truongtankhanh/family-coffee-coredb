import { ActiveStatus } from '@apps/enums';
import { BaseEntity } from '../base-entity';
import { CategoryEntity } from './category.entity';
import { ProductImageEntity } from './product-image.entity';
import { ProductParamsEnity } from './product-params.entity';
export declare class ProductEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    price: number | undefined;
    toppings: string | undefined;
    isActive: ActiveStatus | undefined;
    categoryId: string | undefined;
    category: CategoryEntity | undefined;
    images: Promise<ProductImageEntity[]> | undefined;
    productParamsId: string | undefined;
    productParams: ProductParamsEnity | undefined;
}
