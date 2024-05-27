import { router } from '@kit.ArkUI'

PersistentStorage.persistProp('token', '123')

@Entry
@Component
struct PersistentStorageLogin {
  @StorageLink('token')
  token: string = '1'

  build() {
    Column({ space: 20 }) {
      Text(this.token)
      Button('登录')
        .width('100%')
        .onClick(() => {
          this.token = new Date().valueOf().toString()
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