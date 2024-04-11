"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.databaseOptions = void 0;
const get_env_1 = require("./get-env");
const databaseOptions = (env) => ({
    host: (0, get_env_1.getConfigValue)(env, 'DB_HOST'),
    port: Number(env.DB_PORT) || 3306,
    username: (0, get_env_1.getConfigValue)(env, 'DB_USERNAME', ''),
    password: (0, get_env_1.getConfigValue)(env, 'DB_PASSWORD', ''),
    database: (0, get_env_1.getConfigValue)(env, 'DB_DATABASE', ''),
});
exports.databaseOptions = databaseOptions;
//# sourceMappingURL=database-options.js.map