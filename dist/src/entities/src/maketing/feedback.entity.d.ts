import { UserEntity } from '../manager';
import { BaseEntity } from '../base-entity';
import { RatingEntity } from './rating.entity';
import { RestaurantEntity } from './restaurant.entity';
export declare class FeedbackEntity extends BaseEntity {
    constructor();
    message: string | undefined;
    restaurantId: string | undefined;
    rateId: string | undefined;
    userId: string | undefined;
    restaurant: RestaurantEntity | undefined;
    user: UserEntity | undefined;
    rating: RatingEntity | undefined;
}
