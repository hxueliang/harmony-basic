@Entry
@Component
struct PayAbPage {
  @State message: string = '支付Ability';

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}