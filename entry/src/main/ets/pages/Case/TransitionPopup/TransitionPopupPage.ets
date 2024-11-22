@Entry
@Component
struct TransitionPopupPage {
  @State flag1: boolean = false
  @State flag2: boolean = false

  build() {
    Column() {
      Button('chang 1').onClick(() => {
        this.flag1 = !this.flag1
      })
      if (this.flag1) {
        Text('1')
          .fontSize(30)
          .width('100%')
          .height(100)
          .backgroundColor(Color.Red)
          .transition(
            TransitionEffect
              .OPACITY
              .animation({ duration: 300 })
              .combine(
                TransitionEffect.translate({ y: 800 })
              )
          )
      }
      Button('chang 2').onClick(() => {
        this.flag2 = !this.flag2
      })
      if (this.flag2) {
        Text('2')
          .fontSize(30)
          .width('100%')
          .height(100)
          .backgroundColor(Color.Orange)
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.OPACITY.animation({ duration: 300 })
                .combine(TransitionEffect.translate({ y: 800 })),
              TransitionEffect.translate({ y: 800 }).animation({ duration: 300 })
                .combine(TransitionEffect.opacity(0))
            )
          )
      }
    }
    .height('100%')
    .width('100%')
  }
}