import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct AppStorageLogin {
  @State
  userName: string = 'hxl'
  @State
  password: string = '123123'

  login() {
    if (this.userName === 'hxl' && this.password === '123123') {
      router.pushUrl({
        url: 'pages/ApplicationState/AppStorageMain'
      })
    }
  }

  build() {
    Column({ space: 20 }) {
      TextInput({
        placeholder: '请输入用户名',
        text: $$this.userName,
      })
      TextInput({
        placeholder: '请输入密码',
        text: $$this.password,
      })
        .type(InputType.Password)
      Button('登录')
        .onClick(() => {
          this.login()
        })
        .width('100%')
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}