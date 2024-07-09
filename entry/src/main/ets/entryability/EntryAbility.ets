import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
// import { KeyboardAvoidMode } from '@kit.ArkUI';

import { TokenManager } from '../pages/ApplicationState/utils/token';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    startApm()
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
    let url = 'pages/DFX/AppCrashEvent'

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

function startApm() {
  hiAppEvent.addWatcher({
    // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
    name: "watcher",
    // 开发者可以订阅感兴趣的系统事件，此处是订阅了崩溃事件
    appEventFilters: [
      {
        domain: hiAppEvent.domain.OS,
        names: [hiAppEvent.event.APP_CRASH]
      }
    ],

    // 开发者可以自行实现订阅实时回调函数，以便对订阅获取到的事件数据进行自定义处理
    onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
      hilog.info(0x0000, 'testTag', `HiAppEvent onReceive: domain=${domain}`);
      for (const eventGroup of appEventGroups) {
        // 开发者可以根据事件集合中的事件名称区分不同的系统事件
        hilog.info(0x0000, 'testTag', `HiAppEvent eventName=${eventGroup.name}`);
        for (const eventInfo of eventGroup.appEventInfos) {
          // 开发者可以对事件集合中的事件数据进行自定义处理，此处是将事件数据打印在日志中
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.domain=${eventInfo.domain}`);
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.name=${eventInfo.name}`);
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.eventType=${eventInfo.eventType}`);
          // 开发者可以获取到崩溃事件发生的时间戳
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.time=${eventInfo.params['time']}`);
          // 开发者可以获取到崩溃事件发生的崩溃类型
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.crash_type=${eventInfo.params['crash_type']}`);
          // 开发者可以获取到崩溃应用的前后台状态
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.foreground=${eventInfo.params['foreground']}`);
          // 开发者可以获取到崩溃应用的版本信息
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.bundle_version=${eventInfo.params['bundle_version']}`);
          // 开发者可以获取到崩溃应用的包名
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.bundle_name=${eventInfo.params['bundle_name']}`);
          // 开发者可以获取到崩溃应用的进程id
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.pid=${eventInfo.params['pid']}`);
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.uid=${eventInfo.params['uid']}`);
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.uuid=${eventInfo.params['uuid']}`);
          // 开发者可以获取到崩溃事件发生的异常类型、异常原因和异常调用栈
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.exception=${JSON.stringify(eventInfo.params['exception'])}`);
          // 开发者可以获取到崩溃事件发生时日志信息
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.hilog.size=${eventInfo.params['hilog'].length}`);
          // 开发者可以获取到崩溃事件发生时的故障日志文件
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.external_log=${JSON.stringify(eventInfo.params['external_log'])}`);
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.log_over_limit=${eventInfo.params['log_over_limit']}`);
          // 开发者可以获取到崩溃事件的自定义数据test_data
          hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.params.test_data=${eventInfo.params['test_data']}`);
        }
      }
    }
  });
}
