import {v4 as uuidv4} from 'uuid';
import {Column, Entity} from 'typeorm';
import {BaseEntity} from '../base-entity';
import {PAYMENT_METHOD, TypePamentMethod} from '../../enum';

@Entity('payments', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các khoản thanh toán',
})
export class Payment extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('enum', {
    name: 'payment_method',
    comment: 'Phương thức thanh toán',
    enum: Object.values(PAYMENT_METHOD),
  })
  paymentMethod: TypePamentMethod | undefined;
}
