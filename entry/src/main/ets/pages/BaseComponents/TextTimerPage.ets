@Entry
@Component
struct TextTimerPage {
  private textTimerController: TextTimerController = new TextTimerController()

  build() {
    Column() {
      // 计时器组件
      TextTimer({
        controller: this.textTimerController,
        isCountDown: true, // 是否倒计时，默认值为false
        count: 10 * 1000 // 倒计时时间
      })
        .format('mm:ss.SS')
        .fontColor(Color.Black)
        .fontSize(50)

      Row() {
        Button('开始').onClick(() => {
          this.textTimerController.start()
        })
        Button('暂停').onClick(() => {
          this.textTimerController.pause()
        })
        Button('重置').onClick(() => {
          this.textTimerController.reset()
        })
      }
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}