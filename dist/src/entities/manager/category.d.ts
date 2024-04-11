import { Product } from './product';
import { BaseEntity } from '../base-entity';
export declare class Category extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    isActive: boolean | undefined;
    parentId: number | undefined;
    products: Promise<Product[]> | undefined;
}
