import {v4 as uuidv4} from 'uuid';
import {Column, Entity, OneToMany} from 'typeorm';
import {Feedback} from './feedback';
import {BaseEntity} from '../base-entity';
import {ACTIVE_STATUS, ActiveStatus} from '../../enum';

@Entity('restaurant', {
  schema: 'family_coffee_db',
  comment: 'Lưu trữ thông tin về các nhà hàng',
})
export class Restaurant extends BaseEntity {
  constructor() {
    super();
    this.id = uuidv4();
  }

  @Column('text', {name: 'description', comment: 'Mô tả về quán'})
  description: string | undefined;

  @Column('text', {name: 'address', comment: 'Địa chỉ quán'})
  address: string | undefined;

  @Column('varchar', {
    name: 'phone_number',
    length: 20,
    comment: 'Số điện thoại quán',
  })
  phoneNumber: string | undefined;

  @Column('varchar', {
    name: 'email',
    length: 100,
    comment: 'Địa chỉ email liên hệ',
  })
  email: string | undefined;

  @Column('varchar', {
    name: 'working_hours',
    length: 35,
    comment: 'Giờ mở cửa và đóng cửa của quán',
  })
  workingHours: string | undefined;

  @Column('text', {
    name: 'social_media',
    comment: 'Lưu trữ các liên kết đến trang mạng xã hội của nhà hàng',
  })
  socialMedia: string | undefined;

  @Column('text', {comment: 'Đường dẫn ảnh đại diện của nhà hàng'})
  image: string | undefined;

  @Column('enum', {
    name: 'is_active',
    comment: 'Trạng thái hoạt động của nhà hàng (active/inactive)',
    enum: Object.values(ACTIVE_STATUS),
    default: ACTIVE_STATUS.ACTIVE,
  })
  isActive: ActiveStatus | undefined;

  @OneToMany(() => Feedback, feedback => feedback.restaurant)
  feedback: Promise<Feedback[]> | undefined;
}
