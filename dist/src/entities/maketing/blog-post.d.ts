import { User } from '../manager';
import { Comment } from './comment';
import { BaseEntity } from '../base-entity';
import { ActiveStatus } from '../../enum';
export declare class BlogPost extends BaseEntity {
    constructor();
    title: string | undefined;
    content: string | undefined;
    isActive: ActiveStatus | undefined;
    userId: string;
    comments: Promise<Comment[]> | undefined;
    user: User | undefined;
}
