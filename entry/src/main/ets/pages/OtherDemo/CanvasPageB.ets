@Entry
@Component
struct CanvasPageB {
  private renderingContextSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext2D: CanvasRenderingContext2D =
    new CanvasRenderingContext2D(this.renderingContextSettings)

  build() {
    Column() {
      Canvas(this.canvasRenderingContext2D)
        .width('100%')
        .height('100%')
        .backgroundColor('#f5f5f5')
        .onReady(() => {
          // 绘制矩形
          this.canvasRenderingContext2D.fillRect(0, 30, 100, 100)

          // 绘制贝赛乐曲线
          this.canvasRenderingContext2D.beginPath()
          this.canvasRenderingContext2D.moveTo(170, 10)
          this.canvasRenderingContext2D.bezierCurveTo(20, 100, 200, 100, 200, 20)
          this.canvasRenderingContext2D.stroke()

          // 绘制渐变对象
          const grad = this.canvasRenderingContext2D.createLinearGradient(150, 0, 250, 100)
          grad.addColorStop(0.0, 'red')
          grad.addColorStop(0.5, 'white')
          grad.addColorStop(1.0, 'green')
          this.canvasRenderingContext2D.fillStyle = grad
          this.canvasRenderingContext2D.fillRect(200, 0, 100, 100)
        })
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}