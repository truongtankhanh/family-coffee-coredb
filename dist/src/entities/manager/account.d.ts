import { BaseEntity } from '../base-entity';
import { ActiveStatus, RoleType } from '../../enum';
export declare class Account extends BaseEntity {
    constructor();
    email: string | undefined;
    password: string | undefined;
    fullName: string | undefined;
    address: string | undefined;
    phoneNumber: string | undefined;
    isActive: ActiveStatus | undefined;
    isRole: RoleType | undefined;
    jwtToken: string;
}
