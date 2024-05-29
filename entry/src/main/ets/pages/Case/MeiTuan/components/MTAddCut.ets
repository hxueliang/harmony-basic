@Extend(Text)
function textStyle() {
  .width(20)
  .aspectRatio(1)
  .textAlign(TextAlign.Center)
  .border({
    width: 0.67,
    color: $r('app.color.main_color')
  })
  .borderRadius(2)
}

@Preview
@Component
struct MTAddCut {
  @Styles
  imageStyle() {
    .width(10)
    .aspectRatio(1)
  }

  build() {
    Row() {
      Text() {
        ImageSpan($r('app.media.ic_screenshot_line'))
          .imageStyle()
      }
      .textStyle()

      Text('0')
        .width(28)
        .textAlign(TextAlign.Center)

      Text() {
        ImageSpan($r('app.media.ic_public_add_filled'))
          .imageStyle()
      }
      .textStyle()
      .backgroundColor($r('app.color.main_color'))
    }
  }
}

export default MTAddCut