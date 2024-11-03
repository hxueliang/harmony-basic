@Entry
@Component
struct TextInputPage {
  build() {
    Column() {
      TextInput()
        .type(InputType.Password)
        .placeholderColor('blue')
        .placeholderFont({
          size: 20,
          weight: 500,
          family: '',
          style: FontStyle.Italic
        })
        .enterKeyType(EnterKeyType.Go)// 设置输入法回车键类型，目前公支持默认类型显示
        .caretColor(Color.Red)// 光标颜色
        .maxLength(10)// 文本最大输入字符数
        .showPasswordIcon(true) // 在密码输入模式，输入框末尾的图标是否显示，默认值true
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}