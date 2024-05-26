@Entry
@Component
struct TrackModifier {
  @State
  user: UserInfoModel = new UserInfoModel({
    id_card: 440,
    name: '大白',
    age: 18,
    sex: '男',
  })

  build() {
    Row() {
      Column({ space: 20 }) {
        Row() {
          Text('身份证：')
          Text(this.user.id_card.toString())
        }
        .onClick(() => {
          this.user.id_card++
        })

        Row() {
          Text('姓名：')
          Text(this.user.name)
        }
        .onClick(() => {
          this.user.name += '1'
        })

        Row() {
          Text('年龄：')
          Text(this.user.age.toString())
        }
        .onClick(() => {
          this.user.age += 1
        })

        Row() {
          Text('性别：')
          Text(this.user.sex)
        }
        .onClick(() => {
          this.user.sex = this.user.sex === '男' ? '女' : '男'
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface UserInfo {
  id_card: number
  name: string
  age: number
  sex: '男' | '女'
}

export class UserInfoModel implements UserInfo {
  id_card: number = 0
  name: string = ''
  age: number = 0
  sex: '男' | '女' = '男'

  constructor(model: UserInfo) {
    this.id_card = model.id_card
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
  }
}
