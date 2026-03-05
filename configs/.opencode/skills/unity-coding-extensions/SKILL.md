---
name: unity-coding-extensions
description: | 
  Use this skill when working with UniT.Extensions package in Unity C# projects. This skill provides comprehensive API reference for collection extensions (List, Dictionary, IEnumerable LINQ), Unity-specific extensions (Transform, Vector, Color, Camera, GameObject), coroutine/UniTask utilities, data structures like Deque and PriorityQueue, and reflection utilities (Type extensions for constructors, fields, properties, derived types). Essential when writing collection manipulation code, LINQ queries with tuples/dictionaries, Unity object operations, or reflection-based code.
---

# UniT.Extensions API Reference

Namespace: `UniT.Extensions`

## Collection Extensions

### IList<T> Extensions

| Method | Description |
|--------|-------------|
| `GetRealIndex<T>(Index)` | **Resolve System.Index** to int |
| `RemoveAt<T>(Index)` | **Remove element** using System.Index |
| `RemoveAtSwapBack<T>(Index)` | **O(1) removal** without order preservation |
| `GetRange<T>(int start, int stop)` | **Slice operations** on list |
| `GetRange<T>(Index start, Index stop)` | **Slice operations** using indices |
| `GetRange<T>(Range)` | **Slice operations** using Range |
| `RemoveRange<T>(int start, int stop)` | **Remove range** by int indices |
| `RemoveRange<T>(Index start, Index stop)` | **Remove range** by System.Index |
| `RemoveRange<T>(Range)` | **Remove range** by Range |

### ICollection<T> Extensions

| Method | Description |
|--------|-------------|
| `AddRange<T>(IEnumerable<T>)` | **Add multiple elements** to collection |
| `RemoveRange<T>(IEnumerable<T>)` | **Remove multiple elements** from collection |
| `Clear<T>(Action<T>)` | **Clear with callback** on each item |

### Stack<T> Extensions

| Method | Description |
|--------|-------------|
| `PeekOrDefault<T>()` | **Peek** or return default(T) |
| `PeekOrDefault<T>(T default)` | **Peek** or return specified default |
| `PeekOrDefault<T>(Func<T>)` | **Peek** or invoke factory |
| `PopOrDefault<T>()` | **Pop** or return default(T) |
| `PopOrDefault<T>(T default)` | **Pop** or return specified default |
| `PopOrDefault<T>(Func<T>)` | **Pop** or invoke factory |
| `Clear<T>(Action<T>)` | **Clear with callback** on each item |

### Queue<T> Extensions

| Method | Description |
|--------|-------------|
| `PeekOrDefault<T>()` | **Peek** or return default(T) |
| `PeekOrDefault<T>(T default)` | **Peek** or return specified default |
| `PeekOrDefault<T>(Func<T>)` | **Peek** or invoke factory |
| `DequeueOrDefault<T>()` | **Dequeue** or return default(T) |
| `DequeueOrDefault<T>(T default)` | **Dequeue** or return specified default |
| `DequeueOrDefault<T>(Func<T>)` | **Dequeue** or invoke factory |
| `Clear<T>(Action<T>)` | **Clear with callback** on each item |

### Conversion Methods

| Method | Description |
|--------|-------------|
| `ToStack<T>()` | **Convert to Stack** |
| `ToQueue<T>()` | **Convert to Queue** |
| `AsReadOnly<T>()` | **Create read-only view** |
| `To2DArray<T>()` | **Convert to 2D array** |
| `ToJaggedArray<T>()` | **Convert to jagged array** |
| `ToReadOnlyCollection<T>()` | **Convert to read-only collection** |

## Dictionary Extensions

### IDictionary<TKey, TValue> Extensions

