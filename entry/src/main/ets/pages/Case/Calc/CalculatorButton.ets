import { Calculator } from './Calculator'
import { CalculatorButtonInfo } from './CalculatorButtonInfo'

@Component
export struct CalculatorButton {
  @State input: string = '' // 输入内容
  /**
   * 单击计算器按钮
   * @param value
   */
  onClickBtn = (text: string) => {
    switch (text) {
      case 'C': // 清空所有输入
        this.input = ''
        break
      case '⬅': // 删除输入是最后一个字符
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

  }
}

