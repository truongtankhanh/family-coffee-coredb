import { BlogPost } from './blog-post';
import { BaseEntity } from '../base-entity';
export declare class Comment extends BaseEntity {
    constructor();
    commenterName: string | undefined;
    commentContent: string | undefined;
    commentedAt: Date | undefined;
    blogId: string;
    blogPost: BlogPost | undefined;
}
