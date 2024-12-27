@Entry
@Component
struct SwiperPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Swiper() {
        Image($r('app.media.orange')).width(280)
        Image($r('app.media.red')).width(280)
        Image($r('app.media.green')).width(280)
        Image($r('app.media.blue')).width(280)
      }
      .cachedCount(2) // 设置预加载子组件的个数
      .index(1) // 设置当前在容器中显示的子组件的索引值
      .autoPlay(true) // 子组件是否自动播放，在自动播放状态下，导航点不可操作
      .interval(4000) // 使用自动播放时，播放的时间间隔
      .indicator(true) // 是否启用导航点指示器
      .loop(true) // 是否开启循环
      .duration(1000) // 子组件切换的动画时长
      .itemSpace(0) // 设置子组件与子组件之间的间隙
      .curve(Curve.Linear) // 设置Swiper的动画曲线
    }
    .height('100%')
    .width('100%')
    .margin({ top: 40 })
  }
}