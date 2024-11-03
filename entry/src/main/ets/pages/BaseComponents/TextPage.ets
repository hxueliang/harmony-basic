@Entry
@Component
struct TextPage {
  @State message: string = 'Hello World Hello World Hello World';

  build() {
    Column() {
      Text(this.message)
        .width('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })// 本文超长时显示方式
        .maxLines(1)// 最大行数
        .decoration({ type: TextDecorationType.Underline, color: 'red', style: TextDecorationStyle.DASHED })// 文本装饰线样式
        .baselineOffset(5)// 文本基线偏移量
        .letterSpacing(5)// 文本字符间距
        .minFontSize(16)
        .maxFontSize(50)
        .textCase(TextCase.LowerCase)// 文本大小写
        .copyOption(CopyOptions.InApp) // 组件支持设置文本是否可复制和粘贴

      TextInput()
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}