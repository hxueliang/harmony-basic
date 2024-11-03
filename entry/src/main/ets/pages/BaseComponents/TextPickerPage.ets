import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct TextPickerPage {
  build() {
    Column() {
      /**
       * 滑动选择文本内容
       */
      TextPicker({
        range: ['html', 'css', 'js', 'ts', 'java', 'c++', 'py', 'go'],
        selected: 3,
      })
        .defaultPickerItemHeight(24)// 各选择的高度
        .canLoop(false)// 能否循环
        .onChange((value: string | string[], index: number | number[]) => {
          promptAction.showToast({ message: value + '  ' + index })
        })
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}