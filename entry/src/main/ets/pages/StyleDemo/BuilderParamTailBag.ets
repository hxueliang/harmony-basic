import { HmPanel } from './components/HmPanel'

@Entry
@Component
struct BuilderParamTailBag {
  build() {
    Column({ space: 10 }) {
      HmPanel({ heightPanel: 240, bgPanel: Color.Orange })
      HmPanel({ heightPanel: 160, bgPanel: Color.Pink })
      HmPanel()
    }
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}