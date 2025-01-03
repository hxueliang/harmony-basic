/**
 * 计算逻辑
 */
export class Calculator {
  /**
   * 递归计算直至完成，一次计算一对数，从在往右，乘除法优先于加减法
   * @param split
   * @returns
   */
  private static recursiveCompute(split: string[]): string[] {
    let symbolIndex: number | null = null
    // 先寻找乘除符号
    for (let i = 0; i < split.length; i++) {
      if (split[i].match(RegExp('^(\\*|\\/)$')) !== null) {
        symbolIndex = i
        break
      }
    }
    // 若没找到乘除符号，则寻找加减符号
    if (symbolIndex === null) {
      for (let j = 0; j < split.length; j++) {
        if (split[j].match(RegExp('^(\\+|-)$')) !== null) {
          symbolIndex = j
          break
        }
      }
    }
    // 若没找到运算符号，则表明计算结束，返回结果
    if (symbolIndex === null) {
      return split
    }
    // 若找到运算符号，则运算后继续寻找运算
    else {
      let num1 = Number(split[symbolIndex - 1])
      let symbol = split[symbolIndex]
      let num2 = Number(split[symbolIndex + 1])
      let result = 0
      switch (symbol) {
        case '+':
          result = num1 + num2
          break
        case '-':
          result = num1 - num2
          break
        case '*':
          result = num1 * num2
          break
        case '/':
          result = num1 / num2
          break
      }
      split = split.slice(0, symbolIndex - 1).concat(`${result}`).concat(split.slice(symbolIndex + 2))
      return Calculator.recursiveCompute(split)
    }
  }

  /**
   * 将输入的字符串转为字符串数组
   * @param input
   * @returns
   */
  public static calculate(input: string): string {
    // 先将百分数转为小数
    input = input.replace(RegExp('(((\\d*\\.\\d*) | (\\d+))%)', 'g'), s => String(Number(s.replace(/%/, '')) / 100))
    // 要将 input 分隔为数与运算符，分隔节点的索引储存在 splitIndex 中
    let splitIndex = [0]
    for (let i = 1; i < input.length; i++) {
      if (input[i].match(RegExp('(\\+|-|\\*|\\/)')) !== null) {
        splitIndex.push(i)
        splitIndex.push(i + 1)
        i++
      }
    }
    splitIndex.push(input.length)
    // 分隔 input 为数与运算，并存储在 split 中
    let split: string[] = []
    for (let j = 0; j < splitIndex.length - 1; j++) {
      const str = input.substring(splitIndex[j], splitIndex[j+1])
      split.push(str)
    }
    return Calculator.recursiveCompute(split)[0]
  }
}