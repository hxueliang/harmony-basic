@Entry
@Component
struct NavigatorPage {
  @State active: boolean = false
  @State Text: object = new Object({ name: 'detail' })

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Start,
      justifyContent: FlexAlign.SpaceBetween,
    }) {
      Navigator({
        target: 'pages/ContainerComponents/Navigator/DetailPage',
        type: NavigationType.Push
      }) {
        Text(`Go to ${this.Text['name']} page`).fontSize(30).width('100%').textAlign(TextAlign.Center)
      }.params({ text: this.Text })

      Navigator() {
        Text('Back to previous page').fontSize(30).width('100%').textAlign(TextAlign.Center)
      }.active(this.active).onClick(() => {
        this.active = true
      })
    }
    .height(150)
    .width('100%')
    .backgroundColor('red')
    .padding({ top: 40 })
  }
}