interface ImageType {
  src: string
}

const jdImages = (() => {
  const list: ImageType[] = []
  for (let index = 0; index < 28; index++) {
    list[index] = {
      src: `/assets/material/jd_animation/gif_shvp_list_${index + 1}@3x.png`
    }
  }
  return list
})()

const diceImages = (() => {
  const list: ImageType[] = []
  for (let index = 0; index < 4; index++) {
    list[index] = {
      src: `/assets/material/wechat_dice/dice_Action_${index}.png`
    }
  }
  return list
})()

@Entry
@Component
struct ImageAnimatorPage {
  build() {
    Row() {
      Column({ space: 20 }) {
        Button('启动/暂停')
          .onClick(() => {
          })

        Button('启动/暂停')
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}