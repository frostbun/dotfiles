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
| `ShuffleInPlace<T>()` | **In-place shuffle** of list elements |

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

### Deque<T> Extensions

| Method | Description |
|--------|-------------|
| `ToDeque<T>()` | **Convert to Deque** |
| `PeekFrontOrDefault<T>()` | **Peek front** or return default(T) |
| `PeekFrontOrDefault<T>(T default)` | **Peek front** or return specified default |
| `PeekFrontOrDefault<T>(Func<T>)` | **Peek front** or invoke factory |
| `PeekBackOrDefault<T>()` | **Peek back** or return default(T) |
| `PeekBackOrDefault<T>(T default)` | **Peek back** or return specified default |
| `PeekBackOrDefault<T>(Func<T>)` | **Peek back** or invoke factory |
| `PopFrontOrDefault<T>()` | **Pop front** or return default(T) |
| `PopFrontOrDefault<T>(T default)` | **Pop front** or return specified default |
| `PopFrontOrDefault<T>(Func<T>)` | **Pop front** or invoke factory |
| `PopBackOrDefault<T>()` | **Pop back** or return default(T) |
| `PopBackOrDefault<T>(T default)` | **Pop back** or return specified default |
| `PopBackOrDefault<T>(Func<T>)` | **Pop back** or invoke factory |
| `Clear<T>(Action<T>)` | **Clear with callback** on each item |

### Conversion Methods

| Method | Description |
|--------|-------------|
| `ToStack<T>()` | **Convert to Stack** |
| `ToQueue<T>()` | **Convert to Queue** |
| `ToDeque<T>()` | **Convert to Deque** |
| `AsReadOnly<T>()` | **Create read-only view** of array |
| `To2DArray<T>()` | **Convert to 2D array** |
| `ToJaggedArray<T>()` | **Convert to jagged array** |
| `ToReadOnlyCollection<T>()` | **Convert to read-only collection** |

## Enumerator Extensions

### IEnumerator Extensions

| Method | Description |
|--------|-------------|
| `TryGetNext(out object)` | **Try MoveNext** and return current value |
| `TryGetNext<T>(out T)` | **Try MoveNext** and return typed current value |

## Dictionary Extensions

### IDictionary<TKey, TValue> Extensions

