const arrayA: string[] = ['a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9']
const arrayB: string[] = ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9']
const arrayC: string[] = ['c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9']
const arrayD: string[] = ['d1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'd8', 'd9']
const arrayE: string[] = ['e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8', 'e9']
const arrayF: string[] = ['f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9']

@Entry
@Component
struct AlphabetIndexerPage {
  @State arrayA: string[] = arrayA
  @State arrayB: string[] = arrayB
  @State arrayC: string[] = arrayC
  @State arrayD: string[] = arrayD
  @State arrayE: string[] = arrayE
  @State arrayF: string[] = arrayF
  @State arrayAll: string[][] = [arrayA, arrayB, arrayC, arrayD, arrayE, arrayF]
  @State arrayValue: string[] = ['A', 'B', 'C', 'D', 'E', 'F']

  build() {
    Row() {
      List({ space: 10, initialIndex: 0 }) {
        // ForEach(this.arrayAll, (arr: string[]) => {
        //   ForEach(arr, (str: string) => {
        //     ListItem() {
        //       Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
        //     }
        //   }, (item: string) => item)
        // })
        ForEach(this.arrayA, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
        ForEach(this.arrayB, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
        ForEach(this.arrayC, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
        ForEach(this.arrayD, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
        ForEach(this.arrayE, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
        ForEach(this.arrayF, (str: string) => {
          ListItem() {
            Text(str).width('80%').height('5%').fontSize(20).textAlign(TextAlign.Center)
          }
        }, (str: string) => str)
      }.width('50%').height('100%')

      AlphabetIndexer({ arrayValue: this.arrayValue, selected: 0 })
        .selectedColor(0xFFFFFF)// 选中项文本颜色
        .selectedBackgroundColor(0xCCCCCC)// 选中项背景颜色
        .selectedFont({ size: 16, weight: FontWeight.Bold })// 选中项字体样式
        .popupColor(0xFFFAF0)// 弹出框文本颜色
        .popupBackground(0xD2B48c)// 弹出框背景颜色
        .popupFont({ size: 30, weight: FontWeight.Bolder })// 弹出框字体样式
        .usingPopup(true)// 是否显示弹出框
        .itemSize(28)//每一项尺寸大小
        .alignStyle(IndexerAlign.Left)//弹出框在索引条右侧弹出
        .onRequestPopupData((index: number) => {
          if (this.arrayValue[index] === 'A') {
            return this.arrayA // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrA，选中B、C、D、E、F同理
          } else if (this.arrayValue[index] === 'B') {
            return this.arrayB
          } else if (this.arrayValue[index] === 'C') {
            return this.arrayC
          } else if (this.arrayValue[index] === 'D') {
            return this.arrayD
          } else if (this.arrayValue[index] === 'E') {
            return this.arrayE
          } else if (this.arrayValue[index] === 'F') {
            return this.arrayF
          } else {
            return [] // 选中其余字母项时，提示文本列表为空
          }
        })

    }
    .height('100%')
    .width('100%')
  }
}