import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WatchModifier {
  @State
  @Watch('changeNumber')
  number: number = 0

  changeNumber() {
    promptAction.showToast({
      message: `父组件监听number：${this.number}`
    })
  }

  build() {
    Row() {
      Column() {
        Button(`父组件：${this.number}`)
          .onClick(() => {
            this.number++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
