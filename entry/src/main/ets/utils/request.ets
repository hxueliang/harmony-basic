import axios, {
  AxiosError,
  AxiosHeaders,
  AxiosResponse,
  InternalAxiosRequestConfig,
  Method,
  RawAxiosRequestHeaders
} from '@ohos/axios'
import { Log } from '@abner/log'

interface RequestConfig<P> {
  url?: string;
  method?: Method;
  headers?: RawAxiosRequestHeaders | AxiosHeaders
  params?: P
  data?: P
  context?: null
}

// 创建实例
const instance = axios.create({
  baseURL: 'https://zhyl-harmony.itheima.net',
  timeout: 5 * 1000,
});

// 请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 测试Authorization
  config.headers.Authorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbiI6ImRkODI5NTVkMTI2YjQ0NjhhMDY5M2NiMjMwZDFhZGE4IiwiT3BlbklEIjoiNDE0IiwibWFwcGVyX29wZW5JZCI6bnVsbCwiVXNlcklkIjo0MTQsIkV4cGlyZVRpbWUiOiIyMDI0LTA4LTA3VDExOjQyOjA2LjEyNDk0OTgrMDg6MDAiLCJhZG1pbiI6dHJ1ZSwiY2hhbm5lbCI6IjcwMDc4NTAiLCJjaGFubmVsX3R5cGUiOiI1MDAwMCJ9.bY8XZ-n7mA0zvbyhqtZ3On6jOZusJih-l1gJOgFa_7E'
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});


// 响应拦截器
instance.interceptors.response.use((response: AxiosResponse) => {
  return response.data?.data;
}, (error: AxiosError) => {
  Log.info(error)
  return Promise.reject(error);
});

export class Request {
  static get<D = null, P = null>(url: string, config: RequestConfig<P>) {
    config.url = url
    config.method = 'GET'
    return instance<null, D>(config)
  }

  static post<D = null, P = null>(url: string, config: RequestConfig<P>) {
    config.url = url
    config.method = 'POST'
    return instance<null, D>(config)
  }

  static delete<D = null, P = null>(url: string, config: RequestConfig<P>) {
    config.url = url
    config.method = 'DELETE'
    return instance<null, D>(config)
  }

  static put<D = null, P = null>(url: string, config: RequestConfig<P>) {
    config.url = url
    config.method = 'PUT'
    return instance<null, D>(config)
  }

  static other<D = null, P = null>(url: string, config: RequestConfig<P>) {
    config.url = url
    config.method = config.method || 'GET'
    return instance<null, D>(config)
  }
}