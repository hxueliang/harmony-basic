import MTBottom from './components/MTBottom'
import MTCart from './components/MTCart'
import MTMain from './components/MTMain'
import MTTop from './components/MTTop'

@Entry
@Component
struct MTIndex {
  @Provide
  showCart: boolean = false

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