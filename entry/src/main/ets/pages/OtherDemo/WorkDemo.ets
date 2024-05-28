@Entry
@Component
struct WorkDemo {
  build() {
    Row() {
      Column() {
        Button('点击')
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}