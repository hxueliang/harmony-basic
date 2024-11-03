@Entry
@Component
struct TimePickerPage {
  build() {
    Column() {
      TimePicker().useMilitaryTime(true)
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}