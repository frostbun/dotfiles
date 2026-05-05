---
name: unity-coding-pooling
description: |
  Use this skill when implementing object pooling with UniT.Pooling package in Unity C# projects. This skill covers IObjectPoolManager for loading, spawning, and recycling GameObjects, ObjectPool MonoBehaviour component for standalone pools, and DI registration. Essential when optimizing instantiation performance, managing object lifecycles, or implementing spawn/recycle patterns for bullets, enemies, or effects.
---

# UniT.Pooling API Reference

Namespace: `UniT.Pooling`

## IObjectPoolManager

### Events

| Event | Description |
|-------|-------------|
| `Instantiated` | **GameObject instantiated** from prefab |
| `Spawned` | **GameObject spawned** from pool |
| `Recycled` | **GameObject recycled** back to pool |
| `CleanedUp` | **GameObjects cleaned up** from pool |

### Load Methods (Sync)

| Method | Description |
|--------|-------------|
| `Load(GameObject prefab, int count = 1)` | **Load prefab** into pool synchronously |
| `Load(object key, int count = 1)` | **Load by key** into pool synchronously |
| `Load(Component prefab, int count = 1)` | **Load component prefab** into pool synchronously |
| `Load<T>(int count = 1)` | **Load prefab** with implicit key |

### Load Methods (Async)

| Method | Description |
|--------|-------------|
| `LoadAsync(object key, int count = 1, ...)` | **Load prefab** asynchronously with progress |
| `LoadAsync<T>(int count = 1, ...)` | **Load prefab** with implicit key asynchronously |

### Spawn Methods

| Method | Description |
|--------|-------------|
| `Spawn(GameObject prefab, ...)` | **Spawn GameObject** from prefab |
| `Spawn(object key, ...)` | **Spawn GameObject** by key |
| `Spawn<T>(T prefab, ...)` | **Spawn typed component** from prefab |
| `Spawn<T>(object key, ...)` | **Spawn typed component** by key |
| `Spawn<T>(...)` | **Spawn typed component** with implicit key |

### Recycle Methods

| Method | Description |
|--------|-------------|
| `Recycle(GameObject instance)` | **Recycle GameObject** back to pool |
| `Recycle(Component instance)` | **Recycle component** back to pool |
| `RecycleAll(GameObject prefab)` | **Recycle all instances** of prefab |
| `RecycleAll(Component prefab)` | **Recycle all instances** of component prefab |
| `RecycleAll(object key)` | **Recycle all instances** by key |
| `RecycleAll<T>()` | **Recycle all instances** of type with implicit key |

### Cleanup Methods

| Method | Description |
|--------|-------------|
| `Cleanup(GameObject prefab, int retainCount = 1)` | **Cleanup GameObject prefab** pool |
| `Cleanup(Component prefab, int retainCount = 1)` | **Cleanup component prefab** pool |
| `Cleanup(object key, int retainCount = 1)` | **Cleanup pool** by key |
| `Cleanup<T>(int retainCount = 1)` | **Cleanup pool** with implicit key |

### Unload Methods

| Method | Description |
|--------|-------------|
| `Unload(GameObject prefab)` | **Unload GameObject prefab** pool |
| `Unload(Component prefab)` | **Unload component prefab** pool |
| `Unload(object key)` | **Unload pool** by key |
| `Unload<T>()` | **Unload pool** with implicit key |

## ObjectPool (sealed : MonoBehaviour)

| Method | Description |
|--------|-------------|
| `static Construct(GameObject prefab, Transform parent)` | **Factory method** to create ObjectPool instance |
| `Load(int count)` | **Load prefab** into pool |
| `Spawn(...)` | **Spawn GameObject** from pool |
| `Spawn<T>(...)` | **Spawn typed component** from pool |
| `Recycle(...)` | **Recycle instance** back to pool |
| `RecycleAll()` | **Recycle all instances** back to pool |
| `Cleanup(int retainCount = 1)` | **Cleanup pool** retaining specified count |

### ObjectPool Events

| Event | Description |
|-------|-------------|
| `Instantiated` | **GameObject instantiated** from prefab |
| `Spawned` | **GameObject spawned** from pool |
| `Recycled` | **GameObject recycled** back to pool |
| `CleanedUp` | **GameObjects cleaned up** from pool |

## ObjectPoolManager (sealed)

| Constructor | Description |
|-------------|-------------|
| `[Preserve] public ObjectPoolManager(IAssetsManager assetsManager, ILoggerManager loggerManager)` | **Constructor** for dependency injection with assets and logger managers |

## DI Registration

| Framework | Method | Description |
|-----------|--------|-------------|
| **VContainer** | `builder.RegisterObjectPoolManager()` | **Register pool manager** with VContainer DI |
| **Zenject** | `Container.BindObjectPoolManager()` | **Bind pool manager** with Zenject DI |
| **Custom DI** | `container.AddObjectPoolManager()` | **Add pool manager** to custom DI container |

## Usage Example

```csharp
public class BulletManager
{
    private readonly IObjectPoolManager _poolManager;
    
    public BulletManager(IObjectPoolManager poolManager)
    {
        _poolManager = poolManager;
    }
    
    public async UniTask InitializeAsync()
    {
        await _poolManager.LoadAsync("BulletPrefab", 20);
    }
    
    public GameObject SpawnBullet(Vector3 position)
    {
        return _poolManager.Spawn("BulletPrefab", position);
    }
    
    public void RecycleBullet(GameObject bullet)
    {
        _poolManager.Recycle(bullet);
    }
}
```
