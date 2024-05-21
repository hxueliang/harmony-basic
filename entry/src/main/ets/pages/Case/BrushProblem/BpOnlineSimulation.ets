@Entry
@Component
struct BpOnlineSimulation {
  @Styles
  getContextPadding() {
    .padding({
      left: 16,
      right: 16,
    })
  }

  @Builder
  getTopUI() {
    Row() {
      Image($r('app.media.ic_public_left_arrow'))
        .getImageStyle()
      Text('在线模拟')
        .fontSize(17)
        .fontColor('#191919')
      Image($r('app.media.ic_public_pb_file'))
        .getImageStyle(24)
    }
    .getTopStyle()
  }

  @Builder
  getBottomUI() {
    Row() {
      Row({ space: 10 }) {
        Image($r('app.media.ic_public_left_arrow'))
          .getImageStyle(16)
        Text('上一题')
      }

      Row({ space: 10 }) {
        Text('上一题')
        Image($r('app.media.ic_public_left_arrow'))
          .getImageStyle(16)
          .rotate({
            angle: 180,
          })
      }
    }
    .getTopStyle()
  }

  build() {
    Column({ space: 10 }) {
      // 顶部
      this.getTopUI()

      // 进度条
      Progress({
        value: 10,
        total: 100,
      })
        .getContextPadding()

      // 中部
      Column() {

      }
      .layoutWeight(1)

      // 底部
      this.getBottomUI()
    }
  }
}

@Extend(Row)
function getTopStyle() {
  .width('100%')
  .height(56)
  .justifyContent(FlexAlign.SpaceBetween)
  .padding({
    left: 16,
    right: 16,
  })
}

@Extend(Image)
function getImageStyle(width: number = 20) {
  .width(width)
  .aspectRatio(1)
}
