@Entry
@Component
struct StylesModifier {
  build() {
    Column({ space: 20 }) {
      Button('立即支付')
      Button('立即支付')
    }
    .padding(20)
  }
}