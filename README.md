# @neosyn-ee/web-view-configurator

Configures WKWebView settings

## Install

```bash
npm install @neosyn-ee/web-view-configurator
npx cap sync
```

## API

<docgen-index>

* [`enableWebRTC()`](#enablewebrtc)
* [`setJavaScriptEnabled(...)`](#setjavascriptenabled)
* [`requestCameraAndMicAccess()`](#requestcameraandmicaccess)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### enableWebRTC()

```typescript
enableWebRTC() => Promise<void>
```

--------------------


### setJavaScriptEnabled(...)

```typescript
setJavaScriptEnabled(options: { enabled: boolean; }) => Promise<void>
```

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ enabled: boolean; }</code> |

--------------------


### requestCameraAndMicAccess()

```typescript
requestCameraAndMicAccess() => Promise<{ granted: boolean; }>
```

**Returns:** <code>Promise&lt;{ granted: boolean; }&gt;</code>

--------------------

</docgen-api>
