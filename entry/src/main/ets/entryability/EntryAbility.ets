import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { AbilityConstant, Want } from '@kit.AbilityKit';
// import { KeyboardAvoidMode } from '@kit.ArkUI';

import { TokenManager } from '../pages/ApplicationState/utils/token';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 应用全屏
    const win = windowStage.getMainWindowSync()
    win.setWindowLayoutFullScreen(true)
    // 获取顶部区域高度
    const topAreaHeight = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height
    AppStorage.setOrCreate('topAreaHeight', topAreaHeight)
    // 键盘避让
    // win.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)

    // let url = 'pages/ApplicationState/PersistentStorageLogin'
    // if (await TokenManager.getToken(this.context)) {
    //   url = 'pages/ApplicationState/PersistentStorageMain'
    // }
    let url = 'pages/SandboxDemo/HybridHotLoadPage'

    windowStage.loadContent(url, (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onNewWant');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
