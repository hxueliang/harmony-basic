@Entry
@Component
struct LinkModifierCase {
  @State list: CardItem[] = [
    {
      id: 1,
      goods_name: '酸菜鱼',
      goods_price: 99.9,
      goods_count: 0,
    },
    {
      id: 2,
      goods_name: '麻辣烫',
      goods_price: 29.9,
      goods_count: 0,
    },
    {
      id: 1,
      goods_name: '红烧肉',
      goods_price: 50,
      goods_count: 0,
    },
  ]

  build() {
    Column() {
      HmCard({
        list: this.list,
      })
    }
  }
}

@Component
struct HmCard {
  @Link list: CardItem[]

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.list, (item: CardItem) => {
          ListItem() {
            HmCardItem({
              item,
            })
          }
        })
      }
    }
    .padding(20)
  }
}

@Component
struct HmCardItem {
  @Prop item: CardItem

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.item.goods_name)
          .fontSize(30)
        Text(this.item.goods_price.toString())
          .fontSize(16)
          .fontColor(Color.Red)
      }

      Text(this.item.goods_count.toString())
        .fontSize(30)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

interface CardItem {
  id: number,
  goods_name: string,
  goods_price: number,
  goods_count: number,
}