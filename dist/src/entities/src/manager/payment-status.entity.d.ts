import { BaseEntity } from '../base-entity';
import { OrderEntity } from './order.entity';
export declare class PaymentStatusEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    orders: Promise<OrderEntity[]> | undefined;
}
