/**
 * 在每个子组件之间插入分隔线
 * 可拖动子组件的占的空间大小
 *
 * RowSplit 纵向的分隔线
 * ColumnSplit 横向的分隔线
 */

@Entry
@Component
struct RowColSplitPage {
  build() {
    Column({ space: 20 }) {
      // 纵向的分隔线
      RowSplit() {
        ForEach([1, 2, 3, 4], (item: number) => {
          Text(item.toString()).rowSplitTextStyle(item % 2)
        })
      }
      .resizeable(true) // 可拖动

      // 横向的分隔线
      ColumnSplit() {
        ForEach([1, 2, 3, 4], (item: number) => {
          Text(item.toString()).colSplitTextStyle(item % 2)
        })
      }
      .resizeable(true) // 可拖动
    }
    .height('100%')
    .width('100%')
  }
}

@Extend(Text)
function rowSplitTextStyle(num: number) {
  .width('10%').height(200).textAlign(TextAlign.Center)
  //.backgroundColor(num ? Color.Gray : Color.Orange)
}


@Extend(Text)
function colSplitTextStyle(num: number) {
  .width('50%').height(37.5).textAlign(TextAlign.Center)
  // .backgroundColor(num ? Color.Gray : Color.Orange)
}