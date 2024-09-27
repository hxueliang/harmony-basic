import { router } from '@kit.ArkUI'

@Entry
@Component
struct CodePage {
  build() {
    Column({ space: 20 }) {
      Text('主页').fontSize(30).padding({ top: 60 })
      Button('返回登录页').onClick(() => {
        router.replaceUrl({
          url: 'pages/Case/AntiScreenshot/LoginPage'
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}