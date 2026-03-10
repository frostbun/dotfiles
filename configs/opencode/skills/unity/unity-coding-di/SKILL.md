---
name: unity-coding-di
description: |
  Use this skill when implementing dependency injection with UniT.DI package in Unity C# projects. This skill covers IDependencyContainer interface, manual and auto-registration methods, Unity resource registration (from Resources, prefabs, hierarchy), and integration with VContainer and Zenject DI containers. Essential when setting up DI containers, registering services, resolving dependencies, or instantiating objects with constructor injection.
---

# UniT.DI API Reference

Namespace: `UniT.DI`

## IDependencyContainer

| Method | Description |
|--------|-------------|
| `bool TryResolve(Type type, out object instance)` / `bool TryResolve<T>(out T instance)` | **Try to resolve** a dependency by type |
| `object Resolve(Type type)` / `T Resolve<T>()` | **Resolve** a dependency by type |
| `object[] ResolveAll(Type type)` / `T[] ResolveAll<T>()` | **Resolve all** dependencies of a type |
| `object Instantiate(Type type, params object?[] @params)` / `T Instantiate<T>(params object?[] @params)` | **Instantiate** an object with constructor injection |
| `GameObject Instantiate(GameObject prefab)` | **Instantiate** a prefab with injection |
| `void Inject(object instance)` / `void Inject(GameObject instance)` | **Inject** dependencies into existing instance |

## DependencyContainer (sealed, default implementation)

### Manual Registration

| Method | Description |
|--------|-------------|
| `Add(Type type, object instance)` / `Add(object instance)` / `Add<T>(T instance)` | **Register instance** by type |
| `AddInterfaces(object instance)` | **Register instance** for all its interfaces |
| `AddInterfacesAndSelf(object instance)` | **Register instance** for all interfaces and self |

### Auto Registration (with params for constructor)

| Method | Description |
|--------|-------------|
| `Add(Type type, params object?[])` / `Add<T>(params object?[])` | **Auto-register type** for self |
| `AddInterfaces(Type type, params object?[])` / `AddInterfaces<T>(params object?[])` | **Auto-register type** for all interfaces |
| `AddInterfacesAndSelf(Type type, params object?[])` / `AddInterfacesAndSelf<T>(params object?[])` | **Auto-register type** for all interfaces and self |

### Query

| Method | Description |
|--------|-------------|
| `Contains(Type)` / `Contains<T>()` | **Check if** type is registered |
| `Get(Type)` / `Get<T>()` / `TryGet(Type, out object)` / `TryGet<T>(out T)` | **Get single** registration |
| `GetAll(Type)` / `GetAll<T>()` | **Get all** registrations of type |

### Instantiation & Invocation

| Method | Description |
|--------|-------------|
| `Instantiate(Type, params object?[])` / `Instantiate<T>(params object?[])` | **Instantiate** with constructor injection |
| `Invoke(object, MethodInfo, params object[])` / `Invoke(object, string methodName, params object[])` | **Invoke method** with dependency injection |

### Unity Resource Registration

| Method | Description |
|--------|-------------|
| `AddFromResource<T>(string path)` | **Register from** Resources folder |
| `AddInterfacesFromResource<T>(path)` | **Register interfaces** from Resources |
| `AddInterfacesAndSelfFromResource<T>(path)` | **Register interfaces and self** from Resources |
| `AddFromComponentInNewPrefabResource<T>(path)` | **Register component** from prefab in Resources |
| `AddInterfacesFromComponentInNewPrefabResource<T>(path)` | **Register interfaces** from prefab in Resources |
| `AddInterfacesAndSelfFromComponentInNewPrefabResource<T>(path)` | **Register interfaces and self** from prefab in Resources |
| `AddFromComponentInNewPrefab<T>(T prefab)` | **Register component** from prefab instance |
| `AddInterfacesFromComponentInNewPrefab<T>(prefab)` | **Register interfaces** from prefab instance |
| `AddInterfacesAndSelfFromComponentInNewPrefab<T>(prefab)` | **Register interfaces and self** from prefab instance |
| `AddFromComponentInHierarchy<T>()` | **Register component** from scene hierarchy |
| `AddInterfacesFromComponentInHierarchy<T>()` | **Register interfaces** from scene hierarchy |
| `AddInterfacesAndSelfFromComponentInHierarchy<T>()` | **Register interfaces and self** from scene hierarchy |
| `AddAllFromComponentInHierarchy<T>()` | **Register all components** from scene hierarchy |
| `AddAllInterfacesFromComponentInHierarchy<T>()` | **Register all interfaces** from scene hierarchy |
| `AddAllInterfacesAndSelfFromComponentInHierarchy<T>()` | **Register all interfaces and self** from scene hierarchy |

**Supported Collection Parameters:** resolves **IEnumerable<T>**, **ICollection<T>**, **IList<T>**, **IReadOnlyCollection<T>**, **IReadOnlyList<T>**, **Collection<T>**, **List<T>**, **ReadOnlyCollection<T>**

## VContainerWrapper (sealed, when UNIT_VCONTAINER)

| Method | Description |
|--------|-------------|
| `[Preserve] public VContainerWrapper(IObjectResolver container)` | **Wraps** VContainer's **IObjectResolver** |

### VContainer Extension Methods

| Method | Description |
|--------|-------------|
| `builder.RegisterDependencyContainer()` | **Register** the dependency container itself |
| `builder.RegisterResource<T>(string path, Lifetime)` | **Register resource** from path with lifetime |
| `builder.RegisterComponentInNewPrefabResource<T>(string path, Lifetime)` | **Register component** from prefab resource |
| `builder.AsInterfacesAndSelf()` | **Chain helper** for registration |
| `builder.AutoResolve(Type)` / `builder.AutoResolve<T>()` | **Enable auto resolution** for type |
| `container.Instantiate(Type, params object?[])` / `container.Instantiate<T>(params object?[])` | **Instantiate** with extra parameters |
| `Parameter` class | **IInjectParameter** for passing extra params |

## ZenjectWrapper (sealed, when UNIT_ZENJECT)

| Method | Description |
|--------|-------------|
| `[Preserve] public ZenjectWrapper(DiContainer container)` | **Wraps** Zenject's **DiContainer** |
| `container.BindDependencyContainer()` | **Extension method** to bind dependency container |

## Usage Example

```csharp
// Manual registration
var container = new DependencyContainer();
container.Add<IMyService, MyService>();
container.AddInterfacesAndSelf(new ConcreteService());

// Resolve
var service = container.Resolve<IMyService>();

// VContainer integration
builder.RegisterDependencyContainer();
builder.RegisterResource<MyScriptableObject>("Data/Config", Lifetime.Singleton);
```
