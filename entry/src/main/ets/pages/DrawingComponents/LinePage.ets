@Entry
@Component
struct LinePage {
  build() {
    Column({ space: 20 }) {
      // 线条绘制的起止点坐标均是相对于Line组件本身绘制区域的坐标
      Line()
        .startPoint([0, 0])
        .endPoint([50, 100])
        .stroke(Color.Orange)
        .backgroundColor('#f5f5f5')

      // 正常绘制
      Line()
        .width(200)
        .height(200)
        .startPoint([50, 50])
        .endPoint([150, 150])
        .strokeWidth(5)
        .stroke(Color.Orange)
        .strokeOpacity(0.5)
        .backgroundColor('#f5f5f5')

      // 当坐标点设置的值超出Line组件的宽度范围时，线条会画出组件绘制区域
      Line({ width: 200, height: 200 })
        .startPoint([0, 0])
        .endPoint([250, 250])
        .strokeWidth(5)
        .stroke(Color.Orange)
        .backgroundColor('#f5f5f5')

      // strokeDashOffset 用于定义关联虚线 strokeDashArray 数组渲染时的偏移
      Line({ width: 50, height: 50 })
        .startPoint([0, 0])
        .endPoint([100, 100])
        .strokeWidth(3)
        .strokeDashArray([10, 3])
        .strokeDashOffset(5)
        .stroke(Color.Orange)
        .backgroundColor('#f5f5f5')
    }
    .height('100%')
    .width('100%')
    .margin({ top: 40 })
  }
}