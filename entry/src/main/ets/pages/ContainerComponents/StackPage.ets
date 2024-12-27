@Entry
@Component
struct StackPage {
  @State message: string = 'Hello World';

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Text('第一层')
        .width('90%')
        .height('80%')
        .backgroundColor(Color.Gray)
        .align(Alignment.Top)
        .fontSize(40)

      Text('第二层')
        .width('70%')
        .height('60%')
        .backgroundColor(Color.Orange)
        .align(Alignment.Top)
        .fontSize(40)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 5 })
  }
}