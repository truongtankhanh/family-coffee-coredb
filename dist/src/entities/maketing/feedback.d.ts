import { User } from '../manager';
import { Restaurant } from './restaurant';
import { BaseEntity } from '../base-entity';
export declare class Feedback extends BaseEntity {
    constructor();
    message: string | undefined;
    restaurantId: string | undefined;
    rating: number | undefined;
    userId: string | undefined;
    restaurant: Restaurant | undefined;
    user: User | undefined;
}
