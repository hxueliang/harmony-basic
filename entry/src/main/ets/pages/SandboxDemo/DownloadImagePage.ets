@Entry
@Component
struct DownloadImagePage {
  @State
  url: string = 'http://inews.gtimg.com/newsapp_bt/0/11546610060/1000'

  async onDownload() {
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Image(this.url)
          .width('100%')
          .height(250)

        Button('下载图片')
          .onClick(() => {
            this.onDownload()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}