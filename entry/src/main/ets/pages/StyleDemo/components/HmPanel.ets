@Component
struct HmPanel {
  @State heightPanel: number = 300
  @State bgPanel: ResourceColor = '#ccc'

  build() {
    Column() {
    }
    .width('100%')
    .height(this.heightPanel)
    .backgroundColor(this.bgPanel)
    .padding(20)
    .borderRadius(8)
  }
}

export {
  HmPanel
}