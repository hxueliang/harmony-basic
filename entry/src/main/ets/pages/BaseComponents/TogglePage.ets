@Entry
@Component
struct TogglePage {
  build() {
    Column() {
      Row() {
        Toggle({
          type: ToggleType.Switch,
          isOn: false
        })
          .size({ width: 70, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
        Toggle({
          type: ToggleType.Switch,
          isOn: true
        })
          .size({ width: 70, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
      }

      Row() {
        Toggle({
          type: ToggleType.Checkbox,
          isOn: false
        })
          .size({ width: 40, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
        Toggle({
          type: ToggleType.Checkbox,
          isOn: true
        })
          .size({ width: 40, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
      }

      Row() {
        Toggle({
          type: ToggleType.Button,
          isOn: false
        })
          .size({ width: 40, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
        Toggle({
          type: ToggleType.Button,
          isOn: true
        })
          .size({ width: 40, height: 40 })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
      }
    }
    .margin({ top: 100 })
    .height('100%')
    .width('100%')
  }
}