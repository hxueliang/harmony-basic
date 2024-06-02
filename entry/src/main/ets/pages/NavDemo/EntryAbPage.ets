import { common } from '@kit.AbilityKit';

@Entry
@Component
struct EntryAbPage {
  @State message: string = '主Ability';

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)

        Button('拉起支付Ability')
          .onClick(() => {
            const context = getContext() as common.UIAbilityContext
            context.startAbility({
              deviceId: '', // 设备id，不传为本机
              bundleName: 'com.example.harmonybasic', // 应用包名，AppScope/app.json5
              abilityName: 'PayAbility', // ability名，entry/src/main/module.json5
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}