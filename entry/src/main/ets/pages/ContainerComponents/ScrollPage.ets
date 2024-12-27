@Entry
@Component
struct ScrollPage {
  @State numberArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Scroll() {
      Column({ space: 10 }) {
        ForEach(this.numberArray, (item: number) => {
          Text(item + '')
            .width('90%')
            .height(250)
            .backgroundColor(0xFFFFFF)
            .borderRadius(16)
            .fontSize(26)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 })
        }, (item: number) => item.toString())
      }.width('100%').backgroundColor('#f0f0f0')
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(8)
    .edgeEffect(EdgeEffect.None)
    .onScroll((xOffset: number, yOffset: number) => {
      console.log('hxl onScroll', xOffset, yOffset)
    })
    .onScrollEdge((side: Edge) => {
      console.log('hxl onScrollEdge', JSON.stringify(side))
    })
    .onScrollEnd(() => {
      console.log('hxl onScrollEnd', 'Scroll Stop')
    })
  }
}