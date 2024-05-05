import { BaseEntity } from '../base-entity';
import { OrderEntity } from './order.entity';
import { ProductEntity } from './product.entity';
export declare class OrderHistoryEntity extends BaseEntity {
    constructor();
    quantity: number | undefined;
    subtotal: number | undefined;
    orderId: string | undefined;
    order: OrderEntity | undefined;
    productId: string | undefined;
    product: ProductEntity | undefined;
}
