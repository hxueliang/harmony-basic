import { router } from '@kit.ArkUI'

@Entry
@Component
struct PersistentStorageLogin {
  build() {
    Column({ space: 20 }) {
      Button('登录')
        .width('100%')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ApplicationState/PersistentStorageMain'
          })
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}