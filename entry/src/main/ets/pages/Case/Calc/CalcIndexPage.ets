import { CalculatorButton } from './CalculatorButton'

@Entry
@Component
struct CalcIndexPage {
  build() {
    Column() {
      CalculatorButton()
    }
  }
}