import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cart } from '../entities/Cart.entity';
import { CartItem } from '../entities/CartItem.entity';

import { OrderModule } from '../order/order.module';

import { CartController } from './cart.controller';
import { CartService } from './services';


@Module({
  imports: [ OrderModule, TypeOrmModule.forFeature([Cart, CartItem]) ],
  providers: [ CartService ],
  controllers: [ CartController ]
})
export class CartModule {}
