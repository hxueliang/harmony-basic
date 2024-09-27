import { router, window } from '@kit.ArkUI'

@Entry
@Component
struct LoginPage {
  onPageShow(): void {
    this.setWindowPrivacyModeInPage(true)
  }

  onPageHide(): void {
    this.setWindowPrivacyModeInPage(false)
  }

  setWindowPrivacyModeInPage(flag: boolean) {
    const windowStage = AppStorage.get('windowStage') as window.WindowStage
    windowStage.getMainWindowSync().setWindowPrivacyMode(flag)
  }

  build() {
    Column({ space: 20 }) {
      Text('登录页').fontSize(30).padding({ top: 60 })
      Button('去验证码页').onClick(() => {
        router.replaceUrl({
          url: 'pages/Case/AntiScreenshot/CodePage'
        })
      })
      Button('去首页').onClick(() => {
        router.replaceUrl({
          url: 'pages/Case/AntiScreenshot/MainPage'
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}