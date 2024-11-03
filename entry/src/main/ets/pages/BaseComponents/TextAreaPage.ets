import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct TextAreaPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      TextArea({
        placeholder: '请输入内容',
      })
        .placeholderColor('red')
        .placeholderFont({
          size: 20,
          weight: 500,
          family: '',
          style: FontStyle.Italic
        })
        .textAlign(TextAlign.Center)
        .caretColor('green')// 光标颜色
        .inputFilter('[0-9]', (val) => { // 只允许输入0-9这10个字符，其他字符输入无效
          promptAction.showToast({ message: '只允许输入0-9这10个字符，其他字符输入无效' })
          return 0;
        })
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}