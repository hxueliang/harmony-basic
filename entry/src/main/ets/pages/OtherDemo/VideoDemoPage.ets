@Entry
@Component
struct VideoDemoPage {
  build() {
    Column() {
      Video({
        src: 'https://jvod.300hu.com/vod/product/1707733877/21852/74f89efdcca54de096576e8293b068a9.mp4?source=1&h265=1088_1561_1_0aadb71d4_f.mp4',
        previewUri: $r('app.media.red'),
        currentProgressRate: 1.01, // 播放陪速
        controller: new VideoController()
      })
        .width(400)
        .height(600)
        .autoPlay(false)
        .controls(true)
    }
    .height('100%')
    .width('100%')
  }
}