@Entry
@Component
struct CounterPage {
  @State counterValue: number = 0;

  build() {
    Column() {
      Text(this.counterValue.toString())
      Counter() {
        Text(this.counterValue.toString())
      }.onInc(() => {
        this.counterValue++
      }).onDec(() => {
        this.counterValue--
      })
    }
    .height('100%')
    .width('100%')
    .padding({ top: 100 })
  }
}