| Method | Description |
|--------|-------------|
| `GetOrDefault(key)` | **Get value** or return default |
| `GetOrDefault(key, default)` | **Get value** or return specified default |
| `GetOrDefault(key, Func<TValue>)` | **Get value** or invoke factory |
| `GetOrDefault(key, Func<TKey, TValue>)` | **Get value** or invoke factory with key |
| `GetOrDefault(key, Func<TState, TValue>, state)` | **Get value** or invoke factory with state |
| `RemoveOrDefault(key)` | **Remove and return** or default |
| `RemoveOrDefault(key, default)` | **Remove and return** or specified default |
| `RemoveOrDefault(key, Func<TValue>)` | **Remove and return** or invoke factory |
| `RemoveOrDefault(key, Func<TKey, TValue>)` | **Remove and return** or invoke factory with key |
| `RemoveOrDefault(key, Func<TState, TValue>, state)` | **Remove and return** or invoke factory with state |
| `GetOrAdd(key, Func<TValue>)` | **Get or add** using factory |
| `GetOrAdd(key, Func<TKey, TValue>)` | **Get or add** using factory with key |
| `GetOrAdd(key, Func<TState, TValue>, state)` | **Get or add** using factory with state |
| `GetOrAdd(key)` | **Get or add** where TValue : new() |
| `TryAdd(key, Func<TValue>)` | **Try add** using factory |
| `TryAdd(key, Func<TKey, TValue>)` | **Try add** using factory with key |
| `TryAdd(key, Func<TState, TValue>, state)` | **Try add** using factory with state |
| `TryAdd(key)` | **Try add** where TValue : new() |
| `RemoveRange(IEnumerable<TKey>)` | **Remove multiple keys** |
| `RemoveWhere(Func<TKey, TValue, bool>)` | **Remove by predicate**, returns count |
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
| `Where(Func<TKey, TValue, TState, bool>, state)` | **Filter** by key-value predicate with state |
| `WhereKey(Func<TKey, bool>)` | **Filter** by key only |
| `WhereKey(Func<TKey, TState, bool>, state)` | **Filter** by key with state |
| `WhereValue(Func<TValue, bool>)` | **Filter** by value only |
| `WhereValue(Func<TValue, TState, bool>, state)` | **Filter** by value with state |
| `Select(Func<TKey, TValue, TResult>)` | **Project** key-value to result |
| `Select(Func<TKey, TValue, TState, TResult>, state)` | **Project** with state |
| `SelectKeys()` | **Select** keys only |
| `SelectValues()` | **Select** values only |
| `SelectMany(...)` | **SelectMany** on dictionary |
| `Aggregate(seed, Func<acc, TKey, TValue, acc>)` | **Aggregate** with key-value selector |
| `Min(Func<TKey, TValue, TResult>)` | **Minimum** by key-value projection |
| `Max(Func<TKey, TValue, TResult>)` | **Maximum** by key-value projection |
| `MinBy(...)` | **Minimum by** with optional IComparer |
| `MinByKey(...)` | **Minimum by key** with optional IComparer and key projection |
| `MinByValue(...)` | **Minimum by value** with optional IComparer and key projection |
| `MaxBy(...)` | **Maximum by** with optional IComparer |
| `MaxByKey(...)` | **Maximum by key** with optional IComparer and key projection |
| `MaxByValue(...)` | **Maximum by value** with optional IComparer and key projection |
| `Any(Func<TKey, TValue, bool>)` | **Any** matches key-value predicate |
| `All(Func<TKey, TValue, bool>)` | **All** match key-value predicate |
| `ForEach(Action<TKey, TValue>)` | **Iterate** with key-value action |
| `ForEach(Action<TKey, TValue, TState>, state)` | **Iterate** with key-value action and state |
| `ForEach(Action<TValue>)` | **Iterate** values only |
| `ForEach(Action<TValue, TState>, state)` | **Iterate** values with state |
| `SafeForEach(Action<TKey, TValue>)` | **Safe iteration** (materializes first) |
| `SafeForEach(Action<TKey, TValue, TState>, state)` | **Safe iteration** with state |
| `SafeForEach(Action<TValue>)` | **Safe iteration** values only |
| `SafeForEach(Action<TValue, TState>, state)` | **Safe iteration** values with state |
| `GroupBy(...)` | **Group** by key-value projection |
| `GroupByKey(...)` | **Group by key** with optional key projection |
| `GroupByValue(...)` | **Group by value** with optional key projection |
| `OrderBy(...)` | **Order** by key-value projection |
| `OrderByKey(...)` | **Order by key** with optional key projection |
| `OrderByValue(...)` | **Order by value** with optional key projection |
| `ThenBy(...)` | **Then by** key-value projection |
| `ThenByKey(...)` | **Then by key** with optional key projection |
| `ThenByValue(...)` | **Then by value** with optional key projection |
| `OrderByDescending(...)` | **Order descending** by key-value projection |
| `OrderByDescendingKey(...)` | **Order descending by key** with optional key projection |
| `OrderByDescendingValue(...)` | **Order descending by value** with optional key projection |
| `ThenByDescending(...)` | **Then by descending** |
| `ThenByDescendingKey(...)` | **Then by descending key** with optional key projection |
| `ThenByDescendingValue(...)` | **Then by descending value** with optional key projection |
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
| `Except(T item, IEqualityComparer?)` | **Exclude** single item with optional comparer |
| `Prepend(IEnumerable<T>)` | **Prepend** sequences |
| `Append(IEnumerable<T>)` | **Append** sequences |
| `Flat()` | **Flatten** nested enumerables |
| `Where(Func<T, TState, bool>, state)` | **Filter** with state parameter |
| `Select(Func<T, TState, TResult>, state)` | **Project** with state parameter |
| `ForEach(Action<T>)` | **Iterate** with action |
| `ForEach(Action<T, TState>, state)` | **Iterate** with action and state |
| `SafeForEach(Action<T>)` | **Safe iteration** (materializes first) |
| `SafeForEach(Action<T, TState>, state)` | **Safe iteration** with state |
| `FirstIndex(predicate)` | **First index** matching predicate |
| `LastIndex(predicate)` | **Last index** matching predicate |
| `SingleIndex(predicate)` | **Single index** matching predicate |
| `FirstIndexOrDefault(predicate)` | **First index or default** |
| `LastIndexOrDefault(predicate)` | **Last index or default** |
| `SingleIndexOrDefault(predicate)` | **Single index or default** |
| `FirstIndexOf(T, IEqualityComparer?)` | **First index of** item |
| `LastIndexOf(T, IEqualityComparer?)` | **Last index of** item |
| `SingleIndexOf(T, IEqualityComparer?)` | **Single index of** item |
| `FirstIndexOrDefaultOf(T, IEqualityComparer?)` | **First index of or default** |
| `LastIndexOrDefaultOf(T, IEqualityComparer?)` | **Last index of or default** |
| `SingleIndexOrDefaultOf(T, IEqualityComparer?)` | **Single index of or default** |
| `ContainsAll(IEnumerable<T>)` | **Contains all** items |
| `Shuffle()` | **Random shuffle** |
| `ShuffleInPlace()` | **In-place shuffle** on IList<T> |
| `Sample(int count)` | **Sample** N random elements |
| `Sample(count, IEnumerable<int> weights)` | **Weighted sample** with int weights |
| `Sample(count, IEnumerable<float> weights)` | **Weighted sample** with float weights |
| `Random()` | **Random element** |
| `RandomOrDefault()` | **Random element or default** |
| `RandomOrDefault(T default)` | **Random element** or specified default |
| `RandomOrDefault(Func<T>)` | **Random element** or invoke factory |
| `Random(IEnumerable<int> weights)` | **Weighted random** with int weights |
| `Random(IEnumerable<float> weights)` | **Weighted random** with float weights |
| `Enumerate(int start = 0)` | **Enumerate** with index, returns `(int Index, T Value)` |
| `Each(int step)` | **Take every Nth** element |
| `Repeat(int count)` | **Repeat** item N times (extension on T) |
| `Pairwise()` | **Adjacent pairs**, returns `(T, T)` |
| `Accumulate(Func<T, T, T>)` | **Cumulative** fold |
| `Accumulate(seed, Func<acc, T, acc>)` | **Cumulative** fold with seed |
| `ChunkBy(int size)` | **Chunk** into groups of size |
| `Cycle()` | **Infinite cycle** |
| `Split(predicate)` | **Partition** into `(List<T> Matches, List<T> Mismatches)` |
| `ToReadOnlyCollection()` | **Convert** to ReadOnlyCollection |
| `ToCollectionIfNeeded()` | **Materialize** only if not already collection |

