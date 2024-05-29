import { FoodItem } from '../models'

PersistentStorage.persistProp('user_cart', [])

class CartStore {
  /**
   * 获取购物车列表
   * @returns
   */
  static getCarts(): FoodItem[] {
    return AppStorage.get<FoodItem[]>('user_cart') || []
  }
}

export {
  CartStore
}