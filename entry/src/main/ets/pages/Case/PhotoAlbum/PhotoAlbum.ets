@Entry
@Component
struct PhotoAlbum {
  @State showPopup: boolean = false
  @State canSelect: number = 3
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
  @State selectPhoto: string[] = []
  /** 图片预览选中的图片地址 */
  selectUrl: string = ''
  /** 预览图片的对话框 */
  previewDialog: CustomDialogController = new CustomDialogController({
    // 接收一个@CustomDialog修饰的结构体
    builder: PreviewPhoto({
      url: this.selectUrl
    }),
    customStyle: true,
  })

  build() {
    Column({ space: 10 }) {
      Button('选择图片')
        .margin({ top: 20 })
        .onClick(() => {
          this.showPopup = true
        })

      Grid() {
        ForEach(this.selectPhoto, (imgUrl: string) => {
          GridItem() {
            Image(imgUrl)
              .aspectRatio(1)
              .onClick(() => {
                this.selectUrl = imgUrl
                this.previewDialog.open()
              })
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(2)
      .rowsGap(2)

      if (this.showPopup) {
        PhotoAlbumPopup({
          list: this.list,
          canSelect: this.canSelect,
          close: () => {
            this.showPopup = false
          },
          finish: (list: string[]) => {
            this.selectPhoto.push(...list)
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
  @State selectPhotos: string[] = []
  @Prop list: string[] = []
  @Prop canSelect: number = 9
  close: () => void = () => {
  }
  finish: (list: string[]) => void = () => {
  }

  /**
   * 否是选中当前图片
   * @param photoUrl 图片地址
   * @returns
   */
  getSelectState(photoUrl: string) {
    const index = this.selectPhotos.findIndex(url => url === photoUrl)
    return index > -1
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.list, (item: string) => {
          GridItem() {
            Stack() {
              Image(item)
                .aspectRatio(1)

              if (this.getSelectState(item)) {
                Row() {
                  Image($r('app.media.ic_public_select_photo'))
                    .width(28)
                    .margin({
                      right: 5,
                      bottom: 5,
                    })
                    .borderRadius(14)
                    .border({
                      color: Color.White,
                      width: 2,
                    })
                }
                .width('100%')
                .aspectRatio(1)
                .alignItems(VerticalAlign.Bottom)
                .justifyContent(FlexAlign.End)
                .backgroundColor('rgba(200, 200, 200, 0.5)')
              }
            }
          }
          .onClick(() => {
            const index = this.selectPhotos.findIndex(url => url === item)
            if (index > -1) {
              this.selectPhotos.splice(index, 1)
            } else if (this.selectPhotos.length < this.canSelect) {
              this.selectPhotos.push(item)
            }
          })
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
        Text(`已选${this.selectPhotos.length}张 / 可选${this.canSelect}张`)
        Button('确定')
          .onClick(() => {
            this.finish(this.selectPhotos)
          })
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

@CustomDialog
struct PreviewPhoto {
  controller: CustomDialogController
  url: string = ''

  build() {
    Column() {
      Image(this.url)
        .width('100%')
    }
    .position({ y: 0 })
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
  }
}
