import { router } from '@kit.ArkUI'

const TOTAL_COUNT = 6

@Entry
@Component
struct LoginCountDown {
  @State count: number = TOTAL_COUNT
  timerId: number = -1
  isPaused: boolean = false
  isBack: boolean = false

  onPageShow(): void {
    !this.isBack && this.resumeTimer()
  }

  onPageHide(): void {
    this.pauseTimer()
  }

  aboutToDisappear(): void {
    clearTimeout(this.timerId)
  }

  startTimer() {
    this.timerId = setInterval(() => {
      this.count--
      if (this.count === 0) {
        clearTimeout(this.timerId)
        this.count = TOTAL_COUNT
      }
    }, 1000)
  }

  pauseTimer() {
    if (!this.isPaused) {
      this.isPaused = true;
      clearTimeout(this.timerId)
    }
  }

  resumeTimer() {
    if (this.isPaused) {
      this.isPaused = false
      this.startTimer()
    }
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Button(`获取验证码（${this.count}）`)
          .onClick(() => {
            this.startTimer()
          })
        Button('跳页面')
          .onClick(() => {
            router.pushUrl({ url: 'pages/OtherDemo/KeyboardAvoidance' })
            clearTimeout(this.timerId)
            this.isBack = true
            this.count = TOTAL_COUNT
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}