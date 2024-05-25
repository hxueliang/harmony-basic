@Entry
@Component
struct RequireModifier {
  build() {
    Row() {
      Column() {
        RequireChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct RequireChild {
  @Prop
  message: string = '默认prop'

  @Builder
  defaultContent() {
    Text('默的BuilderParam')
  }

  @BuilderParam
  getContentUI: () => void = this.defaultContent

  build() {
    Column() {
      Text(this.message)
      this.getContentUI()
    }
  }
}