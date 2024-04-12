import { Order } from './order';
import { Payment } from './payment';
import { BaseEntity } from '../base-entity';
import { TypePaymentStatus } from '../../enum';
export declare class PaymentHistory extends BaseEntity {
    constructor();
    paymentId: number | undefined;
    orderId: string | undefined;
    amount: number | undefined;
    status: TypePaymentStatus | undefined;
    payment: Payment | undefined;
    order: Order | undefined;
}
