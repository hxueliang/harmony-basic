@Entry
@Component
struct RouterPageB {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text('Page B')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}