---
name: unity-coding-entities
description: |
  Use this skill when implementing the Entity-Component pattern with UniT.Entities package in Unity C# projects. This skill covers IEntityManager for entity lifecycle management, IComponent/IEntity interfaces, base classes (Component, BaseEntity, Entity), Controller pattern for separating logic, and entity querying. Essential when creating spawnable game objects, managing entity pools, implementing controller logic, or building complex game object hierarchies.
---

# UniT.Entities API Reference

Namespace: `UniT.Entities`

## IEntityManager

### Events

| Event | Description |
|-------|-------------|
| `Instantiated` | Fired when an **entity is instantiated** from prefab |
| `Spawned` | Fired when an **entity is spawned** and activated |
| `Recycled` | Fired when an **entity is recycled** back to pool |
| `CleanedUp` | Fired when an **entity is cleaned up** and removed |

### Load Methods

| Method | Description |
|--------|-------------|
| `Load(IEntity prefab, int count)` | **Load entity** prefab into pool |
| `Load(object key, int count)` | **Load entity** by key into pool |
| `Load<TEntity>(int count)` | **Load entity** of type TEntity into pool |
| `LoadAsync(object key, int count, progress?, cancellationToken?)` | **Load entity** asynchronously with progress |
| `LoadAsync<TEntity>(int count, ...)` | **Load entity** of type TEntity asynchronously |

### Spawn Methods (without params)

| Method | Description |
|--------|-------------|
| `Spawn<TEntity>(TEntity prefab, Vector3?, Quaternion?, Transform?, bool)` | **Spawn entity** from prefab at position/rotation |
| `Spawn<TEntity>(object key, ...)` | **Spawn entity** by key at position/rotation |
| `Spawn<TEntity>(Vector3?, ...)` | **Spawn entity** with implicit key at position/rotation |

### Spawn Methods (with params)

| Method | Description |
|--------|-------------|
| `Spawn<TEntity, TParams>(TEntity prefab, TParams, ...)` | **Spawn entity** with params from prefab |
| `Spawn<TEntity, TParams>(object key, TParams, ...)` | **Spawn entity** with params by key |
| `Spawn<TEntity, TParams>(TParams, ...)` | **Spawn entity** with params using implicit key |

### Recycle/Cleanup/Unload Methods

| Method | Description |
|--------|-------------|
| `Recycle(IEntity instance)` | **Recycle single entity** instance back to pool |
| `RecycleAll(IEntity prefab)` | **Recycle all entities** of specific prefab |
| `RecycleAll(object key)` | **Recycle all entities** by key |
| `RecycleAll<TEntity>()` | **Recycle all entities** of type TEntity |
| `Cleanup(IEntity prefab, int retainCount)` | **Cleanup entity pool** retaining specified count |
| `Cleanup(object key, ...)` | **Cleanup entity pool** by key |
| `Cleanup<TEntity>(...)` | **Cleanup entity pool** for type TEntity |
| `Unload(IEntity prefab)` | **Unload entity** prefab from manager |
| `Unload(object key)` | **Unload entity** by key from manager |
| `Unload<TEntity>()` | **Unload entity** of type TEntity from manager |

### Query Methods

| Method | Description |
|--------|-------------|
| `Query<T>()` | **Query all active** entities/components of type T |

## Interfaces

| Interface | Description |
|-----------|-------------|
| `IComponentLifecycle` | **Lifecycle interface** with OnInstantiate, OnSpawn, OnRecycle, OnCleanup |
| `IComponent` | **Base component interface** extending IComponentLifecycle with Container, Manager, Entity, gameObject, transform |
| `IEntity` | **Entity marker interface** extending IComponent |
| `IEntityWithoutParams` | **Entity without params** marker interface |
| `IEntityWithParams` | **Entity with params** interface with object? Params setter |
| `IEntityWithParams<TParams>` | **Entity with typed params** interface with TParams? Params setter |

## Base Classes

### Component (abstract : BetterMonoBehavior, IComponent)

| Property/Method | Description |
|-----------------|-------------|
| `Container` | **Dependency container** for DI access |
| `Manager` | **Entity manager** reference |
| `Entity` | **Parent entity** reference |
| `OnInstantiate()` | **Virtual method** called when component is instantiated |
| `OnSpawn()` | **Virtual method** called when entity is spawned |
| `OnRecycle()` | **Virtual method** called when entity is recycled |
| `OnCleanup()` | **Virtual method** called when entity is cleaned up |

### BaseEntity (abstract : Component, IEntity)

| Method | Description |
|--------|-------------|
| `Recycle()` | **Recycle this entity** by calling Manager.Recycle(this) |

### Entity (: BaseEntity, IEntityWithoutParams)

| Description |
|-------------|
| **Entity without params** - simple spawnable entity base class |

### Entity<TParams> (abstract : BaseEntity, IEntityWithParams<TParams>)

| Property | Description |
|----------|-------------|
| `Params` | **Typed parameters** - throws if not set |

## Controller Pattern (UniT.Entities.Controller)

### Controller Interfaces

| Interface | Description |
|-----------|-------------|
| `IController` | **Controller interface** extending IComponentLifecycle with Component setter |
| `IComponentWithController` | **Marker interface** for components with controllers |

### Controller<TComponent> (abstract)

| Property/Method | Description |
|-----------------|-------------|
| `Component` | **Referenced component** of type TComponent |
| `Manager` | **Entity manager** reference |
| `Entity` | **Parent entity** reference |
| `OnInstantiate()` | **Virtual method** called when controller is instantiated |
| `OnSpawn()` | **Virtual method** called when entity is spawned |
| `OnRecycle()` | **Virtual method** called when entity is recycled |
| `OnCleanup()` | **Virtual method** called when entity is cleaned up |
| `GetCancellationTokenOnDisable()` | **UniTask support** - get cancellation token (requires UNIT_UNITASK) |
| `StartCoroutine/StopCoroutine/GatherCoroutines` | **Coroutine methods** available without UNIT_UNITASK |

### Component<TController> (abstract : Component, IComponentWithController)

| Property | Description |
|----------|-------------|
| `ControllerType` | **Virtual property** returning controller type |
| `Controller` | **Controller instance** of type TController |

### Entity<TController> (abstract : Entity, IComponentWithController)

| Description |
|-------------|
| **Entity with controller** - entity without params but with controller support |

### Entity<TParams, TController> (abstract : Entity<TParams>, IComponentWithController)

| Description |
|-------------|
| **Entity with params and controller** - full featured entity with both params and controller support |

## EntityManager (sealed)

| Constructor | Description |
|-------------|-------------|
| `EntityManager(IDependencyContainer, IObjectPoolManager)` | **Main constructor** with DI container and pool manager |

## DI Registration

| DI Framework | Method |
|--------------|--------|
| VContainer | `builder.RegisterEntityManager()` |
| Zenject | `Container.BindEntityManager()` |
| Custom DI | `container.AddEntityManager()` |

## Usage Example

```csharp
// Simple entity
public class Enemy : Entity { }

// Entity with params
public class ProjectileParams
{
    public float Damage { get; set; }
    public Vector3 Direction { get; set; }
}

public class Projectile : Entity<ProjectileParams>
{
    protected override void OnSpawn()
    {
        // Params is available here
        var damage = Params.Damage;
    }
}

// Controller pattern
public class PlayerController : Controller<PlayerComponent>
{
    protected override void OnSpawn()
    {
        // Access Component, Manager, Entity
    }
}

public class PlayerComponent : Component<PlayerController> { }
```
