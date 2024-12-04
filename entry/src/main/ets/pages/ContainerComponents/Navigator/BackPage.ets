@Entry
@Component
struct BackPage {
  build() {
    Column() {
      Navigator({
        target: 'pages/ContainerComponents/Navigator/NavigatorPage',
        type: NavigationType.Back
      }) {
        Text('Return to Navigator Page').width('100%').textAlign(TextAlign.Center)
      }
    }
    .height(200)
    .width('100%')
    .backgroundColor('green')
    .padding(35)
  }
}