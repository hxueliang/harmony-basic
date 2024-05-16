@Component
struct ZhCommentItem {
  build() {
    Row({ space: 16 }) {
      Image($rawfile('image/mouse.jpeg'))
        .width(50)
        .aspectRatio(1)
        .borderRadius(25)

      Column({ space: 12 }) {
        Text('周天王')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('要打开收到了砍，大煞风景的反抗精神，收到了房间，算了房间爱上的房间，收到放辣椒，舒服舒服的风。')
          .lineHeight(22)
          .maxLines(2)
          .width('100%')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Row() {
          Text('10-21.IP属性广州')
            .fontColor('#ccc')
          Row({ space: 5 }) {
            Image($r('app.media.ic_public_like'))
              .width(12)
              .fillColor('#ccc')
            Text('100')
              .fontColor('#ccc')
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .padding(20)
    .alignItems(VerticalAlign.Top)
  }
}

export {
  ZhCommentItem
}