import { Order } from './order';
import { Product } from './product';
import { BaseEntity } from '../base-entity';
export declare class OrderHistory extends BaseEntity {
    constructor();
    quantity: number | undefined;
    subtotal: number | undefined;
    orderId: string | undefined;
    order: Order | undefined;
    productId: number | undefined;
    product: Product | undefined;
}
