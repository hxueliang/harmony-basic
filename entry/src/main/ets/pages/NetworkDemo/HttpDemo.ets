@Entry
@Component
struct HttpDemo {
  list: object[] = []

  build() {
    Column() {
      Text(JSON.stringify(this.list))
    }
    .height('100%')
  }
}