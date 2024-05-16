import { ZhCommentItem, ZhNavBar } from './components'

@Entry
@Component
struct ZhiHu {
  build() {
    Column() {
      ZhNavBar({ title: '评论回复' })
      ZhCommentItem()
      Divider().strokeWidth(6)
      Row() {
        Text('回复数 6')
          .width('100%')
          .height(50)
          .border({
            color: '#f0f0f0',
            width: 1,
          })
          .padding({
            left: 20
          })
      }
      List() {
        ForEach([1, 2, 3, 4, 5, 6], () => {
          ListItem() {
            ZhCommentItem()
          }
        })
      }
      .layoutWeight(1)
    }
  }
}