import { UserEntity } from '../manager';
import { BaseEntity } from '../base-entity';
import { CommentEntity } from './comment.entity';
import { ActiveStatus } from '../../../enum';
export declare class BlogPostEntity extends BaseEntity {
    constructor();
    title: string | undefined;
    content: string | undefined;
    isActive: ActiveStatus | undefined;
    userId: string | undefined;
    comments: Promise<CommentEntity[]> | undefined;
    user: UserEntity | undefined;
}
