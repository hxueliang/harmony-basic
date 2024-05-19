@Entry
@Component
struct PhotoAlbum {
  @State showPopup: boolean = false
  @State canSelect: number = 2
  @State list: string[] = [
    'assets/image/goods/1.webp',
    'assets/image/goods/2.webp',
    'assets/image/goods/3.webp',
    'assets/image/goods/4.webp',
    'assets/image/goods/5.webp',
    'assets/image/goods/6.webp',
    'assets/image/goods/7.webp',
    'assets/image/goods/8.webp',
    'assets/image/goods/9.webp',
    'assets/image/goods/10.webp',
  ]

  build() {
    Column() {
      Button('选择图片')
        .margin({ top: 20 })
        .onClick(() => {
          this.showPopup = true
        })

      if (this.showPopup) {
        PhotoAlbumPopup({
          list: this.list,
          canSelect: this.canSelect,
          close: () => {
            this.showPopup = false
          }
        })
      }
    }
    .width('100%')
  }
}

@Component
struct PhotoAlbumPopup {
  @Prop list: string[] = []
  @Prop canSelect: number = 9
  close: () => void = () => {
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.list, (item: string) => {
          GridItem() {
            Image(item)
              .aspectRatio(1)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(2)
      .rowsGap(2)
      .padding(2)
      .layoutWeight(1)

      Row() {
        Button('取消')
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.close()
          })
        Text('可选择' + this.canSelect)
        Button('确定')
      }
      .width('100%')
      .height(60)
      .padding({ left: 10, right: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
