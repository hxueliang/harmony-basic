import { YxhSwiper, YxhCardNav } from './components'

@Entry
@Component
export struct HomeContent {
  build() {
    Column() {
      YxhSwiper()

      YxhCardNav()
    }
  }
}