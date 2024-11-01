import { util } from '@kit.ArkTS'
import { fileIo, fileUri, ReadOptions } from '@kit.CoreFileKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { http } from '@kit.NetworkKit'
import { photoAccessHelper } from '@kit.MediaLibraryKit'

export async function saveAlbum(urlOrBase64: string) {
  let imageBuffer: ArrayBuffer
  let imageType: string = 'jpg'
  let imageName: string = util.generateRandomUUID()
  if (isBase64ImageString(urlOrBase64)) {
    imageBuffer = base64ImageToArrayBuffer(urlOrBase64)
  } else {
    const imageUrl: string = urlOrBase64 || ''
    const arr: string[] = imageUrl.split('.')
    imageType = arr[arr.length-1] || 'jpg'
    imageBuffer = await httpDownload(imageUrl)
  }
  const result = await saveSandbox(imageBuffer, imageType, imageName)
  return result
}

function saveSandbox(imageBuffer: ArrayBuffer, imgType: string, imageName: string): Promise<DownloadResult> {
  return new Promise(async (resolve, reject) => {
    // 保存到Cache目录下
    const newFileName = imageName + "." + imgType;
    const newFilePath = getContext().cacheDir + "/" + newFileName;
    const newFileUri = fileUri.getUriFromPath(newFilePath);
    let file: fileIo.File = await fileIo.open(newFileUri, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    await fileIo.write(file.fd, imageBuffer);
    await fileIo.close(file);
    console.info("file path：" + newFileUri); // 保存成功 // resultData.status = 3; // return resolve(resultData);
    saveImageToAsset(newFileUri, imgType, imageName).then(() => { // 保存成功
      return resolve({
        isSuccess: true,
        msg: '成功',
        imageInfo: { localUrl: newFileUri, type: MediumType.PHOTO }
      })
    }).catch((error: Error) => { // 保存失败
      return reject({ isSuccess: false, msg: '保存失败:' + error.message });
    });
  })
}

async function httpDownload(imgUrl: string): Promise<ArrayBuffer> {
  return new Promise((resolve, reject) => {
    http.createHttp().request(imgUrl, async (error: BusinessError, data: http.HttpResponse) => { // 下载失败
      if (error) {
        return reject({ isSuccess: false, msg: "下载失败" });
      } // 数据格式不正确
      if ((data.result instanceof ArrayBuffer) == false) {
        return reject({ isSuccess: false, msg: "图片保存失败：数据流不支持" });
      }
      let imageBuffer: ArrayBuffer = data.result as ArrayBuffer;
      return resolve(imageBuffer)
    });
  })
}

async function saveImageToAsset(uri: string, nameExtension: string, imageName: string): Promise<void> {
  console.info('ShowAssetsCreationDialogDemo: ' + uri);
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext()); // 获取需要保存到媒体库的位于应用沙箱的图片/视频uri
    let srcFileUris: Array<string> = [uri];
    let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [{
      title: imageName, // 可选
      fileNameExtension: nameExtension,
      photoType: photoAccessHelper.PhotoType.IMAGE, // 可选，支持：普通图片、动态图片
      subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
    }];
    let desFileUris: Array<string> = await phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
    console.info('showAssetsCreationDialog success, data is ' + desFileUris);
    if (desFileUris.length == 0) { // 用户拒绝保存
      throw (new Error("用户拒绝保存"))
    }
    await createAssetByIo(uri, desFileUris[0]);
    return Promise.resolve();
  } catch (err) {
    console.error('showAssetsCreationDialog failed, errCode is ' + err.code + ', errMsg is ' + err.message);
    return Promise.reject(err);
  }
}

let context = getContext(this);
const createAssetByIo = async (sourceFilePath: string, targetFilePath: string) => {
  try {
    console.log(`context.fileDir ===> ${context.filesDir}`)
    let srcFile: fileIo.File = fileIo.openSync(sourceFilePath, fileIo.OpenMode.READ_ONLY);
    let targetFile: fileIo.File = await fileIo.open(targetFilePath, fileIo.OpenMode.READ_WRITE);
    let bufSize = 14096;
    let readSize = 0;
    let buf = new ArrayBuffer(bufSize);
    let readOptions: ReadOptions = { offset: readSize, length: bufSize };
    let readLen = fileIo.readSync(srcFile.fd, buf, readOptions);
    while (readLen > 0) {
      readSize += readLen;
      fileIo.writeSync(targetFile.fd, buf, { length: readLen });
      readOptions.offset = readSize;
      readLen = fileIo.readSync(srcFile.fd, buf, readOptions);
    }
    fileIo.closeSync(srcFile);
    fileIo.closeSync(targetFile);
  } catch (error) {
    console.error(`createAssetByIo :: error , msg is ${error} `);
  }
}

/**
 * base64图片转ArrayBuffer
 * @param base64
 * @returns
 */
export function base64ImageToArrayBuffer(base64Image: string): ArrayBuffer {
  const base64Data = base64Image.split(',')[1];
  const padding = '='.repeat((4 - base64Data.length % 4) % 4);
  const base64Url = base64Data.replace(/\-/g, '+').replace(/_/g, '/');
  const rawData = base64Url + padding;
  const len = rawData.length;
  const bytes = new Uint8Array(len);
  let index = 0;
  for (let i = 0; i < len; i += 4) {
    const charCodeA = getCharCodeFromBase64(rawData[i]);
    const charCodeB = getCharCodeFromBase64(rawData[i + 1]);
    const charCodeC = getCharCodeFromBase64(rawData[i + 2]);
    const charCodeD = getCharCodeFromBase64(rawData[i + 3]);
    bytes[index++] = (charCodeA << 2) | (charCodeB >> 4);
    if (charCodeC !== 64) {
      bytes[index++] = ((charCodeB & 15) << 4) | (charCodeC >> 2);
    }
    if (charCodeD !== 64) {
      bytes[index++] = ((charCodeC & 3) << 6) | charCodeD;
    }
  }
  return bytes.buffer;
}

function getCharCodeFromBase64(char: string): number {
  if (char >= 'A' && char <= 'Z') {
    return char.charCodeAt(0) - 'A'.charCodeAt(0);
  } else if (char >= 'a' && char <= 'z') {
    return char.charCodeAt(0) - 'a'.charCodeAt(0) + 26;
  } else if (char >= '0' && char <= '9') {
    return char.charCodeAt(0) - '0'.charCodeAt(0) + 52;
  } else if (char === '+') {
    return 62;
  } else if (char === '/') {
    return 63;
  } else if (char === '=') {
    return 0;
  }
  return 0;
}

/**
 * 图片是Base64字符串
 * @param str
 * @returns
 */
export function isBase64ImageString(str: string): boolean {
  const base64Regex = /^data:image\/[a-z]+;base64,([A-Za-z0-9+/=]+)$/;
  return base64Regex.test(str);
}

/**
 * 下载返回类型
 */
interface DownloadResult {
  /** 是否成功 */
  isSuccess: boolean;

  /** 返回消息 */
  msg: string;

  /** 图片信息 */
  imageInfo: IReturnImage;
}

/**
 * 返回图片类型
 */
export interface IReturnImage {
  /** 媒体路径 */
  localUrl: string;

  /** 媒体类型 */
  type: MediumType;
}

/**
 *  媒体类型
 */
export enum MediumType {
  /**
   * 图片
   */
  PHOTO,
  /**
   * 图片 + 视频
   */
  PHOTO_VIDEO,
  /**
   * 视频
   */
  VIDEO,
}