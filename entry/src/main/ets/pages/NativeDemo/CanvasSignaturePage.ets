@Entry
@Component
struct CanvasSignaturePage {
  pen: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  canvasWidth: number = 0
  canvasHeight: number = 0

  clear() {
  }

  confirm() {
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Canvas(this.pen) {
        }
        .width('100%')
        .height(200)
        .border({
          width: 1,
          color: Color.Black
        })
        .onAreaChange((_, newArea) => {
          this.canvasWidth = newArea.width as number
          this.canvasHeight = newArea.height as number
        })

        Row({ space: 10 }) {
          Button('重签')
            .onClick(() => {
              this.clear()
            })
          Button('确认')
            .onClick(() => {
              this.confirm()
            })
        }
      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}