### Tuple Extensions (IEnumerable<(T1, T2)> and IEnumerable<(T1, T2, T3)>)

All methods below exist for both 2-tuple and 3-tuple variants.

| Method | Description |
|--------|-------------|
| `First(predicate)` | **First** matching tuple predicate |
| `FirstOrDefault(predicate)` | **First or default** matching tuple predicate |
| `Last(predicate)` | **Last** matching tuple predicate |
| `LastOrDefault(predicate)` | **Last or default** matching tuple predicate |
| `Single(predicate)` | **Single** matching tuple predicate |
| `SingleOrDefault(predicate)` | **Single or default** matching tuple predicate |
| `Where(predicate)` | **Filter** tuple elements |
| `Where(predicate, state)` | **Filter** tuple elements with state |
| `WhereFirst(Func<T1, bool>)` | **Filter** by first element |
| `WhereFirst(Func<T1, TState, bool>, state)` | **Filter** by first with state |
| `WhereSecond(Func<T2, bool>)` | **Filter** by second element |
| `WhereSecond(Func<T2, TState, bool>, state)` | **Filter** by second with state |
| `WhereThird(Func<T3, bool>)` | **Filter** by third element (3-tuple only) |
| `WhereThird(Func<T3, TState, bool>, state)` | **Filter** by third with state (3-tuple only) |
| `Select(selector)` | **Project** tuple elements |
| `Select(selector, state)` | **Project** tuple elements with state |
| `SelectFirsts()` | **Select** first elements |
| `SelectSeconds()` | **Select** second elements |
| `SelectThirds()` | **Select** third elements (3-tuple only) |
| `SelectMany(selector)` | **SelectMany** on tuples |
| `Aggregate(...)` | **Aggregate** on tuples |
| `Min(...)` | **Minimum** on tuples |
| `Max(...)` | **Maximum** on tuples |
| `MinBy(...)` | **Minimum by** on tuples |
| `MinByFirst(...)` | **Minimum by first** with optional key projection |
| `MinBySecond(...)` | **Minimum by second** with optional key projection |
| `MinByThird(...)` | **Minimum by third** with optional key projection (3-tuple only) |
| `MaxBy(...)` | **Maximum by** on tuples |
| `MaxByFirst(...)` | **Maximum by first** with optional key projection |
| `MaxBySecond(...)` | **Maximum by second** with optional key projection |
| `MaxByThird(...)` | **Maximum by third** with optional key projection (3-tuple only) |
| `Any(predicate)` | **Any** on tuples |
| `All(predicate)` | **All** on tuples |
| `ForEach(action)` | **Iterate** tuples |
| `ForEach(action, state)` | **Iterate** tuples with state |
| `SafeForEach(action)` | **Safe iteration** on tuples |
| `SafeForEach(action, state)` | **Safe iteration** with state |
| `GroupBy(...)` | **Group** on tuples |
| `GroupByFirst(...)` | **Group by first** with optional key projection |
| `GroupBySecond(...)` | **Group by second** with optional key projection |
| `GroupByThird(...)` | **Group by third** with optional key projection (3-tuple only) |
| `OrderBy(...)` | **Order** on tuples |
| `OrderByFirst(...)` | **Order by first** with optional key projection |
| `OrderBySecond(...)` | **Order by second** with optional key projection |
| `OrderByThird(...)` | **Order by third** with optional key projection (3-tuple only) |
| `OrderByDescending(...)` | **Order descending** on tuples |
| `OrderByDescendingFirst(...)` | **Order descending by first** with optional key projection |
| `OrderByDescendingSecond(...)` | **Order descending by second** with optional key projection |
| `OrderByDescendingThird(...)` | **Order descending by third** with optional key projection (3-tuple only) |
| `ThenBy(...)` | **Then by** on tuples |
| `ThenByFirst(...)` | **Then by first** with optional key projection |
| `ThenBySecond(...)` | **Then by second** with optional key projection |
| `ThenByThird(...)` | **Then by third** with optional key projection (3-tuple only) |
| `ThenByDescending(...)` | **Then by descending** on tuples |
| `ThenByDescendingFirst(...)` | **Then by descending first** with optional key projection |
| `ThenByDescendingSecond(...)` | **Then by descending second** with optional key projection |
| `ThenByDescendingThird(...)` | **Then by descending third** with optional key projection (3-tuple only) |
| `Unzip()` | **Split tuple** into separate sequences |
| `Split(predicate)` | **Partition** tuples |
| `ToDictionary()` | **Convert (T1, T2) to Dictionary** |
| `ToDictionary(keySelector)` | **Convert to Dictionary** with key selector |
| `ToDictionary(keySelector, valueSelector)` | **Convert to Dictionary** with key and value selectors |

