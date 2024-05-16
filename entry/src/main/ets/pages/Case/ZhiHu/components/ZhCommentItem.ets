import { ReplyItem, ReplyItemModel } from '../models'

@Component
struct ZhCommentItem {
  item: ReplyItemModel = new ReplyItemModel({} as ReplyItem)

  build() {
    Row({ space: 16 }) {
      Image(this.item.avatar)
        .width(50)
        .aspectRatio(1)
        .borderRadius(25)

      Column({ space: 12 }) {
        Text(this.item.author)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .lineHeight(22)
          .maxLines(2)
          .width('100%')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Row() {
          Text(`${this.item.time} .IP属性${this.item.area}`)
            .fontColor('#ccc')
          Row({ space: 5 }) {
            Image($r('app.media.ic_public_like'))
              .width(12)
              .fillColor('#ccc')
            Text(this.item.likeNum.toString())
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