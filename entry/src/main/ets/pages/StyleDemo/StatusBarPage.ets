import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct StatusBarPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Row({ space: 20 }) {
        Button('white content').onClick(() => {
          setBarColor(new StatusBarColor('#ffffff', '#000000'))
        })
        Button('black content').onClick(() => {
          setBarColor(new StatusBarColor('#000000', '#ffffff'))
        })
      }

      Button('router').onClick(() => {
        router.pushUrl({ url: 'pages/StyleDemo/WrapBuilderPage' })
      })

      Navigation()
    }
    .height('100%')
    .width('100%')
    .padding({ top: 100 })
  }
}

class StatusBarColor {
  statusBarColor: string;
  statusBarContentColor: string

  constructor(statusBarColor: string, statusBarContentColor: string) {
    // 状态栏背景
    this.statusBarColor = statusBarColor;
    // 状态栏内容
    this.statusBarContentColor = statusBarContentColor;
  }
}

async function setBarColor(statusBarColor: StatusBarColor) {
  let mainWindow: window.Window = AppStorage.get("mainWindow") || await window.getLastWindow(getContext())
  let sysBarProps: window.SystemBarProperties = {
    statusBarColor: statusBarColor.statusBarColor,
    statusBarContentColor: statusBarColor.statusBarContentColor,
  };
  mainWindow?.setWindowSystemBarProperties(sysBarProps, (err: BusinessError) => {
    let errCode: number = err.code;
    if (errCode) {
      console.error('[StaticUtils] Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
      return;
    }
    console.info('[StaticUtils] Succeeded in setting the system bar properties.');
  });
}
