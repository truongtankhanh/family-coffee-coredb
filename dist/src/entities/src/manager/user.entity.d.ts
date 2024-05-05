import { BaseEntity } from '../base-entity';
import { OrderEntity } from './order.entity';
import { UserRoleEntity } from './user-role.entity';
import { ActiveStatus } from '../../../enum';
import { BlogPostEntity, CommentEntity, FeedbackEntity } from '../maketing';
export declare class UserEntity extends BaseEntity {
    constructor();
    email: string | undefined;
    password: string | undefined;
    fullName: string | undefined;
    address: string | undefined;
    phoneNumber: string | undefined;
    isActive: ActiveStatus | undefined;
    roleId: string | undefined;
    jwtToken: string | undefined;
    orders: Promise<OrderEntity[]> | undefined;
    blogs: Promise<BlogPostEntity[]> | undefined;
    comments: Promise<CommentEntity[]> | undefined;
    feedbacks: Promise<FeedbackEntity[]> | undefined;
    role: UserRoleEntity | undefined;
}
