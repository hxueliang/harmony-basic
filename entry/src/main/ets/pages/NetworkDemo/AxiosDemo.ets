@Entry
@Component
struct AxiosDemo {
  async getList() {
  }

  aboutToAppear(): void {
    this.getList()
  }

  build() {
    Row() {
    }
    .height('100%')
  }
}