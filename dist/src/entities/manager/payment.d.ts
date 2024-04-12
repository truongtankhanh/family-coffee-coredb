import { BaseEntity } from '../base-entity';
import { TypePamentMethod } from '../../enum';
export declare class Payment extends BaseEntity {
    constructor();
    paymentMethod: TypePamentMethod | undefined;
}
