@Entry
@Component
struct StateNestData {
  build() {
    Column({ space: 16 }) {
      Row({ space: 20 }) {
        Text('姓名:')
        TextInput()
          .height(40)
          .layoutWeight(1)
      }
      Row({ space: 20 }) {
        Text('年龄:')
        TextInput()
          .height(40)
          .layoutWeight(1)
      }
      Row({ space: 20 }) {
        Text('性别:')
        Select([{ value: '男' }, { value: '女' }])
          .height(40)
          .border({
            width: 2,
            color: '#ccc',
          })
          .layoutWeight(1)
      }
      Row({ space: 20 }) {
        Text('性别:')
        Row({ space: 10 }) {
          TextInput()
            .height(40)
            .layoutWeight(1)
          TextInput()
            .height(40)
            .layoutWeight(1)
          TextInput()
            .height(40)
            .layoutWeight(1)
        }
        .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
    .padding({
      top: 30,
      right: 20,
      bottom: 30,
      left: 20,
    })
  }
}