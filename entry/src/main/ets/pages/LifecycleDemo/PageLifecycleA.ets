import { router } from '@kit.ArkUI';

@Entry
@Component
struct PageLifecycleA {
  @State message: string = 'PageLifecycle A';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('go B')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/LifecycleDemo/PageLifecycleB'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}