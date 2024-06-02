@Entry
@Component
struct PayAbPage {
  @State message: string = '支付Ability';
  @StorageProp('order_id')
  orderId: number = 0

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Text(this.orderId.toString())
      }
      .width('100%')
    }
    .height('100%')
  }
}