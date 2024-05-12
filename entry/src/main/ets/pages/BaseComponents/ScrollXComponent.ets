@Entry
@Component
struct ScrollXComponent {
  build() {
    Column({ space: 20 }) {
      Scroll() {
        Row({ space: 10 }) {
          Actor()
          Actor()
          Actor()
          Actor()
          Actor()
        }
      }
      Row({ space: 20 }) {
        Button('滚动左')
        Button('滚动右')
      }
    }
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}

@Component
struct Actor {
  build() {
    Row() {
      Text('牛德华')
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Brown)
    .width(100)
    .height(150)
  }
}