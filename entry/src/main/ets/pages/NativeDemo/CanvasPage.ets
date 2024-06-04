@Entry
@Component
struct CanvasPage {
  build() {
    Row() {
      Column({ space: 10 }) {
        Row({ space: 10 }) {
          Button('画线')
            .onClick(() => {
            })
          Button('画叉')
            .onClick(() => {
            })
          Button('画对勾')
            .onClick(() => {
              this.drawRight()
            })
          Button('清空')
            .onClick(() => {
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}