@Entry
@Component
struct RelativeContainerPage {
  build() {
    RelativeContainer() {
      // T1 以 __container__ 为基准
      Text('T1-1')
        .id('T1-1')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
      Text('T1-2')
        .id('T1-2')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Text('T1-3')
        .id('T1-3')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })

      // T2-1-2 以 T1-1 为基准
      Text('T2-1')
        .id('T2-1')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: 'T1-1', align: VerticalAlign.Bottom },
          left: { anchor: 'T1-1', align: HorizontalAlign.Start }
        })
      Text('T2-2')
        .id('T2-2')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: 'T1-1', align: VerticalAlign.Bottom },
          left: { anchor: 'T1-1', align: HorizontalAlign.End }
        })
      // T2-3 以 T2-2 为基准
      Text('T2-3')
        .id('T2-3')
        .relativeContainerTextStyle()
        .alignRules({
          top: { anchor: 'T2-2', align: VerticalAlign.Top },
          left: { anchor: 'T2-2', align: HorizontalAlign.End }
        })
    }
    .height('100%')
    .width('100%')
    .margin({ top: 40 })
  }
}

@Extend(Text)
function relativeContainerTextStyle() {
  .width('33.33%')
  .aspectRatio(1)
  .border({ width: 1, color: Color.Gray })
  .textAlign(TextAlign.Center)
}