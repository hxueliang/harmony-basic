export interface QuestionInfo {
  id: number
  title: string
  options: OptionItem[]
}

export interface OptionItem {
  letter: string
  optionsTitle: string
}

export class QuestionInfoModel implements QuestionInfo {
  id: number = 0
  title: string = ''
  options: OptionItem[] = []

  constructor(model: QuestionInfo) {
    this.id = model.id
    this.title = model.title
    this.options = model.options
  }
}

export class OptionItemModel implements OptionItem {
  letter: string = ''
  optionsTitle: string = ''

  constructor(model: OptionItem) {
    this.letter = model.letter
    this.optionsTitle = model.optionsTitle
  }
}
