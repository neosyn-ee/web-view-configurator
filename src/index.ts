import { registerPlugin } from '@capacitor/core';

import type { WebViewConfiguratorPlugin } from './definitions';

const WebViewConfigurator = registerPlugin<WebViewConfiguratorPlugin>('WebViewConfigurator', {
  web: () => import('./web').then((m) => new m.WebViewConfiguratorWeb()),
});

export * from './definitions';
export { WebViewConfigurator };
