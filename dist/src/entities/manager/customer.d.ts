import { Order } from './order';
import { BaseEntity } from '../base-entity';
export declare class Customer extends BaseEntity {
    constructor();
    name: string | undefined;
    phoneNumber: string | undefined;
    email: string | undefined;
    address: string | undefined;
    loyaltyPoints: number | undefined;
    orders: Promise<Order[]> | undefined;
}
