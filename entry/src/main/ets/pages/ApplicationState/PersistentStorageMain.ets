@Entry
@Component
struct PersistentStorageMain {
  build() {
    Column({ space: 20 }) {
      Text('PersistentStorage Main')
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}