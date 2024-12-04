import { router } from '@kit.ArkUI'

@Entry
@Component
struct DetailPage {
  params: object = router.getParams();
  @State text: object = this.params['text']

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Start,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Navigator({
        target: 'pages/ContainerComponents/Navigator/BackPage',
        type: NavigationType.Push,
      }) {
        Text('Go to back page').width('100%').height(20)
      }

      Text(`This is ${this.text['name']} page`).width('100%').textAlign(TextAlign.Center)
    }
    .height(200)
    .width('100%')
    .backgroundColor('blue')
    .padding({ top: 40 })
  }
}