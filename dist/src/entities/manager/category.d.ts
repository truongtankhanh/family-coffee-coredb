import { Product } from './product';
import { BaseEntity } from '../base-entity';
import { ActiveStatus } from '../../enum';
export declare class Category extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    isActive: ActiveStatus | undefined;
    parentId: number | undefined;
    products: Promise<Product[]> | undefined;
}