| Method | Description |
|--------|-------------|
| `GetOrDefault(key)` | **Get value** or return default |
| `GetOrDefault(key, default)` | **Get value** or return specified default |
| `GetOrDefault(key, Func<TValue>)` | **Get value** or invoke factory |
| `RemoveOrDefault(key)` | **Remove and return** or default |
| `RemoveOrDefault(key, default)` | **Remove and return** or specified default |
| `RemoveOrDefault(key, Func<TValue>)` | **Remove and return** or invoke factory |
| `GetOrAdd(key, Func<TValue>)` | **Get or add** using factory |
| `GetOrAdd(key)` | **Get or add** where TValue : new() |
| `TryAdd(key, Func<TValue>)` | **Try add** using factory |
| `TryAdd(key)` | **Try add** where TValue : new() |
| `RemoveRange(IEnumerable<TKey>)` | **Remove multiple keys** |
| `RemoveWhere(Func<TKey, TValue, bool>)` | **Remove by predicate** |
| `Clear(Action<TKey, TValue>)` | **Clear with key-value callback** |
| `Clear(Action<TValue>)` | **Clear with value-only callback** |

### Dictionary LINQ Extensions (IEnumerable<KeyValuePair<TKey, TValue>>)

| Method | Description |
|--------|-------------|
| `First(Func<TKey, TValue, bool>)` | **First element** by key-value predicate |
| `FirstOrDefault(Func<TKey, TValue, bool>)` | **First or default** by key-value predicate |
| `Last(Func<TKey, TValue, bool>)` | **Last element** by key-value predicate |
| `LastOrDefault(Func<TKey, TValue, bool>)` | **Last or default** by key-value predicate |
| `Single(Func<TKey, TValue, bool>)` | **Single element** by key-value predicate |
| `SingleOrDefault(Func<TKey, TValue, bool>)` | **Single or default** by key-value predicate |
| `Where(Func<TKey, TValue, bool>)` | **Filter** by key-value predicate |
| `WhereKey(Func<TKey, bool>)` | **Filter** by key only |
| `WhereValue(Func<TValue, bool>)` | **Filter** by value only |
| `Select(Func<TKey, TValue, TResult>)` | **Project** key-value to result |
| `SelectKeys()` | **Select** keys only |
| `SelectValues()` | **Select** values only |
| `SelectMany(...)` | **SelectMany** on dictionary |
| `Aggregate(seed, Func<acc, TKey, TValue, acc>)` | **Aggregate** with key-value selector |
| `Min(Func<TKey, TValue, TResult>)` | **Minimum** by key-value projection |
| `Max(Func<TKey, TValue, TResult>)` | **Maximum** by key-value projection |
| `MinBy(...)` | **Minimum by** with optional IComparer |
| `MinByKey(...)` | **Minimum by key** with optional IComparer |
| `MinByValue(...)` | **Minimum by value** with optional IComparer |
| `MaxBy(...)` | **Maximum by** with optional IComparer |
| `MaxByKey(...)` | **Maximum by key** with optional IComparer |
| `MaxByValue(...)` | **Maximum by value** with optional IComparer |
| `Any(Func<TKey, TValue, bool>)` | **Any** matches key-value predicate |
| `All(Func<TKey, TValue, bool>)` | **All** match key-value predicate |
| `ForEach(Action<TKey, TValue>)` | **Iterate** with key-value action |
| `SafeForEach(Action<TKey, TValue>)` | **Safe iteration** (materializes first) |
| `ForEach(Action<TValue>)` | **Iterate** values only |
| `SafeForEach(Action<TValue>)` | **Safe iteration** values only |
| `GroupBy(...)` | **Group** by key-value projection |
| `GroupByKey(...)` | **Group by key** |
| `GroupByValue(...)` | **Group by value** |
| `OrderBy(...)` | **Order** by key-value projection |
| `OrderByKey(...)` | **Order by key** |
| `OrderByValue(...)` | **Order by value** |
| `ThenBy(...)` | **Then by** key-value projection |
| `ThenByKey(...)` | **Then by key** |
| `ThenByValue(...)` | **Then by value** |
| `OrderByDescending(...)` | **Order descending** by key-value projection |
| `OrderByDescendingKey(...)` | **Order descending by key** |
| `OrderByDescendingValue(...)` | **Order descending by value** |
| `ThenByDescending(...)` | **Then by descending** |
| `ThenByDescendingKey(...)` | **Then by descending key** |
| `ThenByDescendingValue(...)` | **Then by descending value** |
| `ToDictionary()` | **Convert to Dictionary** |
| `AsReadOnly()` | **Create read-only view** |

