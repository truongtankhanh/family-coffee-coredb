"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getConfigValue = exports.getConfigValueWithDefault = exports.getConfigValueOrError = exports.ConfigurationError = void 0;
const lodash_1 = require("lodash");
class ConfigurationError extends Error {
    constructor(message) {
        super(message);
        Object.setPrototypeOf(this, ConfigurationError.prototype);
    }
}
exports.ConfigurationError = ConfigurationError;
const getConfigValueOrError = (config, prop, message, isValid = (val) => !(0, lodash_1.isNil)(val)) => {
    const value = config[prop];
    if (!isValid(value)) {
        throw new ConfigurationError(message || `${(0, lodash_1.toString)(prop)} is expected to be set`);
    }
    return value;
};
exports.getConfigValueOrError = getConfigValueOrError;
const getConfigValueWithDefault = (config, prop, defaultValue) => {
    const value = config[prop];
    if (!(0, lodash_1.isNil)(value)) {
        return value;
    }
    return defaultValue;
};
exports.getConfigValueWithDefault = getConfigValueWithDefault;
const getConfigValue = (config, prop, defaultValue) => {
    const value = config[prop];
    if (!(0, lodash_1.isNil)(value)) {
        return value;
    }
    return defaultValue;
};
exports.getConfigValue = getConfigValue;
//# sourceMappingURL=get-env.js.map