---
name: unity-coding-data
description: |
  Use this skill when implementing data persistence with UniT.Data package in Unity C# projects. This skill covers IDataManager for save/load operations, CSV data types with attributes, type conversion system, serializers (JSON, MessagePack, MemoryPack), and storage providers (PlayerPrefs, Assets, External files). Essential when saving game state, loading CSV data, configuring serializers, or implementing custom storage.
---

# UniT.Data API Reference

Namespace: `UniT.Data`

## IDataManager

### Sync Methods (Batch)

| Method | Description |
|--------|-------------|
| `Load(string[] keys, Type[] types, bool cache = true)` | **Load multiple datas** by keys with explicit types |
| `Update(string[] keys, object[] datas)` | **Update multiple datas** in memory by keys |
| `Save(string[] keys)` | **Save multiple datas** to storage by keys |
| `Flush(string[] keys)` | **Flush multiple datas** to persistent storage |
| `SaveAll()` | **Save all loaded datas** to storage |
| `FlushAll()` | **Flush all datas** to persistent storage |
| `SaveAndFlush(string[] keys)` | **Save and flush** multiple datas |
| `SaveAndFlushAll()` | **Save and flush all** datas |

### Sync Methods (Explicit Key)

| Method | Description |
|--------|-------------|
| `Load(string key, Type type, bool cache = true)` | **Load data** by key with explicit type |
| `Load<T>(string key, bool cache = true)` | **Load data** by key with generic type T |
| `Update(string key, object data)` | **Update data** in memory by key |
| `Save(string key)` | **Save data** to storage by key |
| `Flush(string key)` | **Flush data** to persistent storage by key |
| `SaveAndFlush(string key)` | **Save and flush** data by key |

### Sync Methods (Implicit Key)

| Method | Description |
|--------|-------------|
| `Load(Type type, bool cache = true)` | **Load data** by implicit key (type) |
| `Load<T>(bool cache = true)` | **Load data** with generic type T |
| `Update(object data)` | **Update data** in memory |
| `Update<T>(T data)` | **Update data** in memory (generic) |
| `Save(Type)` / `Save<T>()` | **Save data** to storage |
| `Flush(Type)` / `Flush<T>()` | **Flush data** to persistent storage |
| `SaveAndFlush(Type)` / `SaveAndFlush<T>()` | **Save and flush** data |

### Async Methods

All sync methods have **async variants** with `IProgress<float>?` and `CancellationToken` parameters.

### Constructor

| Constructor | Description |
|-------------|-------------|
| `[Preserve] DataManager(IEnumerable<ISerializer> serializers, IEnumerable<IDataStorage> storages, ILoggerManager loggerManager)` | **Create data manager** with serializers, storages, and logger |

## Data Interfaces

| Interface | Description |
|-----------|-------------|
| `IWritableData` | **Marker interface** for data that can be written to storage |

## CSV Data Types (when UNIT_CSV)

| Type | Description |
|------|-------------|
| `ICsvData` | **CSV data interface** with `RowType`, `Add()`, and `GetValues()` |
| `CsvData<T>` | **List-based** CSV data implementing `ICsvData` and `IReadOnlyList<T>` |
| `CsvData<TKey, TValue>` | **Dictionary-based** CSV data with `this[key]`, `ContainsKey`, `TryGetValue` |

## CSV Attributes (when UNIT_CSV)

| Attribute | Description |
|-----------|-------------|
| `[CsvRow(string prefix, string? key = null)]` | **Mark class** as CSV row with prefix |
| `[CsvColumn(string name, bool ignorePrefix = false)]` | **Map field** to CSV column |
| `[CsvIgnore]` | **Exclude field** from serialization |
| `[CsvOptional]` | **Mark column** as optional (may not exist in CSV) |

## Type Conversion (UniT.Data.Conversion)

### IConverterManager

| Method | Description |
|--------|-------------|
| `GetConverter(Type type)` | **Get converter** for specific type |
| `GetDefaultValue(Type type)` / `GetDefaultValue<T>()` | **Get default value** for type |
| `ConvertFromString(string str, Type type)` / `ConvertFromString<T>(string str)` | **Convert string** to object |
| `ConvertToString(object obj, Type type)` / `ConvertToString<T>(T obj)` | **Convert object** to string |

### IConverter

| Method | Description |
|--------|-------------|
| `Manager { set; }` | **Converter manager** property |
| `CanConvert(Type type)` | **Check if** can convert type |
| `GetDefaultValue(Type type)` | **Get default value** for type |
| `ConvertFromString(string str, Type type)` | **Convert string** to object |
| `ConvertToString(object obj, Type type)` | **Convert object** to string |

### Abstract Bases

| Class | Description |
|-------|-------------|
| `Converter` | **Base converter** class |
| `Converter<T>` | **Generic converter** with sealed `CanConvert` for exact type match |

### SeparatorConfig

| Property | Default | Description |
|----------|---------|-------------|
| `CollectionSeparator` | `";"` | **Separator** for collection items |
| `KeyValueSeparator` | `":"` | **Separator** for key-value pairs |
| `TupleSeparator` | `"\|"` | **Separator** for tuple elements |

### Built-in Converters

