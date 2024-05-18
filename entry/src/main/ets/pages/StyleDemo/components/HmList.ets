import { GoodItem } from '../models'

@Component
struct HmList {
  @State list: GoodItem[] = []
  @BuilderParam
  renderItem: (item: object) => void

  build() {
    List({ space: 12 }) {
      ForEach(this.list, (item: GoodItem) => {
        ListItem() {
          this.renderItem(item)
        }
      })
    }
    .padding(20)
  }
}

export { HmList }