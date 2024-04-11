import { Order } from './order';
import { Product } from './product';
import { BaseEntity } from '../base-entity';
export declare class OrderDetail extends BaseEntity {
    constructor();
    productId: number | undefined;
    quantity: number | undefined;
    unitPrice: number | undefined;
    subtotal: number | undefined;
    orderId: string;
    order: Order | undefined;
    product: Product | undefined;
}
