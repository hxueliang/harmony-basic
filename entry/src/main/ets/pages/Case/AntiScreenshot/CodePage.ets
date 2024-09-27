import { router, window } from '@kit.ArkUI';

@Entry
@Component
struct CodePage {
  onPageShow(): void {
    this.setWindowPrivacyModeInPage(true)
  }

  onPageHide(): void {
    this.setWindowPrivacyModeInPage(false)
  }

  setWindowPrivacyModeInPage(isFlag: boolean) {
    const windowStage = AppStorage.get('windowStage') as window.WindowStage
    windowStage.getMainWindowSync().setWindowPrivacyMode(isFlag)
  }

  build() {
    Column({ space: 20 }) {
      Text('验证码页').fontSize(30).padding({ top: 60 })
      Button('获取验证码')
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