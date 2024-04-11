import { TypeOrderStatus, TypePaymentStatus } from '../../enum';
import { Customer } from './customer';
import { OrderDetail } from './order-detail';
import { BaseEntity } from '../base-entity';
export declare class Order extends BaseEntity {
    constructor();
    orderDate: Date | undefined;
    status: TypeOrderStatus | undefined;
    paymentStatus: TypePaymentStatus | undefined;
    totalAmount: number | undefined;
    deliveryAddress: string | undefined;
    deliveryFee: number | undefined;
    note: string | undefined;
    customerId: string;
    customer: Customer | undefined;
    orderDetails: Promise<OrderDetail[]> | undefined;
}
