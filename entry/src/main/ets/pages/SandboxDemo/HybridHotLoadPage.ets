@Entry
@Component
struct HybridHotLoadPage {
  @State
  loading: boolean = false
  @State
  currentValue: number = 0
  @State
  totalValue: number = 0

  @Builder
  loadingDialog() {
    Column() {
      Progress({
        value: this.currentValue,
        total: this.totalValue,
        type: ProgressType.Ring,
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('rgba(0, 0, 0, 0.7)')
  }

  async download() {
  }

  build() {
    Row() {
      Column() {
        Button('下载zip')
          .onClick(() => {
            this.download()
          })
      }
      .width('100%')
    }
    .height('100%')
    .bindContentCover($$this.loading, this.loadingDialog)
  }
}