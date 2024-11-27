@Entry
@Component
struct BadgePage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 30 }) {
      Badge({
        value: '',
        style: {
          badgeSize: 18,
          badgeColor: '#f00'
        }
      }) {
        Image($r('app.media.orange')).width(80).borderRadius(40)
      }

      Badge({
        value: 'New',
        position: BadgePosition.RightTop,
        style: {
          badgeSize: 18,
          badgeColor: '#f00'
        }
      }) {
        Text('我的消息').width(170).height(40).fontSize(40)
      }

      Badge({
        value: '1',
        position: BadgePosition.Right,
        style: {
          badgeSize: 24,
          fontSize: 16,
          badgeColor: '#f00'
        }
      }) {
        Text('我的消息').width(170).height(40).fontSize(40)
      }
    }
    .height('100%')
    .width('100%')
    .padding({ top: 100 })
  }
}