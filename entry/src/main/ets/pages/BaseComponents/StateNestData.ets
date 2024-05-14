@Entry
@Component
struct StateNestData {
  @State p: IPersonModel = new IPersonModel({
    name: '小张',
    age: 18,
    sex: '女',
    address: {
      province: '广东省',
      city: '广州市',
      area: '天河区',
    }
  })

  build() {
    Column({ space: 16 }) {
      Row({ space: 20 }) {
        Text('姓名:')
        TextInput({ text: this.p.name })
          .height(40)
          .layoutWeight(1)
      }
      Row({ space: 20 }) {
        Text('年龄:')
        TextInput({ text: this.p.age + '' })
          .height(40)
          .layoutWeight(1)
      }
      Row({ space: 20 }) {
        Text('性别:')
        Select([{ value: '男' }, { value: '女' }])
          .value(this.p.sex)
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
          TextInput({ text: this.p.address.province })
            .height(40)
            .layoutWeight(1)
          TextInput({ text: this.p.address.city })
            .height(40)
            .layoutWeight(1)
          TextInput({ text: this.p.address.area })
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

/**
 * 根据 interface 生成 class
 *
 * $ npm i -g interface2class # 全局安装
 * $ i2c -V # 查版本
 * $ i2c ./StateNestData.ets # 生成 class
 * */

interface IAddress {
  province: string
  city: string
  area: string
}

interface IPerson {
  name: string
  age: number
  sex: '男' | '女'
  address: IAddress
}

export class IAddressModel implements IAddress {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: IAddress) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}

export class IPersonModel implements IPerson {
  name: string = ''
  age: number = 0
  sex: '男' | '女' = '男'
  address: IAddress = new IAddressModel({} as IAddress)

  constructor(model: IPerson) {
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
    this.address = model.address
  }
}
