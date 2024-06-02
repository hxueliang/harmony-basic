@Extend(Text)
function getTextStyles2() {
  .fontColor(Color.White)
  .fontSize(18)
  .fontWeight(FontWeight.Medium)
}

@Extend(Row)
function getTextRowStyles2() {
  .width(60)
  .aspectRatio(1)
  .backgroundColor('#333')
  .borderRadius(30)
  .justifyContent(FlexAlign.Center)
}

@Entry
@Component
struct GestureGroupPage {
  @State
  showVoice: boolean = false
  @State
  gestureType: GestureGroupType = GestureGroupType.NONE

  @Builder
  getVoiceContext() {
    Column() {
      Row() {
        Row() {
          Text('删')
            .getTextStyles2()
            .fontColor(this.gestureType === GestureGroupType.DELETE ? '#333' : Color.White)
        }
        .getTextRowStyles2()
        .backgroundColor(this.gestureType === GestureGroupType.DELETE ? Color.White : '#333')
        .rotate({
          angle: -10,
        })

        Row() {
          Text('文')
            .getTextStyles2()
            .fontColor(this.gestureType === GestureGroupType.TEXT ? '#333' : Color.White)
        }
        .getTextRowStyles2()
        .backgroundColor(this.gestureType === GestureGroupType.TEXT ? Color.White : '#333')
        .rotate({
          angle: 10,
        })
      }
      .width('100%')
      .padding({
        left: 40,
        right: 40,
      })
      .margin({
        bottom: '-30%'
      })
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
      }
      .width('80%')
      .aspectRatio(1 / 2)
      .borderRadius({
        topRight: 400,
        bottomRight: 400,
      })
      .rotate({
        angle: -90
      })
      .backgroundColor(this.gestureType === GestureGroupType.NONE ? Color.White : '#333')
      .margin({
        bottom: '-88%'
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0, 0, 0, 0.5)')
    .justifyContent(FlexAlign.End)
  }

  build() {
    Column() {
      Button('按住 说话')
        .type(ButtonType.Normal)
        .width('100%')
        .height(44)
    }
    .width('100%')
    .height('100%')
    .padding(30)
    .justifyContent(FlexAlign.End)
    .bindContentCover($$this.showVoice, this.getVoiceContext(), {
      modalTransition: ModalTransition.NONE
    })
  }
}

enum GestureGroupType {
  DELETE,
  TEXT,
  NONE,
}