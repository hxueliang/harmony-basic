/**
 * wrapBuilder: 封装全局@Builder
 */

// 1.1 当@Builder方法赋值给变量或数组后，赋值的变量或数组在UI方法中无法使用
@Builder
function BuilderText() {
  Text('builderText')
}

const builderArr: Function[] = [BuilderText]

// 2.1
// 把@Builder装饰器装饰的方法MyBuilder作为wrapBuilder的参数，
// 再将wrapBuilder赋值给变量globalBuilder，
// 用来解决@Builder方法赋值给变量后无法使用的问题
@Builder
function MyBuilder(value: string, size: number) {
  Text(value).fontSize(size)
}

const globalBuilder: WrappedBuilder<[string, number]> = wrapBuilder(MyBuilder)

// 3.1 赋值给数组，使用UI代码更整洁
@Builder
function YourBuilder(value: string, size: number) {
  Text(value).fontSize(size).fontColor(Color.Red)
}

const globalBuilderArr: WrappedBuilder<[string, number]>[] = [
  wrapBuilder(MyBuilder),
  wrapBuilder(YourBuilder),
  wrapBuilder(MyBuilder),
  wrapBuilder(YourBuilder),
  wrapBuilder(MyBuilder),
  wrapBuilder(YourBuilder)
]

// 4.1 引用传递
// 按引入传递参数，会触发UI刷新
class Tmp {
  name: string = 'tmp name'
}

@Builder
function overBuilder(tmp: Tmp) {
  Column() {
    Text(`wrapBuilderValue: ${tmp.name}`)
  }
}

const wBuilder: WrappedBuilder<[Tmp]> = wrapBuilder(overBuilder)

@Entry
@Component
struct WrapBuilderPage {
  @State message: string = 'Hello World'
  // 4.2
  @State tmp: Tmp = new Tmp()

  build() {
    Column({ space: 10 }) {
      Text('测试1: @Builder方法赋值给变量后无法使用')
      ForEach(builderArr, (item: Function) => {
        // 1.2 item() 不符合UI组件语法。
        // item()
      })

      Divider().strokeWidth(2)
      Text('测试2: @Builder方法赋值给变量后可以使用')
      // 2.2 测试：@Builder方法赋值给变量后可以使用
      globalBuilder.builder(this.message, 30)

      Divider().strokeWidth(2)
      Text('测试3: @Builder方法赋值给数组后可以使用')
      ForEach(globalBuilderArr, (item: WrappedBuilder<[string, number]>) => {
        // 3.2 测试：@Builder方法赋值给数组后可以使用
        item.builder(this.message, 30)
      })

      Divider().strokeWidth(2)
      Text('测试4: 引用传递')
      wBuilder.builder({ name: this.tmp.name })
      Button('change tmp name').onClick(() => {
        // 4.3 测试：引用传递
        this.tmp.name = 'Ark UI'
      })
    }
    .height('100%')
    .width('100%')
    .padding(10)
  }
}