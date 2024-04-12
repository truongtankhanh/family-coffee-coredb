import { Category } from './category';
import { BaseEntity } from '../base-entity';
import { ProductImage } from './product_image';
import { ActiveStatus } from '../../enum';
export declare class Product extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    price: number | undefined;
    capacity: number | undefined;
    stock: number | undefined;
    isActive: ActiveStatus | undefined;
    categoryId: string | undefined;
    category: Category | undefined;
    images: Promise<ProductImage[]> | undefined;
}
