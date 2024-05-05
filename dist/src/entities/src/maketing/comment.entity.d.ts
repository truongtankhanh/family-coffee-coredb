import { UserEntity } from '../manager';
import { BaseEntity } from '../base-entity';
import { RatingEntity } from './rating.entity';
import { BlogPostEntity } from './blog-post.entity';
export declare class CommentEntity extends BaseEntity {
    constructor();
    content: string | undefined;
    rateId: string | undefined;
    blogId: string | undefined;
    userId: string | undefined;
    blogPost: BlogPostEntity | undefined;
    user: UserEntity | undefined;
    rating: RatingEntity | undefined;
}
