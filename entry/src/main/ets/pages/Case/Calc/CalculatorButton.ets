import { Calculator } from './Calculator'
import { CalculatorButtonInfo } from './CalculatorButtonInfo'

@Component
export struct CalculatorButton {
  @State input: string = '' // 输入内容
  private BTN_INFO_ARRAY: CalculatorButtonInfo[] = [
    new CalculatorButtonInfo('C', Color.Blue),
    new CalculatorButtonInfo('/', Color.Blue),
    new CalculatorButtonInfo('*', Color.Blue),
    new CalculatorButtonInfo('←', Color.Blue),
    new CalculatorButtonInfo('7'),
    new CalculatorButtonInfo('8'),
    new CalculatorButtonInfo('9'),
    new CalculatorButtonInfo('-', Color.Blue),
    new CalculatorButtonInfo('4'),
    new CalculatorButtonInfo('5'),
    new CalculatorButtonInfo('6'),
    new CalculatorButtonInfo('+', Color.Blue),
    new CalculatorButtonInfo('1'),
    new CalculatorButtonInfo('2'),
    new CalculatorButtonInfo('3'),
    new CalculatorButtonInfo('=', Color.White, Color.Blue),
    new CalculatorButtonInfo('%'),
    new CalculatorButtonInfo('0'),
    new CalculatorButtonInfo('.'),
  ]
  /**
   * 单击计算器按钮
   * @param value
   */
  onClickBtn = (text: string) => {
    switch (text) {
      case 'C': // 清空所有输入
        this.input = ''
        break
      case '←': // 删除输入是最后一个字符
        if (this.input.length > 0) {
          this.input = this.input.substring(0, this.input.length - 1)
        }
        break
      case '=': // 计算结果
        this.input = Calculator.calculate(this.input)
        break
      default: // 输入
        this.input += text
        break
    }
  }

  /**
   * 构造计算按钮
   */
  @Builder
  CalculatorButton(btnInfo: CalculatorButtonInfo) {
    GridItem() {
      Text(btnInfo.text)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('100%')
        .textAlign(TextAlign.Center)
        .borderRadius(100)
        .fontColor(btnInfo.textColor)
        .backgroundColor(btnInfo.bgColor)
    }
    .forceRebuild(false)
    .onClick(() => this.onClickBtn(btnInfo.text))
    .rowStart(btnInfo.text === '=' ? 4 : null)
    .rowEnd(btnInfo.text === '=' ? 5 : null)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          // 输入显示区
          Text(this.input.length === 0 ? '0' : this.input)
            .width('100%')
            .padding(10)
            .textAlign(TextAlign.End)
            .fontSize(46)

          // 按钮区
          Grid() {
            // 遍历生成按钮
            ForEach(this.BTN_INFO_ARRAY, (btnInfo: CalculatorButtonInfo) => this.CalculatorButton(btnInfo))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(2)
          .rowsGap(2)
          .width('100%')
          .aspectRatio(1)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Gray)
    }
    .height('100%')
    .width('100%')
  }
}

