@Entry
@Component
struct ShapePage {
  build() {
    Column({ space: 20 }) {
      // 在 Shape 的 (-2， 118) 点绘制一个 300*10 的直线路径，颜色为 0x317AF7，边框颜色为黑色，
      // 宽度为4，间隙为20，向左偏移10，线条两端样式为半圆，拐角样式为圆角，抗锯齿（默认开启）
      Shape() {
        Rect().width(300).height(50)
        Ellipse().width(300).height(50).offset({ x: 0, y: 60 })
        Path().width(300).height(10).commands('M0 0 L900 0').offset({ x: 0, y: 120 })
      }
      .viewPort({
        x: -2,
        y: -2,
        width: 304,
        height: 130
      })
      .fill(0x317AF7)
      .stroke(Color.Black)
      .strokeWidth(4)
      .strokeDashArray([20])
      .strokeDashOffset(10)
      .strokeLineCap(LineCapStyle.Round)
      .strokeLineJoin(LineJoinStyle.Round)
      .antiAlias(true)
      .backgroundColor('#f5f5f5')

      // 分别在Shape 的 (0, 0)、(-5, -5)点绘制一个 300*50 的带边框矩形，可以看出之所以将视口的起始位置坐标设为负值，
      // 是因为绘制的起点默认为线宽的中点位置，因此要让边框完全显示，则需要让视口偏移半线宽
      Shape() {
        Rect().width(300).height(50)
      }
      .viewPort({
        x: 0,
        y: 0,
        width: 320,
        height: 70
      })
      .fill(0x217AF7)
      .stroke(Color.Black)
      .strokeWidth(10)
      .backgroundColor('#f5f5f5')

      // 在 Shape 的 (0, -5) 点绘制一条直线路径，颜色为 0xEE8443，线条宽度为10，线条间隙为20
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])

      // 在 Shape 的 (0, -5) 点绘制一条直线路径，颜色为 0xEE8443，线条间隙为20，向左偏移10
      Shape() {
        Path().width(300).height(10).commands('M0 0 L 900 0')
      }
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])
      .strokeDashOffset(10)

      // 在 Shape 的 (0, -5) 点绘制一条直线路径，颜色为 0xEE8443，线条宽度为10，透明度为0.5
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeOpacity(0.5)

      // 在 Shape 的 (0, -5) 点绘制一条直线路径，颜色为 0xEE8443，线条宽度为10，线条间隙为20，线条两端样式为半圆
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])
      .strokeLineCap(LineCapStyle.Round)

      // 在 Shape 的 (-80, -5) 点绘制一个封闭路径，颜色为 0x317AF7，线条宽度为10，边框颜色为 0xEE8443，拐角样式为锐角（默认值）
      Shape() {
        Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
      }
      .viewPort({
        x: -80,
        y: -5,
        width: 310,
        height: 90
      })
      .fill(0x317AF7)
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeLineJoin(LineJoinStyle.Miter)
      .strokeMiterLimit(5)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}