## Enumerable Extensions

### IEnumerable<T> Extensions

| Method | Description |
|--------|-------------|
| `AggregateFromFirst(Func<T, T, T>)` | **Aggregate** starting from first element |
| `AggregateFromFirstOrDefault(...)` | **Aggregate or default** from first element |
| `Min(IComparer?)` | **Minimum** with optional comparer |
| `Max(IComparer?)` | **Maximum** with optional comparer |
| `MinOrDefault(...)` | **Minimum or default** with default overloads |
| `MaxOrDefault(...)` | **Maximum or default** with default overloads |
| `MinBy(Func<T, TKey>, IComparer?)` | **Minimum by** with optional comparer |
| `MaxBy(Func<T, TKey>, IComparer?)` | **Maximum by** with optional comparer |
| `MinByOrDefault(...)` | **Minimum by or default** |
| `MaxByOrDefault(...)` | **Maximum by or default** |
| `Except(T item)` | **Exclude** single item |
| `Prepend(IEnumerable<T>)` | **Prepend** sequences |
| `Append(IEnumerable<T>)` | **Append** sequences |
| `Flat()` | **Flatten** nested enumerables |
| `ForEach(Action<T>)` | **Iterate** with action |
| `SafeForEach(Action<T>)` | **Safe iteration** (materializes first) |
| `FirstIndex(predicate)` | **First index** matching predicate |
| `LastIndex(predicate)` | **Last index** matching predicate |
| `SingleIndex(predicate)` | **Single index** matching predicate |
| `FirstIndexOrDefault(predicate)` | **First index or default** |
| `LastIndexOrDefault(predicate)` | **Last index or default** |
| `SingleIndexOrDefault(predicate)` | **Single index or default** |
| `FirstIndexOf(T)` | **First index of** item |
| `LastIndexOf(T)` | **Last index of** item |
| `SingleIndexOf(T)` | **Single index of** item |
| `FirstIndexOfOrDefault(T)` | **First index of or default** |
| `LastIndexOfOrDefault(T)` | **Last index of or default** |
| `SingleIndexOfOrDefault(T)` | **Single index of or default** |
| `ContainsAll(IEnumerable<T>)` | **Contains all** items |
| `Shuffle()` | **Random shuffle** |
| `Sample(int count)` | **Sample** N random elements |
| `Sample(count, weights)` | **Weighted sample** |
| `Random()` | **Random element** |
| `RandomOrDefault()` | **Random element or default** |
| `Enumerate(int start = 0)` | **Enumerate** with index, returns `(int Index, T Value)` |
| `Each(int step)` | **Take every Nth** element |
| `Repeat(int count)` | **Repeat** sequence N times |
| `Pairwise()` | **Adjacent pairs**, returns `(T, T)` |
| `Accumulate(Func<T, T, T>)` | **Cumulative** fold |
| `Accumulate(seed, Func<acc, T, acc>)` | **Cumulative** fold with seed |
| `ChunkBy(int size)` | **Chunk** into groups of size |
| `Cycle()` | **Infinite cycle** |
| `Split(predicate)` | **Partition** into `(List<T> Matches, List<T> Mismatches)` |
| `ToCollectionIfNeeded()` | **Materialize** only if not already collection |

### Indexed Enumerable Extensions (IEnumerable<T>)

| Method | Description |
|--------|-------------|
| `First(Func<T, int, bool>)` | **First** with index predicate |
| `FirstOrDefault(Func<T, int, bool>)` | **First or default** with index predicate |
| `Last(Func<T, int, bool>)` | **Last** with index predicate |
| `LastOrDefault(Func<T, int, bool>)` | **Last or default** with index predicate |
| `Single(Func<T, int, bool>)` | **Single** with index predicate |
| `SingleOrDefault(Func<T, int, bool>)` | **Single or default** with index predicate |
| `Aggregate(seed, Func<acc, T, int, acc>)` | **Aggregate** with index selector |
| `Min(Func<T, int, TResult>)` | **Minimum** with index projection |
| `Max(Func<T, int, TResult>)` | **Maximum** with index projection |
| `MinBy(Func<T, int, TKey>)` | **Minimum by** with index selector |
| `MaxBy(Func<T, int, TKey>)` | **Maximum by** with index selector |
| `Any(Func<T, int, bool>)` | **Any** with index predicate |
| `All(Func<T, int, bool>)` | **All** with index predicate |
| `ForEach(Action<T, int>)` | **Iterate** with index action |
| `SafeForEach(Action<T, int>)` | **Safe iteration** with index |

