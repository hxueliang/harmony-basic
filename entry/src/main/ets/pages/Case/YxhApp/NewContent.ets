import { webview } from '@kit.ArkWeb'

@Component
export struct NewContent {
  private controller = new webview.WebviewController()

  build() {
    Column() {
      Web({
        src: 'https://fangbao-oss.yuexiuproperty.cn/dist/index.html#/project?source=h5',
        controller: this.controller
      })
        .domStorageAccess(true)
        .width('100%')
        .height('130%')
        .onAppear(() => {
          this.controller
        })
    }
    .padding({ top: 50 })
  }
}