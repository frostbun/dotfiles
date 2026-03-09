---
name: unity-coding-lifecycle
description: |
  Use this skill when implementing application lifecycle management with UniT.Lifecycle package in Unity C# projects. This skill covers ILifecycleManager for initialization phases, sync/async loading interfaces, update interfaces (Update, LateUpdate, FixedUpdate), and application state listeners (focus, pause). Essential when coordinating service initialization, managing loading sequences, or handling application state changes.
---

# UniT.Lifecycle API Reference

Namespace: `UniT.Lifecycle`

## ILifecycleManager

| Method | Description |
|--------|-------------|
| `UniTask LoadAsync(IProgress<float>? = null, CancellationToken = default)` | **Async load** all services in phases |

## Loading Interfaces

Executed in **three phases** (early → normal → late). Within each phase: **sync services** run first, then **async services** run in parallel.

| Interface | Method | Description |
|-----------|--------|-------------|
| `IEarlyLoadable` | `void Load()` | **Sync load** in **early phase** |
| `IAsyncEarlyLoadable` | `UniTask LoadAsync(IProgress<float>?, CancellationToken)` | **Async load** in **early phase** |
| `ILoadable` | `void Load()` | **Sync load** in **normal phase** |
| `IAsyncLoadable` | `UniTask LoadAsync(IProgress<float>?, CancellationToken)` | **Async load** in **normal phase** |
| `ILateLoadable` | `void Load()` | **Sync load** in **late phase** |
| `IAsyncLateLoadable` | `UniTask LoadAsync(IProgress<float>?, CancellationToken)` | **Async load** in **late phase** |

## Update Interfaces

| Interface | Method | Description |
|-----------|--------|-------------|
| `IUpdatable` | `void Update()` | Called every **frame** |
| `ILateUpdatable` | `void LateUpdate()` | Called after all **Update** calls |
| `IFixedUpdatable` | `void FixedUpdate()` | Called at fixed **timestep** for **physics** |

## Application State Listeners

| Interface | Method | Description |
|-----------|--------|-------------|
| `IFocusChangedListener` | `void OnFocusGain()` | App regains **focus** |
| `IFocusChangedListener` | `void OnFocusLost()` | App loses **focus** |
| `IPauseChangedListener` | `void OnPause()` | App is **paused** |
| `IPauseChangedListener` | `void OnResume()` | App **resumes** from pause |

## LifecycleManager (abstract)

Constructor takes all **service collections**: `IEnumerable<IEarlyLoadable>`, `IEnumerable<IAsyncEarlyLoadable>`, etc., plus `ILoggerManager`

## Implementations

| Class | Type | DI Package | Notes |
|-------|------|------------|-------|
| `DILifecycleManager` | **sealed** | **UniT.DI** | Uses `[Preserve]` constructor |
| `VContainerLifecycleManager` | **sealed** | **VContainer** | Uses `ContainerLocal<T>` wrappers |
| `ZenjectLifecycleManager` | **sealed** | **Zenject** | Uses `[InjectLocal]` attributes |

## DI Registration

- VContainer: `builder.RegisterLifecycleManager()`
- Zenject: `Container.BindLifecycleManager()`
- Custom DI: `container.AddLifecycleManager()`

## Usage Example

```csharp
// Sync loading service
public class ConfigService : IEarlyLoadable
{
    public void Load()
    {
        // Load configuration
    }
}

// Async loading service
public class AssetService : IAsyncLoadable
{
    private readonly IAssetsManager _assets;
    
    public AssetService(IAssetsManager assets)
    {
        _assets = assets;
    }
    
    public async UniTask LoadAsync(IProgress<float>? progress, CancellationToken cancellationToken)
    {
        await _assets.LoadAsync<GameObject>("MainPrefab", progress, cancellationToken);
    }
}

// Update service
public class InputService : IUpdatable
{
    public void Update()
    {
        // Process input
    }
}

// Application state listener
public class AudioService : IPauseChangedListener
{
    public void OnPause()
    {
        // Mute audio
    }
    
    public void OnResume()
    {
        // Resume audio
    }
}
```
