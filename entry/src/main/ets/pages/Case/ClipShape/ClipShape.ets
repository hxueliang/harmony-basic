import { display, PathShape } from '@kit.ArkUI'

const X = 100
const H = 200
let W = 400

let cmdLeft = ''
let cmdRight = ''

interface IBtnItem {
  title: string
  subtitle: string
}

const btnList: IBtnItem[] = [
  { title: '标题1', subtitle: '小标题1', },
  { title: '标题2', subtitle: '小标题2', }
]

@Entry
@Component
struct ClipShape {
  @State btnIndex: number = 0

  aboutToAppear(): void {
    W = (display.getDefaultDisplaySync().width + X) / 2
    cmdLeft = `M0 0 L${W} 0 L${W - X} ${H} L0 ${H} Z`
    cmdRight = `M${X} 0 L${W} 0 L${W} ${H} L0 ${H} Z`
  }

  @Styles
  columStyles() {
    .width(`${W}px`)
    .height(`${H}px`)
  }

  build() {
    Column({ space: 15 }) {
      Row() {
        ForEach(btnList, (item: IBtnItem, index: number) => {
          Column() {
            Text(item.title)
            Text(item.subtitle)
          }
          .columStyles()
          .columnExtend(index == 0 ? cmdLeft : cmdRight, this.btnIndex === index ? 'red' : 'gray', `-${index * X}px`)
          .onClick(() => {
            this.btnIndex = index
          })
        })
      }
    }
    .width('100%')
    .margin({ top: 50 })
  }
}

@Extend(Column)
function columnExtend(commands: string, bg: string, x: string) {
  .clipShape(new PathShape().commands(commands))
  .backgroundColor(bg)
  .translate({ x })
  .justifyContent(FlexAlign.Center)
}
