const COUNT = 5

@Entry
@Component
struct ModalPage {
  @State
  showModal: boolean = false
  @State
  count: number = COUNT

  @Builder
  getContext() {
    Column() {
      Row() {
        Text(`剩余${this.count}秒`)
          .fontColor(Color.White)
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('rgba(0, 0, 0, 0.8)')
  }

  build() {
    Row() {
      Column() {
        Text('Hello World')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('模态显示')
          .onClick(() => {
            this.showModal = !this.showModal
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}