### Tuple Extensions (IEnumerable<(T1, T2)> and IEnumerable<(T1, T2, T3)>)

| Method | Description |
|--------|-------------|
| `Where(Func<T1, T2, bool>)` | **Filter** tuple elements |
| `WhereFirst(Func<T1, bool>)` | **Filter** by first element |
| `WhereSecond(Func<T2, bool>)` | **Filter** by second element |
| `WhereThird(Func<T3, bool>)` | **Filter** by third element |
| `Select(Func<T1, T2, TResult>)` | **Project** tuple elements |
| `SelectFirsts()` | **Select** first elements |
| `SelectSeconds()` | **Select** second elements |
| `SelectThirds()` | **Select** third elements |
| `Aggregate(...)` | **Aggregate** on tuples |
| `Min(...)` | **Minimum** on tuples |
| `Max(...)` | **Maximum** on tuples |
| `MinBy(...)` | **Minimum by** on tuples |
| `MaxBy(...)` | **Maximum by** on tuples |
| `Any(Func<T1, T2, bool>)` | **Any** on tuples |
| `All(Func<T1, T2, bool>)` | **All** on tuples |
| `ForEach(Action<T1, T2>)` | **Iterate** tuples |
| `SafeForEach(Action<T1, T2>)` | **Safe iteration** on tuples |
| `GroupBy(...)` | **Group** on tuples |
| `GroupByFirst(...)` | **Group by first** element |
| `GroupBySecond(...)` | **Group by second** element |
| `OrderBy(...)` | **Order** on tuples |
| `OrderByFirst(...)` | **Order by first** element |
| `OrderBySecond(...)` | **Order by second** element |
| `ThenBy(...)` | **Then by** on tuples |
| `ThenByFirst(...)` | **Then by first** element |
| `ThenBySecond(...)` | **Then by second** element |
| `Unzip()` | **Split tuple** into separate sequences |
| `Split(predicate)` | **Partition** tuples |
| `ToDictionary()` | **Convert to Dictionary** |

### Group Extensions (IEnumerable<IGrouping<TKey, T>>)

| Method | Description |
|--------|-------------|
| `MinByKey(...)` | **Minimum by key** |
| `MaxByKey(...)` | **Maximum by key** |
| `OrderByKey(...)` | **Order by key** |
| `OrderByDescendingKey(...)` | **Order descending by key** |
| `ThenByKey(...)` | **Then by key** |
| `ThenByDescendingKey(...)` | **Then by descending key** |

### Parallel Enumerable Extensions

| Method | Description |
|--------|-------------|
| `ParallelForEach(Action<T>)` | **Parallel iteration** |
| `SafeParallelForEach(Action<T>)` | **Safe parallel iteration** |
| `Shuffle()` | **Parallel shuffle** |
| `Sample(int count)` | **Parallel sample** |

## String Extensions

| Method | Description |
|--------|-------------|
| `IsNullOrEmpty()` | **Check** for null or empty |
| `IsNullOrWhiteSpace()` | **Check** for null or whitespace |
| `NullIfEmpty()` | **Return null** if empty, else string |
| `NullIfWhiteSpace()` | **Return null** if whitespace, else string |
| `EmptyIfNull()` | **Return empty** if null, else string |
| `Trim(string)` | **Trim** substring |
| `TrimStart(string)` | **Trim start** substring |
| `TrimEnd(string)` | **Trim end** substring |
| `Join(char/string)` | **Join** characters/strings |
| `Wrap(string)` | **Wrap** with same string |
| `Wrap(left, right)` | **Wrap** with different strings |
| `Format(params object[])` | **Format** string |
| `WithColor(Color)` | **Rich text** color formatting |
| `WithSize(int)` | **Rich text** size formatting |
| `MultiplySize(float)` | **Rich text** multiply size |
| `AddSize(int)` | **Rich text** add size |
| `ToJson()` | **Serialize** to JSON (requires UNIT_JSON) |

