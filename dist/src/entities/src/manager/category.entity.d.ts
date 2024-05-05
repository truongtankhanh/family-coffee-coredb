import { ActiveStatus } from '@apps/enums';
import { BaseEntity } from '../base-entity';
import { ProductEntity } from './product.entity';
import { ProductParamsEnity } from './product-params.entity';
export declare class CategoryEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    isActive: ActiveStatus | undefined;
    parentId: string | undefined;
    products: Promise<ProductEntity[]> | undefined;
    productParams: Promise<ProductParamsEnity[]> | undefined;
}
