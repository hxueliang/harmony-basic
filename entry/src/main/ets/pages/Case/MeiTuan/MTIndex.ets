import MTBottom from './components/MTBottom'
import MTCart from './components/MTCart'
import MTMain from './components/MTMain'
import MTTop from './components/MTTop'
import { FoodItem } from './models'
import { CartStore } from './utils'

@Entry
@Component
struct MTIndex {
  @Provide
  showCart: boolean = false
  @Provide
  userCart: FoodItem[] = []

  aboutToAppear(): void {
    this.userCart = CartStore.getCarts()
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          MTTop()
          MTMain()
            .layoutWeight(1)
        }
        .height('100%')

        if (this.showCart) {
          MTCart()
        }

        MTBottom()
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}