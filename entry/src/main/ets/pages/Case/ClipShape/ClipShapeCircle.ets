import { PathShape } from '@kit.ArkUI'

@Entry
@Component
struct ClipShapeCircle {
  build() {
    Column() {
      Row() {
        Row() {
          Text('主标题').fontColor(Color.White).height(60).padding({ left: 20 })
        }

        Row() {
          Text('副标题').fontColor(Color.White).margin({ left: 50 })
        }
        .backgroundColor(Color.Green)
        .width(200)
        .height(50)
        .clipShape(new PathShape().commands(`
          M0 0
          L${vp2px(180)} 0
          S${vp2px(200)} 0 ${vp2px(200)} ${vp2px(20)}
          V${vp2px(50)}
          H${vp2px(50)}
          S${vp2px(33)} ${vp2px(50)} ${vp2px(30)} ${vp2px(40)}
          L${vp2px(15)} ${vp2px(8)}
          S${vp2px(15)} 0 0 0Z
        `))
      }
      .backgroundColor(Color.Orange)
      .width('100%')
      .height(60)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Top)
      .borderRadius({
        topLeft: 20,
        topRight: 20
      })
    }
    .height('100%')
    .width('100%')
    .padding({ top: 80 })
  }
}