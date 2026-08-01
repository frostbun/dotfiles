---
name: unity-coding-resource-management
description: |
  Use this skill when working with asset loading and resource management using UniT.ResourceManagement package in Unity C# projects. This skill covers IAssetsManager for sync/async asset loading, IRemoteAssetsDownloader for Addressables, IScenesManager for scene loading, and IExternalAssetsManager for downloading external resources. Essential when loading assets, managing scenes, or downloading external content with progress tracking.
---

# UniT.ResourceManagement API Reference

**Namespace**: `UniT.ResourceManagement`

## IAssetsManager : IDisposable

### Sync Methods (Explicit Key)

| Method | Description |
|--------|-------------|
| `T Load<T>(object key)` | **Load asset** by **key** with type **T** |
| `IEnumerable<T> LoadAll<T>(object key)` | **Load all assets** by **key** matching type **T** |
| `bool TryLoad<T>(object key, out T asset)` | **Try load asset** with success check |
| `T LoadComponent<T>(object key)` | **Load component** from GameObject by **key** |
| `IEnumerable<T> LoadAllComponents<T>(object key)` | **Load all components** from GameObjects by **key** |
| `bool TryLoadComponent<T>(object key, out T component)` | **Try load component** with success check |
| `void Unload(object key)` | **Unload asset** from **cache** by **key** |
| `void UnloadAll(object key)` | **Unload all assets** matching **key** from **cache** |

### Sync Methods (Implicit Key)

| Method | Description |
|--------|-------------|
| `T Load<T>()` | **Load asset** using **implicit key** (typeof(T).GetKey()) |
| `IEnumerable<T> LoadAll<T>()` | **Load all assets** using **implicit key** |
| `bool TryLoad<T>(out T asset)` | **Try load asset** using **implicit key** |
| `T LoadComponent<T>()` | **Load component** using **implicit key** |
| `IEnumerable<T> LoadAllComponents<T>()` | **Load all components** using **implicit key** |
| `bool TryLoadComponent<T>(out T component)` | **Try load component** using **implicit key** |
| `void Unload<T>()` | **Unload asset** by **type T** |

### Async Methods (Explicit Key)

| Method | Description |
|--------|-------------|
| `UniTask<T> LoadAsync<T>(object key, IProgress<float>?, CancellationToken)` | **Load asset asynchronously** with **progress tracking** and **cancellation** |
| `UniTask<IEnumerable<T>> LoadAllAsync<T>(object key, ...)` | **Load all assets asynchronously** |
| `UniTask<(bool, T)> TryLoadAsync<T>(object key, ...)` | **Try load asset asynchronously** with success result |
| `UniTask<T> LoadComponentAsync<T>(object key, ...)` | **Load component asynchronously** |
| `UniTask<IEnumerable<T>> LoadAllComponentsAsync<T>(...)` | **Load all components asynchronously** |
| `UniTask<(bool, T)> TryLoadComponentAsync<T>(object key, ...)` | **Try load component asynchronously** with success result |

### Async Methods (Implicit Key)

| Method | Description |
|--------|-------------|
| `UniTask<T> LoadAsync<T>()` | **Load asset asynchronously** using **implicit key** |
| `UniTask<IEnumerable<T>> LoadAllAsync<T>()` | **Load all assets asynchronously** using **implicit key** |
| `UniTask<(bool, T)> TryLoadAsync<T>()` | **Try load asset asynchronously** using **implicit key** |
| `UniTask<T> LoadComponentAsync<T>()` | **Load component asynchronously** using **implicit key** |
| `UniTask<IEnumerable<T>> LoadAllComponentsAsync<T>()` | **Load all components asynchronously** using **implicit key** |
| `UniTask<(bool, T)> TryLoadComponentAsync<T>()` | **Try load component asynchronously** using **implicit key** |

## IRemoteAssetsDownloader

Implemented by **AddressableAssetsManager**.

| Method | Description |
|--------|-------------|
| `DownloadAsync(object key, IProgress<float>?, CancellationToken)` | **Download remote Addressable assets** to **device** by **key** |
| `DownloadAllAsync(IProgress<float>?, CancellationToken)` | **Download all remote content** |
| `DownloadAsync<T>()` | **Download remote assets** using **implicit key** |

## IScenesManager

| Method | Description |
|--------|-------------|
| `void Load(string name, LoadSceneMode mode = Single)` | **Load scene** **synchronously** by **name** |
| `UniTask LoadAsync(string name, LoadSceneMode mode = Single, ...)` | **Load scene asynchronously** with **progress tracking** |
| `UniTask UnloadAsync(string name, ...)` | **Unload scene asynchronously** with **progress tracking** |

## IExternalAssetsManager

| Method | Description |
|--------|-------------|
| `DownloadTextAsync(string url, bool cache = true, ...)` | **Download text content** as **string** |
| `DownloadBufferAsync(string url, bool cache = true, ...)` | **Download binary data** as **byte array** |
| `DownloadTextureAsync(string url, bool cache = true, ...)` | **Download texture** as **Texture2D** |
| `DownloadSpriteAsync(string url, bool cache = true, ...)` | **Download sprite** as **Sprite** |
| `DownloadAudioClipAsync(string url, AudioType, bool cache = true, ...)` | **Download audio** as **AudioClip** |
| `DownloadFileAsync(string url, string savePath, bool cache = true, ...)` | **Download file** to **save path** |
| `DeleteCache(string key)` | **Delete cached content** by **key** |

**Note**: All **download methods** accept **Uri** overloads in addition to **string urls**.

## Implementations

| Class | Constructor | Description |
|-------|-------------|-------------|
| `AddressableAssetsManager` (sealed) | `[Preserve] (ILoggerManager, string? scope = null)` | **Addressables-based** implementation, also implements **IRemoteAssetsDownloader** |
| `ResourceAssetsManager` (sealed) | `[Preserve] (ILoggerManager, string? scope = null)` | **Resources-based** implementation, **string keys only** |
| `AddressableScenesManager` (sealed) | `[Preserve] (ILoggerManager)` | **Addressables-based** scene management |
| `ResourceScenesManager` (sealed) | `[Preserve] (ILoggerManager)` | **Resources-based** scene management |
| `ExternalAssetsManager` (sealed) | `[Preserve] (ILoggerManager)` | **UnityWebRequest-based** external asset downloading |

## DI Registration

| Container | Assets Manager | Scenes Manager | External Assets Manager |
|-----------|---------------|----------------|------------------------|
| **VContainer** | `builder.RegisterAssetsManager(scope?)` | `builder.RegisterScenesManager()` | `builder.RegisterExternalAssetsManager()` |
| **Zenject** | `container.BindAssetsManager(scope?)` | `container.BindScenesManager()` | `container.BindExternalAssetsManager()` |
| **Custom DI** | `container.AddAssetsManager(scope?)` | `container.AddScenesManager()` | `container.AddExternalAssetsManager()` |

Automatically selects **Addressable** (`UNIT_ADDRESSABLES`) or **Resource** implementation based on **compilation symbols**.

## Usage Example

```csharp
public class AssetLoader
{
    private readonly IAssetsManager _assets;
    
    public AssetLoader(IAssetsManager assets)
    {
        _assets = assets;
    }
    
    public async UniTask LoadPlayerAsync()
    {
        var player = await _assets.LoadAsync<GameObject>("PlayerPrefab");
        // Use player...
    }
}
```
