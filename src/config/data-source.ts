import {DataSource, DataSourceOptions} from 'typeorm';
import * as Entities from '../entities';
import {getConfigValue} from './get-env';
import {databaseOptions} from './database-options';

const databaseConfig: DataSourceOptions = {
  type: 'mysql',
  ...databaseOptions(process.env),
  entities: Object.values(Entities),
  migrations: [__dirname + '/../database/migrations/*{.ts,.js}'],
  extra: {
    charset: 'utf8mb4_unicode_ci',
  },
  synchronize: false,
  logging: false,
};

console.info(`Database host: ${getConfigValue(process.env, 'DB_HOST')}`);

export const AppDataSource = new DataSource(databaseConfig);
