@Entry
@Component
struct ProvideAndConsumeModifier {
  build() {
    Row() {
      Column({ space: 10 }) {
        Text(`grand组件：`)
          .fontSize(30)
        Father()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Father {
  build() {
    Column({ space: 10 }) {
      Text(`Father组件：`)
        .fontSize(30)
      Child()
    }
  }
}

@Component
struct Child {
  build() {
    Column() {
      Text(`Child组件：`)
        .fontSize(20)
    }
  }
}
