import { User } from '../manager';
import { BlogPost } from './blog-post';
import { BaseEntity } from '../base-entity';
import { RatingValue } from '../../enum';
export declare class Comment extends BaseEntity {
    constructor();
    content: string | undefined;
    rating: RatingValue | undefined;
    blogId: string;
    userId: string;
    blogPost: BlogPost | undefined;
    user: User | undefined;
}
