@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceEvenly,
        alignItems: ItemAlign.Start,
        alignContent: FlexAlign.Center
      }) {
        Text('1').width('20%').height(50).backgroundColor(Color.Blue)
        Text('2').width('20%').height(50).backgroundColor(Color.Brown)
        Text('3').width('20%').height(50).backgroundColor(Color.Green)
        Text('4').width('20%').height(50).backgroundColor(Color.Orange)
        Text('5').width('20%').height(50).backgroundColor(Color.Pink)
        Text('6').width('20%').height(50).backgroundColor(Color.Yellow)
      }
      .height('30%')
      .width('90%')
      .backgroundColor(Color.Gray)

      Flex({ direction: FlexDirection.Column, wrap: FlexWrap.Wrap }) {
        Text('1').width('20%').height(50).backgroundColor(Color.Blue)
        Text('2').width('20%').height(50).backgroundColor(Color.Brown)
        Text('3').width('20%').height(50).backgroundColor(Color.Green)
        Text('4').width('20%').height(50).backgroundColor(Color.Orange)
        Text('5').width('20%').height(50).backgroundColor(Color.Pink)
        Text('6').width('20%').height(50).backgroundColor(Color.Yellow)
      }
      .height('30%')
      .width('90%')
      .padding(10)
      .backgroundColor(Color.Gray)
    }
    .height('100%')
    .width('100%')
    .padding(10)
  }
}