## DateTime Extensions

| Method | Description |
|--------|-------------|
| `GetFirstDayOfWeek(DayOfWeek?)` | **First day** of week |
| `GetFirstDayOfMonth()` | **First day** of month |
| `GetFirstDayOfYear()` | **First day** of year |

## Reflection Extensions

| Method | Description |
|--------|-------------|
| `GetSingleConstructor()` | **Get single constructor** |
| `GetSingleDerivedType()` | **Get single derived type** |
| `GetEmptyConstructor()` | **Get parameterless constructor** |
| `GetAllFields(BindingFlags?)` | **Get all fields** with optional flags |
| `GetAllProperties(BindingFlags?)` | **Get all properties** with optional flags |
| `GetDerivedTypes()` | **Get derived types** in assembly |
| `GetDerivedTypes(Assembly)` | **Get derived types** from specific assembly |
| `IsAssignableTo(Type)` | **Check assignability** to type |
| `CopyTo(object)` | **Copy fields/properties** to object |
| `IsBackingField()` | **Check** if backing field |
| `ToBackingFieldName()` | **Convert** property to backing field name |
| `ToPropertyName()` | **Convert** backing field to property name |

## Unity Extensions

### Transform

| Method | Description |
|--------|-------------|
| `SetPosition(Vector3)` | **Set world position** |
| `SetLocalPosition(Vector3)` | **Set local position** |
| `SetPositionX/Y/Z(float)` | **Set world position component** |
| `SetLocalPositionX/Y/Z(float)` | **Set local position component** |
| `SetEulerAngle(Vector3)` | **Set world euler angles** |
| `SetLocalEulerAngle(Vector3)` | **Set local euler angles** |
| `SetEulerAngleX/Y/Z(float)` | **Set world euler component** |
| `SetLocalEulerAngleX/Y/Z(float)` | **Set local euler component** |
| `SetRotation(Quaternion)` | **Set world rotation** |
| `SetLocalRotation(Quaternion)` | **Set local rotation** |
| `SetRotationX/Y/Z/W(float)` | **Set world rotation component** |
| `SetLocalRotationX/Y/Z/W(float)` | **Set local rotation component** |
| `SetScale(Vector3)` | **Set scale** as Vector3 |
| `SetLocalScale(Vector3)` | **Set local scale** as Vector3 |
| `SetScale(float)` | **Set uniform scale** |
| `SetLocalScale(float)` | **Set uniform local scale** |
| `SetScaleX/Y/Z(float)` | **Set scale component** |
| `SetLocalScaleX/Y/Z(float)` | **Set local scale component** |
| `Overlaps(RectTransform)` | **Check overlap** with RectTransform |

### Vector (Vector2, Vector3, Vector4, Vector2Int, Vector3Int)

| Method | Description |
|--------|-------------|
| `WithX/Y/Z/W(value)` | **Create new vector** with modified component |
| `Clamp(min, max)` | **Clamp** vector to bounds |
| `IsInBounds(bounds)` | **Check if within** bounds |

### Color

| Method | Description |
|--------|-------------|
| `WithAlpha(float)` | **Set alpha** on Color |
| `WithAlpha(byte)` | **Set alpha** on Color32 |
| `SetColor(value)` | **Set color** on SpriteRenderer, Material, Graphic |
| `SetAlpha(value)` | **Set alpha** on SpriteRenderer, Material, Graphic |

### Quaternion

| Method | Description |
|--------|-------------|
| `WithX/Y/Z/W(float)` | **Create new quaternion** with component |
| `WithEulerAngleX/Y/Z(float)` | **Create quaternion** with euler component |

### Camera

