import { GoodItem } from '../models'

@Component
struct HmList {
  @State list: object[] = []
  @BuilderParam
  renderItem: (item: object) => void

  build() {
    List({ space: 12 }) {
      ForEach(this.list, (item: object) => {
        ListItem() {
          if (this.renderItem) {
            this.renderItem(item)
          }
        }
      })
    }
    .padding(20)
  }
}

export { HmList }