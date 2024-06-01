import { router } from '@kit.ArkUI';

@Entry
@Component
struct PageLifecycleB {
  @State message: string = 'PageLifecycle B';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('go A')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/LifecycleDemo/PageLifecycleA'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}