import MTAddCut from './MTAddCut'

@Preview
@Component
struct MTCartItem {
  build() {
    Row({ space: 10 }) {
      Image($rawfile('image/mouse.jpeg'))
        .width(80)
        .aspectRatio(1)
        .borderRadius(8)
      Column({ space: 10 }) {
        Text('小份酸汤莜面小份酸汤莜面小份酸汤莜面小份酸汤莜面小份酸汤莜面小份酸汤莜面小份酸汤莜面面面面')
          .maxLines(2)
          .fontSize(18)
          .width('100%')
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
        Row() {
          Text() {
            Span('￥')
              .fontSize(12)
            Span('34.32')
              .fontSize(24)
          }
          .fontColor($r('app.color.font_main_color'))
          .fontWeight(FontWeight.Bold)

          MTAddCut()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .height(80)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
  }
}

export default MTCartItem