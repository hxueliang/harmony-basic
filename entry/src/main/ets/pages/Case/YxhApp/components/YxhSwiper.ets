import { homeAdData, HomeAdItemModel } from '../mock'

@Preview
@Component
export struct YxhSwiper {
  build() {
    Swiper() {
      ForEach(homeAdData.data, (item: HomeAdItemModel) => {
        Image(`${item.imgUrl}?x-oss-process=image/resize,m_lfit,h_208,w_320`)
          .width('100%')
          .height('100%')
      })
    }
    .autoPlay(true)
    .width('100%')
    .height('100%')
    .indicator(
      Indicator.dot()
        .bottom(30)
        .itemWidth(5)
        .itemHeight(5)
        .selectedItemWidth(15)
        .selectedItemHeight(5)
        .selectedColor(Color.White)
    )
  }
}