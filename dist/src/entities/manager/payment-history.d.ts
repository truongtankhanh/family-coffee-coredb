import { Payment } from './payment';
import { BaseEntity } from '../base-entity';
export declare class PaymentHistory extends BaseEntity {
    constructor();
    paymentId: number | undefined;
    description: string | undefined;
    payment: Payment | undefined;
}
