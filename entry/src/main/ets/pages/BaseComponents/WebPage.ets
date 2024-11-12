import { webview } from '@kit.ArkWeb'

@Entry
@Component
struct WebPage {
  private controller = new webview.WebviewController()

  build() {
    Column() {
      Web({
        src: 'https://www.baidu.com',
        controller: this.controller
      })
    }
    .height('100%')
    .width('100%')
  }
}