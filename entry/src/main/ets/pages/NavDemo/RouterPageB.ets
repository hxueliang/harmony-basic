import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterPageB {
  @State message: string = 'Hello World';
  @State
  a: number = 0

  aboutToAppear(): void {
    this.a = (router.getParams() as IObj).a
  }

  build() {
    Row() {
      Column() {
        Text('Page B')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text(`参数是${this.a}`)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface IObj {
  a: number
}