---
name: unity-coding
description: Unity C# coding conventions and best practices including nullable types, async patterns, LINQ style, and code style rules. Use when writing Unity C# code.
---

## Unity C# Coding Conventions

### General

- **Enable nullable reference types** for better null safety
- **Use explicit access modifiers** (public, private, protected, internal) for everything (classes, interfaces, members, interface members)
- **Use the least accessible access modifier** (private -> protected -> internal -> public)
- **Use `using` directive** with short qualifiers, placed in the deepest scope
- **Fix all warnings** before committing code
- **Throw exceptions** instead of returning default values or debug logs
- **No inline comments**; use descriptive names; only add comments when necessary

### Libraries

When working on Unity projects that use **UniT** packages, load the appropriate skill for the package you're using.

**Note:** TheOne packages are just UniT packages renamed for TheOne Studio use. Both share identical APIs:
- **UniT** (`com.frostbun.unit.*`) - Original packages, use for solo projects
- **TheOne** (`com.theone.*`) - Renamed UniT packages, use for studio projects

Check `Packages/packages-lock.json` to see which are installed:
- If packages start with `com.frostbun.unit.` → Use `UniT` namespace (e.g., `UniT.Data`, `UniT.Audio`)
- If packages start with `com.theone.` → Use `TheOne` namespace (e.g., `TheOne.Data`, `TheOne.Audio`)

**Note:** `UNIT_UNITASK` and `THEONE_UNITASK` symbols are automatically added when `com.cysharp.unitask` package is installed. When UniTask is available, async methods return `UniTask`; otherwise, Coroutine variants (`IEnumerator`) with `Action? callback`, `Action<T> callback` are used.

Available package-specific skills:
- `unity-coding-extensions` - `UniT.Extensions` for collection LINQ (List, Dictionary, IEnumerable), Unity object extensions (Transform, Vector, Color, Camera, GameObject), coroutine/UniTask utilities, Deque and PriorityQueue data structures, and reflection utilities (Type extensions for constructors, fields, properties, derived types)
- `unity-coding-logging` - `UniT.Logging` for ILogger interface, LogLevel configuration, ILoggerManager registration, UnityLogger implementation, and DI integration with VContainer/Zenject
- `unity-coding-di` - `UniT.DI` for IDependencyContainer with manual/auto registration methods, Unity resource registration (Resources, prefabs, hierarchy), and VContainer/Zenject DI container integration
- `unity-coding-resource-management` - `UniT.ResourceManagement` for IAssetsManager sync/async asset loading, IRemoteAssetsDownloader for Addressables, IScenesManager for scene loading, and IExternalAssetsManager for downloading external resources
- `unity-coding-data` - `UniT.Data` for IDataManager save/load operations, CSV data types with attributes, type conversion system, serializers (JSON, MessagePack, MemoryPack), and storage providers (PlayerPrefs, Assets, External files)
- `unity-coding-pooling` - `UniT.Pooling` for IObjectPoolManager loading/spawning/recycling GameObjects, ObjectPool MonoBehaviour component for standalone pools, and DI registration
- `unity-coding-entities` - `UniT.Entities` for IEntityManager entity lifecycle management, IComponent/IEntity interfaces with base classes, Controller pattern for separating logic, and entity querying
- `unity-coding-lifecycle` - `UniT.Lifecycle` for ILifecycleManager initialization phases (early/normal/late), sync/async loading interfaces, IUpdatable/ILateUpdatable/IFixedUpdatable update interfaces, and application state listeners (focus, pause)
- `unity-coding-audio` - `UniT.Audio` for IAudioManager sound/music playback with volume control, IAudioManagerSettings for audio configuration, and async loading
- `unity-coding-easings` - `UniT.Easings` for 31 easing functions (Linear, Sine, Quad, Cubic, Quart, Quint, Expo, Circ, Back, Elastic, Bounce), Easing.Apply for custom animations, Transform extension methods for Move/Rotate/Scale, and Color/Text/Slider/Renderer extensions

### Asset Lifecycle

- **Unload assets** loaded on `Initialize`/`OnInstantiate` in `Dispose`/`OnCleanup`
- **Avoid `Find`/`GetComponent`** at runtime (`Update`/`Tick`); only use on initialization (`Awake`/`Start`/`OnSpawn`)

### Async

- **Use `async UniTaskVoid`** or `UniTask.Void(async () => {})` instead of `async void`
- **Use `.Forget()`** if not awaiting `UniTask`
- **Use `CancellationToken`** for cancellable async operations
- **Add `Async` suffix** to async method names
- **Use `UniTask.WaitForSecond`** instead of `UniTask.Delay` for time delays

### Reflection

- **Use `PreserveAttribute`** for constructors of classes instantiated via reflection (DI, JSON/CSV deserialization) to prevent code stripping

### LINQ

- **Use method chain style** for fluent LINQ operations
- **Avoid materializing** to collections if not necessary
- **Use `.ToArray()`** instead of `.ToList()` when the result will not be modified
- **Use read-only interfaces** (`IReadOnlyList<T>`, `IReadOnlyCollection<T>`, `IReadOnlyDictionary<TKey, TValue>`) when modification is not needed

### Code Style

- **Use `nameof`** instead of string literals for compile-time safety
- **Use `readonly`** for fields that are not reassigned
- **Use `const`** for constant values
- **Use `var`** for implicit type declaration
- **Use `this`** to access instance members
- **Use `new()`** for target-typed object creation
- **Add trailing comma** for multi-line initializers to simplify diffs
- **Use expression body** for properties and methods when possible
- **Use explicit interface implementation** to avoid naming conflicts and clearly indicate the method's source interface
- **Seal classes by default** (`sealed class`) unless inheritance is specifically intended