| Method | Description |
|--------|-------------|
| `FitDiagonal(Bounds, ...)` | **Fit camera** to diagonal |
| `FitDiagonal(Rect, ...)` | **Fit camera** to rect diagonal |
| `Fit(Rect, ...)` | **Fit camera** to rect |
| `Fit(Vector3, ...)` | **Fit camera** to bounds |
| `Raycast<T>(Vector3, maxDistance?, layerMask?)` | **3D raycast** from camera |
| `Raycast2D<T>(...)` | **2D raycast** from camera |

### GameObject/Component

| Method | Description |
|--------|-------------|
| `Instantiate<T>(position?, rotation?, parent?)` | **Instantiate** with optional parameters |
| `Instantiate<T>(Transform parent, worldSpace?)` | **Instantiate** under parent |
| `DontDestroyOnLoad()` | **Prevent destruction** on scene load |
| `Destroy()` | **Destroy** GameObject |
| `DestroyImmediate()` | **Destroy immediately** |
| `GetComponentOrDefault<T>()` | **Get component** or default |
| `GetComponentOrThrow<T>()` | **Get component** or throw |
| `HasComponent<T>()` | **Check** if has component |
| `GetComponentInChildrenOrDefault<T>(includeInactive?)` | **Get in children** or default |
| `GetComponentInChildrenOrThrow<T>(includeInactive?)` | **Get in children** or throw |
| `HasComponentInChildren<T>(includeInactive?)` | **Check** if has in children |
| `TryGetComponentInChildren<T>(includeInactive?)` | **Try get** in children |
| `GetComponentInParentOrDefault<T>(includeInactive?)` | **Get in parent** or default |
| `GetComponentInParentOrThrow<T>(includeInactive?)` | **Get in parent** or throw |
| `HasComponentInParent<T>(includeInactive?)` | **Check** if has in parent |
| `TryGetComponentInParent<T>(includeInactive?)` | **Try get** in parent |
| `TryAddComponent<T>()` | **Try add** component |
| `GetComponentOrAdd<T>()` | **Get or add** component |
| `NullIfDestroyed<T>()` | **Return null** if destroyed |
| `GetPathInHierarchy()` | **Get hierarchy** path |
| `SetLayer(int)` | **Set layer** |
| `CreateSprite(Rect?, pivot?)` | **Create sprite** from Texture2D |

## Async Extensions

### Coroutine Extensions

| Method | Description |
|--------|-------------|
| `coroutine.Then(Action)` | **Chain** with action callback |
| `coroutine.Then(IEnumerator)` | **Chain** with coroutine |
| `coroutine.Then(YieldInstruction)` | **Chain** with yield instruction |
| `coroutine.Catch<TException>(Action<TException>)` | **Catch** specific exception |
| `coroutine.Catch(Action)` | **Catch** any exception |
| `coroutine.Finally(Action)` | **Finally** block |
| `task.ToCoroutine(callback?)` | **Convert Task** to coroutine |
| `asyncOp.ToCoroutine(callback?, progress?)` | **Convert AsyncOperation** to coroutine |
| `playableDirector.PlayAsync(callback?, progress?)` | **Play** as async operation |
| `coroutine.Start()` | **Start** coroutine via CoroutineRunner |
| `coroutine.Stop()` | **Stop** coroutine via CoroutineRunner |
| `coroutines.Gather()` | **Gather** multiple coroutines |
| `CoroutineRunner.Run(action, callback?)` | **Run action** as coroutine |
| `ForEachAwaitAsync` | **Async for each** with coroutine functions |
| `ForEachAsync` | **Async for each** |
| `SelectAsync` | **Async select** on IEnumerable |
| `GetOrDefaultAsync` | **Async get or default** for dictionary |
| `RemoveOrDefaultAsync` | **Async remove or default** for dictionary |
| `GetOrAddAsync` | **Async get or add** for dictionary |
| `TryAddAsync` | **Async try add** for dictionary |

**UniTask variants:** `UniTask` return type with `CancellationToken` parameter (with UNIT_UNITASK).

### UniTask Utilities

