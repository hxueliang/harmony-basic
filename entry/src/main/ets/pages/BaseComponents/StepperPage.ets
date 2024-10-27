@Entry
@Component
struct StepperPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Stepper({
        index: 0
      }) {
        StepperItem() {
          Text('第1页').fontSize(34)
        }.nextLabel('下一页')

        StepperItem() {
          Text('第2页').fontSize(34)
        }.prevLabel('上一页').nextLabel('下一页')

        StepperItem() {
          Text('第3页').fontSize(34)
        }.prevLabel('上一页')
      }
    }
    .height('100%')
    .width('100%')
  }
}