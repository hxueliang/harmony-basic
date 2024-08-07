import { YxhSwiper, YxhCardNav, YxhStickyNav } from './components'

@Entry
@Component
export struct HomeContent {
  scroller = new Scroller()
  @State showTopNavBg: boolean = false

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Row() {
        Row() {
          Image(this.showTopNavBg ? $r('app.media.ic_yxh_location_color') : $r('app.media.ic_yxh_location'))
            .width(24)
            .padding({ right: 3 })
          Text(`广州市 | `)
            .fontColor(this.showTopNavBg ? Color.Black : Color.White)
          Text(`请登录`)
            .fontColor(this.showTopNavBg ? Color.Black : Color.White)
        }

        Row({ space: 10 }) {
          Image(this.showTopNavBg ? $r('app.media.ic_yxh_service_color') : $r('app.media.ic_yxh_service'))
            .width(24)
          Image(this.showTopNavBg ? $r('app.media.ic_yxh_mess_color') : $r('app.media.ic_yxh_mess'))
            .width(24)
        }
      }
      .zIndex(10)
      .width('100%')
      .height(100)
      .padding({ left: 16, right: 16, bottom: 16 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Bottom)
      .backgroundColor(this.showTopNavBg ? Color.White : Color.Transparent)

      Scroll(this.scroller) {
        Column() {
          YxhSwiper()

          YxhCardNav()

          YxhStickyNav()
        }
      }
      // .edgeEffect(EdgeEffect.Spring) // 边缘效应，设置为回弹
      .friction(0.6)
      .scrollBar(BarState.Off) // 关闭最外层滚动条
      .width('100%')
      .height('100%')
      .onScroll((x, y) => {
        if (y > 1) {
          this.showTopNavBg = true
        }
      })
      .onScrollEdge((side) => {
        this.showTopNavBg = !!side
      })
    }
  }
}