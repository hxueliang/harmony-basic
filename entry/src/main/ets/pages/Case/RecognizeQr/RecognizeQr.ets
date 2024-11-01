import { detectBarcode, scanBarcode, scanCore } from '@kit.ScanKit';

export function RecognizeQr(uri: string) {
  return new Promise(
    async (
      resolve: (res: scanBarcode.ScanResult) => void,
      reject: (err: string) => void
    ) => {
      try {
        // 定义识码参数options
        const options: scanBarcode.ScanOptions =
          { scanTypes: [scanCore.ScanType.ALL], enableMultiMode: true, enableAlbum: true };
        // 调用图片识码接口
        const result: Array<scanBarcode.ScanResult> = await detectBarcode.decode({ uri }, options)
        if (result.length) {
          const res = result[0]
          return resolve(res)
        } else {
          return reject('未能识别到二维码')
        }
      } catch (error) {
        return reject(error)
      }
    }
  )
}