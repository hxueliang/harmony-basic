@Entry
@Component
struct UIAbilityLifecycle {
  @State message: string = 'UI Ability Lifecycle';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}