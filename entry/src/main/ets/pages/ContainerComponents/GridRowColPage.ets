@Entry
@Component
struct GridRowColPage {
  private bgColors: Color[] = [
    Color.Red,
    Color.Orange,
    Color.Yellow,
    Color.Green,
    Color.Pink,
    Color.Grey,
    Color.Blue,
    Color.Brown
  ]

  build() {
    Column() {
      GridRow({
        columns: 5, // 设置布局列数
        gutter: { x: 5, y: 20 }, // 栅格布局间距，x代表水平方向，y代码垂直方向
        breakpoints: {
          value: ['600vp', '800vp'], // 断点发生变化时触发回调
          reference: BreakpointsReference.WindowSize
        },
        direction: GridRowDirection.Row // 栅格布局排列方向
      }) {
        ForEach(this.bgColors, (color: Color) => {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            }
          }) {
            Row().width('100%').height('80vp')
          }.backgroundColor(color).borderWidth(2)
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}