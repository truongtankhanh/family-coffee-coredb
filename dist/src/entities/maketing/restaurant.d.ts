import { Feedback } from './feedback';
import { BaseEntity } from '../base-entity';
import { ActiveStatus } from '../../enum';
export declare class Restaurant extends BaseEntity {
    constructor();
    description: string | undefined;
    address: string | undefined;
    phoneNumber: string | undefined;
    email: string | undefined;
    workingHours: string | undefined;
    socialMedia: string | undefined;
    image: string | undefined;
    isActive: ActiveStatus | undefined;
    feedback: Promise<Feedback[]> | undefined;
}