| Category | Types |
|----------|-------|
| **Numbers** | byte, short, int, long, ushort, uint, ulong, float, double, decimal (all take **IFormatProvider**) |
| **Basic** | bool, char, string, Guid, Uri, Enum (all types), Nullable<T> |
| **Time** | DateTime, DateTimeOffset (with **IFormatProvider**), TimeSpan |
| **Collections** | Array, List<T>, ReadOnlyCollection<T>, HashSet<T>, Stack<T>, Queue<T>, Dictionary<K,V>, ReadOnlyDictionary<K,V> |
| **Abstract collections** | ICollection<T>, IList<T>, IReadOnlyCollection<T>, IReadOnlyList<T>, IDictionary<K,V>, IReadOnlyDictionary<K,V> |
| **Tuples** | all ITuple types, Vector2/3/4, Vector2Int/3Int, Color, Color32 |
| **JSON** | object (when **UNIT_JSON**, takes **JsonSerializerSettings**) |

## Serialization (UniT.Data.Serialization)

### ISerializer

| Member | Description |
|--------|-------------|
| `RawDataType { get; }` | **Type of raw data** (string, byte[], etc.) |
| `CanSerialize(Type type)` | **Check if** can serialize type |
| `Deserialize(Type type, object rawData)` | **Deserialize** raw data to object |
| `Serialize(object data)` | **Serialize** object to raw data |
| **Async variants** | **Async versions** with UniTask or IEnumerator |

### Abstract Base

| Class | Description |
|-------|-------------|
| `Serializer<TRawData, TData>` | **Abstract base** with virtual async implementations |

### Implementations

| Serializer | Inheritance | Constructor | When |
|------------|-------------|-------------|------|
| `JsonSerializer` | `Serializer<string, object>` | `[Preserve] (JsonSerializerSettings)` | **UNIT_JSON** |
| `CsvSerializer` | `Serializer<string, ICsvData>` | `[Preserve] (IConverterManager, CsvConfiguration)` | **UNIT_CSV** |
| `MessagePackSerializer` | `Serializer<byte[], object>` | `[Preserve] (MessagePackSerializerOptions)` | **UNIT_MESSAGEPACK** |
| `MemoryPackSerializer` | `Serializer<byte[], object>` | `[Preserve] (MemoryPackSerializerOptions)` | **UNIT_MEMORYPACK** |
| `UnityObjectSerializer` | `Serializer<Object, Object>` | `[Preserve] ()` | Always |
| `DefaultJsonSerializerSettings.Value` | static readonly | - | **UNIT_JSON** |

## Storage (UniT.Data.Storage)

### IDataStorage

| Member | Description |
|--------|-------------|
| `RawDataType { get; }` | **Type of raw data** stored |
| `CanStore(Type type)` | **Check if** can store type |
| `Read(string key)` | **Read data** by key (async variants available) |

### IWritableDataStorage (extends IDataStorage)

| Method | Description |
|--------|-------------|
| `Write(string key, object value)` | **Write data** to storage (async variants available) |
| `Flush()` | **Flush** to persistent storage (async variants available) |

### Abstract Hierarchy

| Class | Description |
|-------|-------------|
| `DataStorage<TRawData>` | **Base storage** class, `CanStore` defaults to **non-IWritableData** types |
| `EditorWritableDataStorage<TRawData>` | **Writable in editor** only |
| `WritableDataStorage<TRawData>` | **Writable storage** for **IWritableData** types only |

### Implementations

| Storage | Inheritance | Constructor |
|---------|-------------|-------------|
| `PlayerPrefsDataStorage` | `WritableDataStorage<string>` | `[Preserve] ()` |
| `AssetTextDataStorage` | `EditorWritableDataStorage<string>` | `[Preserve] (IAssetsManager)` |
| `AssetBinaryDataStorage` | `EditorWritableDataStorage<byte[]>` | `[Preserve] (IAssetsManager)` |
| `AssetBlobDataStorage` | `EditorWritableDataStorage<Object>` | `[Preserve] (IAssetsManager)` |
| `ExternalTextDataStorage` | `DataStorage<string>` | `[Preserve] (IExternalFileVersionManager, AssetTextDataStorage, ILoggerManager)` |
| `ExternalBinaryDataStorage` | `DataStorage<byte[]>` | `[Preserve] (IExternalFileVersionManager, AssetBinaryDataStorage, ILoggerManager)` |

### External File Versioning

| Interface/Class | Description |
|-----------------|-------------|
| `IExternalFileVersionManager` | **Get file path** by name (`GetFilePath`, async variant) |
| `IExternalFileVersionManagerConfig` | **Configuration** with `FetchVersionAsync` and `DownloadFileAsync` |
| `ExternalFileVersionManager` | `[Preserve] (IExternalFileVersionManagerConfig, ILoggerManager)` |

## DI Registration

| DI Container | Registration Methods |
|--------------|----------------------|
| **VContainer** | `builder.RegisterDataManager()` / `builder.RegisterExternalDataStorages()` |
| **Zenject** | `container.BindDataManager()` / `container.BindExternalDataStorages()` |
| **Custom DI** | `container.AddDataManager()` / `container.AddExternalDataStorages()` |

## Usage Example

```csharp
public class GameData : IWritableData
{
    public int Level { get; set; }
    public int Score { get; set; }
}

public class GameManager
{
    private readonly IDataManager _dataManager;
    
    public GameManager(IDataManager dataManager)
    {
        _dataManager = dataManager;
    }
    
    public void SaveGame()
    {
        var data = new GameData { Level = 5, Score = 1000 };
        _dataManager.Update(data);
        _dataManager.SaveAndFlush<GameData>();
    }
}
```
