import { BaseEntity } from '../base-entity';
import { CommentEntity } from './comment.entity';
import { FeedbackEntity } from './feedback.entity';
export declare class RatingEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    value: string | undefined;
    comments: Promise<CommentEntity[]> | undefined;
    feedbacks: Promise<FeedbackEntity[]> | undefined;
}
