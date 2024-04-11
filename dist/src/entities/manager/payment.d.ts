import { TypePamentMethod, TypePaymentStatus } from '../../enum';
import { Order } from './order';
import { BaseEntity } from '../base-entity';
export declare class Payment extends BaseEntity {
    constructor();
    orderId: string | undefined;
    paymentMethod: TypePamentMethod | undefined;
    amount: number | undefined;
    paymentDate: Date | undefined;
    status: TypePaymentStatus | undefined;
    order: Order | undefined;
}
