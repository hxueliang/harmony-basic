@Entry
@Component
struct ListItemGroupPage {
  private timetableListItemGroup: IItem[] = [
    { title: '一', projects: ['语', '数', '英'] },
    { title: '二', projects: ['物', '化', '生'] },
    { title: '三', projects: ['政', '历', '地'] },
    { title: '四', projects: ['美', '音', '体'] },
  ]

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.timetableListItemGroup, (item: IItem) => {
          ListItemGroup() {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project).width('100%').height(30).fontSize(20)
                  .textAlign(TextAlign.Center)
              }
            })
          }
          .borderRadius(20)
          .divider({ strokeWidth: 2, color: 0xDCDCDC }) // 每行之间的分界线
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}

interface IItem {
  title: string,
  projects: string[]
}