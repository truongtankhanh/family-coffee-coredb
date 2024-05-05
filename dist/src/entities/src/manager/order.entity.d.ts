import { UserEntity } from './user.entity';
import { BaseEntity } from '../base-entity';
import { OrderHistoryEntity } from './order-history.entity';
import { OrderStatusEntity } from './order-status.entity';
import { PaymentStatusEntity } from './payment-status.entity';
export declare class OrderEntity extends BaseEntity {
    constructor();
    totalAmount: number | undefined;
    deliveryAddress: string | undefined;
    deliveryFee: number | undefined;
    note: string | undefined;
    orderStatusId: string | undefined;
    paymentStatusId: string | undefined;
    paidAt: Date | undefined;
    cancelAt: Date | undefined;
    userId: string | undefined;
    user: UserEntity | undefined;
    orderHistories: Promise<OrderHistoryEntity[]> | undefined;
    orderStatus: OrderStatusEntity | undefined;
    paymentStatus: PaymentStatusEntity | undefined;
}
