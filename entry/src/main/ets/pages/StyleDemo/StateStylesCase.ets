@Entry
@Component
struct StateStylesCase {
  @State rowEnable: boolean = true

  build() {
    Column({ space: 10 }) {
      Row() {
        Text('今晚一起吃饭吗')
      }
      .width('100%')
      .height(50)
      .padding(16)
      .borderRadius(4)
      .enabled(this.rowEnable)
      .border({
        color: '#ccc',
        width: 1
      })

      Button('点击')
        .onClick(() => {
          this.rowEnable = !this.rowEnable
        })

      TextInput({ placeholder: '请输入用户名' })
        .border({
          color: '#eee',
          width: 1
        })
      TextInput({ placeholder: '请输入密码' })
        .border({
          color: '#eee',
          width: 1
        })
    }
    .padding(20)
  }
}