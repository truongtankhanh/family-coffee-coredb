import { UserEntity } from './user.entity';
import { BaseEntity } from '../base-entity';
export declare class UserRoleEntity extends BaseEntity {
    constructor();
    name: string | undefined;
    description: string | undefined;
    users: Promise<UserEntity[]> | undefined;
}
