@Entry
@Component
struct ExtendModifier {
  build() {
    Column({ space: 20 }) {
      Button('微信支付')
      Button('支付宝支付')
    }
    .width('100%')
    .padding(20)
  }
}