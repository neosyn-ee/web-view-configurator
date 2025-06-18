export interface WebViewConfiguratorPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