### Group Extensions (IEnumerable<IGrouping<TKey, T>>)

| Method | Description |
|--------|-------------|
| `MinByKey(...)` | **Minimum by key** with optional key projection |
| `MaxByKey(...)` | **Maximum by key** with optional key projection |
| `OrderByKey(...)` | **Order by key** with optional key projection |
| `OrderByDescendingKey(...)` | **Order descending by key** with optional key projection |
| `ThenByKey(...)` | **Then by key** with optional key projection |
| `ThenByDescendingKey(...)` | **Then by descending key** with optional key projection |

### Parallel Enumerable Extensions

| Method | Description |
|--------|-------------|
| `ParallelForEach(Action<T>)` | **Parallel iteration** |
| `SafeParallelForEach(Action<T>)` | **Safe parallel iteration** |

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
| `GetDerivedTypes()` | **Get derived types** across non-dynamic assemblies |
| `GetDerivedTypes(Assembly)` | **Get derived types** from specific assembly |
| `IsAssignableTo(Type)` | **Check assignability** to type |
| `CopyTo(object)` | **Copy fields/properties** to object |
| `IsBackingField()` | **Check** if FieldInfo is backing field |
| `IsBackingFieldName()` | **Check** if string is backing field name |
| `ToBackingFieldName()` | **Convert** property name to backing field name |
| `ToPropertyName()` | **Convert** backing field name to property name |
| `ToBackingFieldInfo()` | **Convert** PropertyInfo to backing FieldInfo |
| `ToPropertyInfo()` | **Convert** backing FieldInfo to PropertyInfo |

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
| `Fit(Vector3 center, Vector2 size, ...)` | **Fit camera** to center with 2D size |
| `Fit(Vector3 center, float size, ...)` | **Fit camera** to center with size |

