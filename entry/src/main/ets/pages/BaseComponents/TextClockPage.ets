@Entry
@Component
struct TextClockPage {
  build() {
    Column() {
      TextClock().margin(20).fontSize(30)

      TextClock().margin(20).fontSize(30).format('yyyy/MM/dd HH:mm:ss')
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}