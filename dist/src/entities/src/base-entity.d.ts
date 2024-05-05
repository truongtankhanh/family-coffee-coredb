export declare abstract class BaseEntity {
    id: string | undefined;
    createdAt: Date | undefined;
    updatedAt: Date | undefined;
    deletedAt: Date | undefined;
    setCreateDate(): void;
    setUpdateDate(): void;
    setDeleteDate(): void;
}