### GameObject/Component

| Method | Description |
|--------|-------------|
| `Instantiate<T>()` | **Instantiate** Object copy |
| `Instantiate(position?, rotation?, parent?)` | **Instantiate** GameObject with optional parameters |
| `Instantiate(Transform parent, worldSpace?)` | **Instantiate** under parent |
| `Instantiate<T>(position?, rotation?, parent?)` | **Instantiate** Component with optional parameters |
| `Instantiate<T>(Transform parent, worldSpace?)` | **Instantiate** Component under parent |
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

### UniTask Extensions

| Method | Description |
|--------|-------------|
| `ForEachAwaitAsync(action)` | **Sequential async for each** |
| `ForEachAwaitAsync(action, state)` | **Sequential async for each** with state |
| `ForEachAsync(action)` | **Parallel async for each** |
| `ForEachAsync(action, state)` | **Parallel async for each** with state |
| `SafeForEachAwaitAsync(action)` | **Safe sequential async for each** |
| `SafeForEachAwaitAsync(action, state)` | **Safe sequential async for each** with state |
| `SafeForEachAsync(action)` | **Safe parallel async for each** |
| `SafeForEachAsync(action, state)` | **Safe parallel async for each** with state |
| `SelectAsync(selector)` | **Async select** on IEnumerable |
| `ForEachAwaitAsync(action, progress, ct)` | **Sequential async** with progress and cancellation |
| `ForEachAsync(action, progress, ct)` | **Parallel async** with progress and cancellation |
| `SelectAsync(selector, progress, ct)` | **Async select** with progress and cancellation |
| `ToArrayAsync()` | **Convert** UniTask<IEnumerable<T>> or IEnumerable<UniTask<T>> to array |
| `ToListAsync()` | **Convert** UniTask<IEnumerable<T>> or IEnumerable<UniTask<T>> to list |

### UniTask Tuple Extensions

| Method | Description |
|--------|-------------|
| `ForEachAwaitAsync(action)` | **Sequential async** on 2/3-tuples |
| `ForEachAwaitAsync(action, state)` | **Sequential async** on 2/3-tuples with state |
| `ForEachAsync(action)` | **Parallel async** on 2/3-tuples |
| `ForEachAsync(action, state)` | **Parallel async** on 2/3-tuples with state |
| `SelectAsync(selector)` | **Async select** on 2/3-tuples |
| `ContinueWith(Func<T1, T2, UniTask>)` | **Continue** UniTask with tuple action |
| `ContinueWith(Action<T1, T2>)` | **Continue** UniTask with tuple action (sync) |
| `ContinueWith(Func<T1, T2, UniTask<TResult>>)` | **Continue** UniTask with tuple func |
| `ContinueWith(Func<T1, T2, TResult>)` | **Continue** UniTask with tuple func (sync) |

All ContinueWith variants exist for both 2-tuple and 3-tuple.

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
| `SerializableReadOnlyDictionary<TKey, TValue>` | **Read-only dictionary** wrapper (IReadOnlyDictionary) |
| `SerializableReadOnlyList<T>` | **Read-only list** wrapper (IReadOnlyList) |
| `Serializable2DArray<TItem>` | **2D array** implementing IEnumerable<TItem> with `Width`, `Height`, `this[x, y]`, `GetColumn(x)`, `GetRow(y)` |
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

### Deque<T> : ICollection<T>, IReadOnlyCollection<T>

| Method | Description |
|--------|-------------|
| `Deque()` | **Create** with default capacity |
| `Deque(int capacity)` | **Create** with specified capacity |
| `Deque(IEnumerable<T>)` | **Create** from enumerable |
| `Count` | **Number of elements** |
| `PushFront(T)` | **Add to front** |
| `PushBack(T)` | **Add to back** |
| `PopFront()` | **Remove from front** |
| `PopBack()` | **Remove from back** |
| `PeekFront()` | **Peek at front** |
| `PeekBack()` | **Peek at back** |
| `Clear()` | **Clear all elements** |
| `Contains(T)` | **Check** if contains item |
| `GetEnumerator()` | **Enumerate** elements front to back |

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

Returns `RangeEnumerable : IEnumerable<int>` with struct-based `RangeEnumerator`.

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
| `[Key("key")]` | **Attribute** for marking keys on classes/interfaces |
| `type.GetKey()` | **Get key** from attribute or type name (cached) |
