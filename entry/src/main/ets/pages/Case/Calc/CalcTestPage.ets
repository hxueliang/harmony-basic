import { Calculator } from './Calculator'

@Entry
@Component
struct CalcTestPage {
  build() {
    Column() {
      Button('测试recursiveCompute').onClick(() => {
        // 先把 recursiveCompute 的 private 除掉再做测试
        // const res = Calculator.recursiveCompute(['1.1', '-', '0.1', '+', '2', '*', '3', '/', '4'])
        // console.log('hxl', JSON.stringify(res))
      })

      Button('测试calculate').onClick(() => {
        const res = Calculator.calculate('1.1-0.1+2*3/4')
        console.log('hxl', JSON.stringify(res))
      })
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}