import { Comment } from './comment';
import { BaseEntity } from '../base-entity';
import { ActiveStatus } from '../../enum';
export declare class BlogPost extends BaseEntity {
    constructor();
    title: string | undefined;
    content: string | undefined;
    author: string | undefined;
    category: string | undefined;
    publishedAt: Date | undefined;
    isActive: ActiveStatus | undefined;
    comments: Promise<Comment[]> | undefined;
}
