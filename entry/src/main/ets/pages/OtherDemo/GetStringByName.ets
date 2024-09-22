@Entry
@Component
struct GetStringByName {
  @State message: string = 'Hello World';
  flag: boolean = true

  async showText() {
    return new Promise((
      resolve: (data: ResourceStr) => void,
      reject: (err: string) => void
    ) => {
      if (Math.random() > 0.1) {
        // resolve($r('app.string.test_resource_string'))
        resolve(getContext().resourceManager.getStringByNameSync('test_resource_string'))
      } else {
        reject('reject')
      }
    })
  }

  build() {
    Column({ space: 20 }) {
      Text($r('app.string.test_resource_string'))
      Button('点击').onClick(async () => {
        try {
          const message = await this.showText()
          AlertDialog.show({ message })
        } catch (err) {
          console.log('jd_log', 'error')
        }
      })
    }
    .height('100%')
    .width('100%')
    .padding({ top: 50 })
  }
}