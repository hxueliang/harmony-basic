import { router } from '@kit.ArkUI'

@Entry
@Component
struct RouterPageC {
  build() {
    Row() {
      Column() {
        Text('Page C')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}