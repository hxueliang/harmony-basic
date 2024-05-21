import { OptionItemModel, QuestionInfo, QuestionInfoModel } from './models'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct BpOnlineSimulation {
  @State
  list: QuestionInfo[] = []

  @Styles
  getContextPadding() {
    .padding({
      left: 16,
      right: 16,
    })
  }

  @Builder
  getTopUI() {
    Row() {
      Image($r('app.media.ic_public_left_arrow'))
        .getImageStyle()
      Text('在线模拟')
        .fontSize(17)
        .fontColor('#191919')
      Image($r('app.media.ic_public_pb_file'))
        .getImageStyle(24)
    }
    .getTopStyle()
  }

  @Builder
  getBottomUI() {
    Row() {
      Row({ space: 10 }) {
        Image($r('app.media.ic_public_left_arrow'))
          .getImageStyle(16)
        Text('上一题')
      }

      Row({ space: 10 }) {
        Text('上一题')
        Image($r('app.media.ic_public_left_arrow'))
          .getImageStyle(16)
          .rotate({
            angle: 180,
          })
      }
    }
    .getTopStyle()
  }

  aboutToAppear(): void {
    this.getList()
  }

  async getList() {
    try {
      this.list = await getListApi()
    } catch (error) {
      promptAction.showToast({
        message: '获取题目失败'
      })
    }
  }

  build() {
    Column({ space: 10 }) {
      // 顶部
      this.getTopUI()

      // 进度条
      Progress({
        value: 10,
        total: 100,
      })
        .getContextPadding()

      // 中部
      Column() {
        Text(JSON.stringify(this.list))
      }
      .layoutWeight(1)

      // 底部
      this.getBottomUI()
    }
  }
}

@Extend(Row)
function getTopStyle() {
  .width('100%')
  .height(56)
  .justifyContent(FlexAlign.SpaceBetween)
  .padding({
    left: 16,
    right: 16,
  })
}

@Extend(Image)
function getImageStyle(width: number = 20) {
  .width(width)
  .aspectRatio(1)
}

function getListApi() {
  return new Promise<QuestionInfoModel[]>((resolve) => {
    setTimeout(() => {
      resolve([
        new QuestionInfoModel({
          id: 1,
          title: '下面说法正确的是',
          options: [
            new OptionItemModel({
              letter: 'A',
              optionsTitle: '鸿蒙和openHarmony是一回事',
            }),
            new OptionItemModel({
              letter: 'B',
              optionsTitle: '鸿蒙的装饰器不可以做响应式',
            }),
            new OptionItemModel({
              letter: 'C',
              optionsTitle: 'arkTS借鉴了TS的语法',
            }),
            new OptionItemModel({
              letter: 'D',
              optionsTitle: '鸿蒙4.0已经面世1年了',
            }),
          ]
        }),
        new QuestionInfoModel({
          id: 2,
          title: '哪个修饰符不具备响应式',
          options: [
            new OptionItemModel({
              letter: 'A',
              optionsTitle: 'State',
            }),
            new OptionItemModel({
              letter: 'B',
              optionsTitle: 'Prop',
            }),
            new OptionItemModel({
              letter: 'C',
              optionsTitle: 'Link',
            }),
            new OptionItemModel({
              letter: 'D',
              optionsTitle: 'Preview',
            }),
          ]
        }),
        new QuestionInfoModel({
          id: 3,
          title: 'Link的用法下面哪个语法是正确的',
          options: [
            new OptionItemModel({
              letter: 'A',
              optionsTitle: '$$this.xxx',
            }),
            new OptionItemModel({
              letter: 'B',
              optionsTitle: '$xxx',
            }),
            new OptionItemModel({
              letter: 'C',
              optionsTitle: '$this.xxx',
            }),
            new OptionItemModel({
              letter: 'D',
              optionsTitle: '$$xxx',
            }),
          ]
        }),
      ])
    }, 300)
  })
}
