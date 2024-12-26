@Entry
@Component
struct PanelPage {
  build() {
    Panel(true) {
      Column() {
        Text('今日历程').fontSize(20)
        Text('1、html').fontSize(20)
        Text('1、css').fontSize(20)
        Text('1、js').fontSize(20)
        Text('1、ts').fontSize(20)
      }
    }
  }
}