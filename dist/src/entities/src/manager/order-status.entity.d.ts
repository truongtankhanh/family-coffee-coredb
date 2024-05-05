import { BaseEntity } from '../base-entity';
import { OrderEntity } from './order.entity';
export declare class OrderStatusEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    orders: Promise<OrderEntity[]> | undefined;
}