| Method | Description |
|--------|-------------|
| `CancellableTask.RunAsync(Func<CancellationToken, UniTask>)` | **Run** cancellable task |
| `CancellableTask.Cancel()` | **Cancel** running task |
| `OverridableTask.RunAsync(...)` | **Run** overridable task (cancels previous) |
| `OverridableTask.Cancel()` | **Cancel** running task |
| `QueueableTask.RunAsync(...)` | **Queue** sequential runs |
| `QueueableTask.Cancel()` | **Cancel** queue |
| `RetryableTask(maxRetries, delay, exponentialBackoff, maxDelay)` | **Create** retryable task |
| `RetryableTask.RunAsync(...)` | **Run** with retry logic |
| `RetryableTask.Cancel()` | **Cancel** retryable task |

**Coroutine variants:** `IEnumerator` return type with `Action? callback` parameter (without UNIT_UNITASK).

## Addressables Extensions

Requires UNIT_ADDRESSABLES symbol.

| Method | Description |
|--------|-------------|
| `WaitForResultOrThrow()` | **Wait for result** or throw on AsyncOperationHandle |
| `GetResultOrThrow()` | **Get result** or throw on AsyncOperationHandle |
| `ToUniTask(progress?, cancellationToken?)` | **Convert to UniTask** |

**Coroutine variant:** `ToCoroutine(callback?, progress?)` (without UNIT_UNITASK).

## Serializable Collections

| Class | Description |
|-------|-------------|
| `SerializableDictionary<TKey, TValue>` | **Dictionary** with ISerializationCallbackReceiver |
| `SerializableReadOnlyDictionary<TKey, TValue>` | **Read-only dictionary** wrapper |
| `SerializableReadOnlyList<T>` | **Read-only list** wrapper |
| `Serializable2DArray<TItem>` | **2D array** with `Width`, `Height`, `this[x, y]`, `GetColumn(x)`, `GetRow(y)` |
| `SerializableTuple<T1, T2>` | **Tuple** with ITuple and Deconstruct |
| `SerializableTuple<T1, T2, T3>` | **3-element tuple** with ITuple and Deconstruct |
| `SerializableTuple<T1, T2, T3, T4>` | **4-element tuple** with ITuple and Deconstruct |
| `TupleDisplayNamesAttribute(params string[] names)` | **Inspector labels** for tuple fields |

## Editor Attributes

| Attribute | Description |
|-----------|-------------|
| `[Layer]` | **PropertyAttribute** for layer dropdown |
| `[SortingLayer]` | **PropertyAttribute** for sorting layer dropdown |
| `[Tag]` | **PropertyAttribute** for tag dropdown |

## Utility Classes

### BetterMonoBehavior : MonoBehaviour

| Method | Description |
|--------|-------------|
| `GetComponent<T>()` | **Get component** (self) |
| `GetComponentOrDefault<T>()` | **Get component** or default (self) |
| `GetComponentOrThrow<T>()` | **Get component** or throw (self) |
| `HasComponent<T>()` | **Check** if has component (self) |
| `TryGetComponent<T>()` | **Try get** component (self) |
| `GetComponentInChildren<T>()` | **Get in children** |
| `GetComponentInChildrenOrDefault<T>()` | **Get in children** or default |
| `GetComponentInChildrenOrThrow<T>()` | **Get in children** or throw |
| `HasComponentInChildren<T>()` | **Check** if has in children |
| `TryGetComponentInChildren<T>()` | **Try get** in children |
| `GetComponentInParent<T>()` | **Get in parent** |
| `GetComponentInParentOrDefault<T>()` | **Get in parent** or default |
| `GetComponentInParentOrThrow<T>()` | **Get in parent** or throw |
| `HasComponentInParent<T>()` | **Check** if has in parent |
| `TryGetComponentInParent<T>()` | **Try get** in parent |
| `GetCancellationTokenOnDisable()` | **Get cancellation token** on disable (requires UNIT_UNITASK) |
| `StartCoroutine(...)` | **Start coroutine** (without UNIT_UNITASK) |
| `StopCoroutine(...)` | **Stop coroutine** (without UNIT_UNITASK) |
| `GatherCoroutines(...)` | **Gather** multiple coroutines (without UNIT_UNITASK) |

