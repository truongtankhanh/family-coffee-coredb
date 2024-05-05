import { BaseEntity } from '../base-entity';
import { OrderEntity } from './order.entity';
import { PaymentEntity } from './payment.entity';
export declare class PaymentHistoryEntity extends BaseEntity {
    constructor();
    paymentId: string | undefined;
    orderId: string | undefined;
    amount: number | undefined;
    payment: PaymentEntity | undefined;
    order: OrderEntity | undefined;
}
