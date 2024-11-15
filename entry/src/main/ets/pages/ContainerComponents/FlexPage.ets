@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Flex({ direction: FlexDirection.Row }) {
        Text('1').width('20%').height(50).backgroundColor(Color.Blue)
        Text('2').width('20%').height(50).backgroundColor(Color.Brown)
        Text('3').width('20%').height(50).backgroundColor(Color.Green)
        Text('4').width('20%').height(50).backgroundColor(Color.Orange)
      }
      .height('40%')
      .width('90%')
      .padding(10)
      .backgroundColor(Color.Gray)

      Flex({ direction: FlexDirection.Column }) {
        Text('1').width('20%').height(50).backgroundColor(Color.Blue)
        Text('2').width('20%').height(50).backgroundColor(Color.Brown)
        Text('3').width('20%').height(50).backgroundColor(Color.Green)
        Text('4').width('20%').height(50).backgroundColor(Color.Orange)
      }
      .height('40%')
      .width('90%')
      .padding(10)
      .backgroundColor(Color.Gray)
    }
    .height('100%')
    .width('100%')
  }
}