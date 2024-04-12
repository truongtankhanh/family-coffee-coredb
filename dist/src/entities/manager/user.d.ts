import { Order } from './order';
import { BaseEntity } from '../base-entity';
import { BlogPost, Comment, Feedback } from '../maketing';
import { ActiveStatus, RoleType } from '../../enum';
export declare class User extends BaseEntity {
    constructor();
    email: string | undefined;
    password: string | undefined;
    fullName: string | undefined;
    address: string | undefined;
    phoneNumber: string | undefined;
    isActive: ActiveStatus | undefined;
    isRole: RoleType | undefined;
    jwtToken: string | undefined;
    orders: Promise<Order[]> | undefined;
    blogs: Promise<BlogPost[]> | undefined;
    comments: Promise<Comment[]> | undefined;
    feedbacks: Promise<Feedback[]> | undefined;
}
