@Component
struct ZhCommentRepay {
  build() {
    Row({ space: 10 }) {
      TextInput()
        .layoutWeight(1)
        .height(40)
      Button('发布')
    }
    .width('100%')
    .height(60)
    .padding({ left: 20, right: 20 })
    .border({
      color: '#f5f5f5',
      width: 1,
    })
  }
}

export {
  ZhCommentRepay
}