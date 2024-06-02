@Entry
@Component
struct ComponentInPage {
  @State
  showImage1: boolean = true
  @State
  showImage2: boolean = true

  @Styles
  imageStyle() {
    .height(120)
    .aspectRatio(1)
    .borderRadius(60)
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Column() {
          if (this.showImage1) {
            Image($rawfile('image/mouse.jpeg'))
              .imageStyle()
          }
        }.height(120)

        Button('哪进哪出')
          .onClick(() => {
            this.showImage1 = !this.showImage1
          })

        Column() {
          if (this.showImage2) {
            Image($rawfile('image/mouse.jpeg'))
              .imageStyle()
          }
        }.height(120)

        Button('控进控出')
          .onClick(() => {
            this.showImage2 = !this.showImage2
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}