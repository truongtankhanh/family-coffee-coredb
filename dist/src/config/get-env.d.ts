export declare class ConfigurationError extends Error {
    constructor(message: string);
}
export declare const getConfigValueOrError: <T1, T2 = string>(config: T1, prop: keyof T1, message?: string, isValid?: (val: T2) => boolean) => T2;
export declare const getConfigValueWithDefault: <T1, T2 = string>(config: T1, prop: keyof T1, defaultValue: T2) => T2;
export declare const getConfigValue: <T1, T2 = string>(config: T1, prop: keyof T1, defaultValue?: T2) => T2 | undefined;
