import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct RouterPageA {
  aboutToAppear(): void {
    promptAction.showToast({ message: '加载：A' })
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text('Page A')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Row({ space: 5 }) {
          Button('push:B')
            .onClick(() => {
            })
          Button('replace:B')
            .onClick(() => {
            })
          Button('push含参:B')
            .onClick(() => {
            })
        }

        Row({ space: 5 }) {
          Button('push:A')
            .onClick(() => {
            })
          Button('replace:A')
            .onClick(() => {
            })
        }

        Row({ space: 5 }) {
          Text('router栈长度为：')
          Button('clear')
            .onClick(() => {
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}