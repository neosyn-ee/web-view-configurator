import { WebPlugin } from '@capacitor/core';

import type { WebViewConfiguratorPlugin } from './definitions';

export class WebViewConfiguratorWeb extends WebPlugin implements WebViewConfiguratorPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