### Deque<T>

| Method | Description |
|--------|-------------|
| `Count` | **Number of elements** |
| `PushFront(T)` | **Add to front** |
| `PushBack(T)` | **Add to back** |
| `PopFront()` | **Remove from front** |
| `PopBack()` | **Remove from back** |
| `PeekFront()` | **Peek at front** |
| `PeekBack()` | **Peek at back** |
| `Clear()` | **Clear all elements** |

### PriorityQueue<TItem, TPriority>

| Method | Description |
|--------|-------------|
| `PriorityQueue()` | **Create** with default comparer |
| `PriorityQueue(Comparison<TPriority>)` | **Create** with comparison |
| `PriorityQueue(IComparer<TPriority>)` | **Create** with comparer |
| `Count` | **Number of elements** |
| `Enqueue(item, priority)` | **Enqueue** item with priority |
| `Dequeue()` | **Dequeue** highest priority item |
| `Peek()` | **Peek** at highest priority item |
| `Clear()` | **Clear all elements** |

### Progress : IProgress<float>

| Method | Description |
|--------|-------------|
| `Progress(Action<float>)` | **Create** with callback |
| `Report(float)` | **Report** progress value |
| `CreateSubProgresses(int count)` | **Split into sub-progresses** for parallel operations |

### Ranges

| Method | Description |
|--------|-------------|
| `Ranges.From(int).To(int)` | **Create range** from..to |
| `Ranges.From(int).Take(int)` | **Create range** from with count |
| `Ranges.To(int)` | **Create range** to exclusive |
| `Ranges.Take(int)` | **Create range** take N from start |

### Item

| Method | Description |
|--------|-------------|
| `Item.S<T>(T)` | **Identity selector** for LINQ |
| `Item.Is<T>(object)` | **Check type** matches T |
| `Item.IsNot<T>(object)` | **Check type** does not match T |
| `Item.IsTrue(bool)` | **Check** boolean is true |
| `Item.IsFalse(bool)` | **Check** boolean is false |
| `Item.IsNull<T>(T?)` | **Check** is null |
| `Item.IsNotNull<T>(T?)` | **Check** is not null |

### Operator

| Method | Description |
|--------|-------------|
| `Operator.Add` | **Addition** operator |
| `Operator.Subtract` | **Subtraction** operator |
| `Operator.Multiply` | **Multiplication** operator |
| `Operator.Divide` | **Division** operator |
| `Operator.Modulo` | **Modulo** operator |
| `Operator.And` | **Bitwise AND** operator |
| `Operator.Or` | **Bitwise OR** operator |
| `Operator.Xor` | **Bitwise XOR** operator |
| `Operator.Min` | **Minimum** operator |
| `Operator.Max` | **Maximum** operator |
| `Operator.Difference` | **Difference** operator |

**Supports:** int, long, uint, ulong, float, double, decimal, Vector2/3/4, Vector2Int/3Int

### IterTools

| Method | Description |
|--------|-------------|
| `Zip(seq1, seq2, [seq3], [func])` | **Strict zip** (same length required) |
| `ZipShortest(seq1, seq2, [seq3], [func])` | **Zip** shortest sequence |
| `ZipLongest(seq1, seq2, [seq3], [func])` | **Zip** longest sequence |
| `Product(seq1, seq2, [seq3], [func])` | **Cartesian product** of sequences |
| `Product(int, int)` | **Cartesian product** of ranges |
| `Permutations<T>(seq, [length])` | **All permutations** |
| `Combinations<T>(seq, length)` | **All combinations** of length |
| `CombinationsWithReplacement<T>(seq, length)` | **Combinations** with replacement |
| `Repeat<T>(Func<T>, count)` | **Repeat** factory N times |
| `Repeat(Action, count)` | **Repeat** action N times |

### KeyAttribute : Attribute

| Method | Description |
|--------|-------------|
| `[Key("key")]` | **Attribute** for marking keys |
| `type.GetKey()` | **Get key** from attribute or type name |
