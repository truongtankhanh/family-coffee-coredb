import { Restaurant } from './restaurant';
import { BaseEntity } from '../base-entity';
export declare class Feedback extends BaseEntity {
    constructor();
    customerName: string | undefined;
    message: string | undefined;
    restaurantId: string;
    rating: number | undefined;
    restaurant: Restaurant;
}
