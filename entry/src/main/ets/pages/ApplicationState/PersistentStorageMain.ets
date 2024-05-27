@Entry
@Component
struct PersistentStorageMain {
  @StorageLink('token')
  token: string = ''

  build() {
    Column({ space: 20 }) {
      Text('PersistentStorage Main')
      Text(this.token)
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}