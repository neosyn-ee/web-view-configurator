export interface WebViewConfiguratorPlugin {
  enableWebRTC(): Promise<void>;
  setJavaScriptEnabled(options: { enabled: boolean }): Promise<void>;
  requestCameraAndMicAccess(): Promise<{ granted: boolean }>;
}