import { BaseEntity } from '../base-entity';
import { FeedbackEntity } from './feedback.entity';
import { ActiveStatus } from '../../../enum';
export declare class RestaurantEntity extends BaseEntity {
    constructor();
    description: string | undefined;
    address: string | undefined;
    phoneNumber: string | undefined;
    email: string | undefined;
    workingHours: string | undefined;
    socialMedia: string | undefined;
    image: string | undefined;
    isActive: ActiveStatus | undefined;
    feedback: Promise<FeedbackEntity[]> | undefined;
}
