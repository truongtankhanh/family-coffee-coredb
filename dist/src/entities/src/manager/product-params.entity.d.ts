import { BaseEntity } from '../base-entity';
import { CategoryEntity } from './category.entity';
export declare class ProductParamsEnity extends BaseEntity {
    constructor();
    name: string | undefined;
    capacity: number | undefined;
    categoryId: string | undefined;
    category: CategoryEntity | undefined;
}
