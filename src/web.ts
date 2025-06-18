import { WebPlugin } from '@capacitor/core';

import type { WebViewConfiguratorPlugin } from './definitions';

export class WebViewConfiguratorWeb extends WebPlugin implements WebViewConfiguratorPlugin {
  async requestCameraAndMicAccess(): Promise<{ granted: boolean; }> {
    throw new Error('Method not implemented.');
  }

  async enableWebRTC(): Promise<void> {
    console.warn('WebRTC configuration not available on web platform');
    return Promise.resolve();
  }

  async setJavaScriptEnabled(options: { enabled: boolean }): Promise<void> {
    console.warn('JavaScript configuration not available on web platform', options);
    return Promise.resolve();
  }
}