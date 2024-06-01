@Entry
@Component
struct ModuleRouterNamePage {
  @State message: string = '模块间使用name方式跳转';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('跳转')
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}