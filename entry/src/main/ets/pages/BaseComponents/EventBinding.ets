@Entry
@Component
struct EventBinding {
  build() {
    Row() {
      Column({ space: 12 }) {
        TextInput({
          placeholder: '请输入用户名',
        })
          .height(40)
        TextInput({
          placeholder: '请输入密码',
        })
          .height(40)
        Button('登录')
          .width('100%')
      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}