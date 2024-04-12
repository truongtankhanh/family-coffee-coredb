import { User } from './user';
import { BaseEntity } from '../base-entity';
import { OrderHistory } from './order-history';
import { TypeOrderStatus, TypePaymentStatus } from '../../enum';
export declare class Order extends BaseEntity {
    constructor();
    totalAmount: number | undefined;
    deliveryAddress: string | undefined;
    deliveryFee: number | undefined;
    note: string | undefined;
    orderStatus: TypeOrderStatus | undefined;
    paymentStatus: TypePaymentStatus | undefined;
    paidAt: Date | undefined;
    cancelAt: Date | undefined;
    userId: string | undefined;
    user: User | undefined;
    orderHistories: Promise<OrderHistory[]> | undefined;
}
