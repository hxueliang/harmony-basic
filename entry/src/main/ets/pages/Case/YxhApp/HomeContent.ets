import { YxhSwiper } from './components'

@Entry
@Component
export struct HomeContent {
  build() {
    Column() {
      YxhSwiper().height(240)
      
    }
  }
}