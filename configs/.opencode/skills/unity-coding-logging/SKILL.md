---
name: unity-coding-logging
description: |
  Use this skill when implementing logging functionality with UniT.Logging package in Unity C# projects. This skill covers the ILogger interface, LogLevel enum, ILoggerManager registration, UnityLogger implementation, and DI integration with VContainer/Zenject. Essential when adding debug/info/warning/error logging, configuring log levels, or registering loggers via dependency injection.
---

# UniT.Logging API Reference

**Namespace:** `UniT.Logging`

## ILogger

### ILogger Properties

| Property | Description |
|----------|-------------|
| `string Name { get; }` | **Logger name** for identification |
| `LogLevel LogLevel { get; set; }` | **Current log level** filter |

### ILogger Methods (via LoggerExtensions)

| Method | Description |
|--------|-------------|
| `Debug(string message, [CallerMemberName] string context = "")` | **Log debug message** - `[Conditional("UNIT_LOGGING_DEBUG")]` |
| `Info(string message, [CallerMemberName] string context = "")` | **Log info message** - `[Conditional("UNIT_LOGGING_INFO")]` |
| `Warning(string message, [CallerMemberName] string context = "")` | **Log warning message** - `[Conditional("UNIT_LOGGING_WARNING")]` |
| `Error(string message, [CallerMemberName] string context = "")` | **Log error message** - `[Conditional("UNIT_LOGGING_ERROR")]` |
| `Critical(string message, [CallerMemberName] string context = "")` | **Log critical message** - `[Conditional("UNIT_LOGGING_CRITICAL")]` |
| `Exception(Exception exception, [CallerMemberName] string context = "")` | **Log exception** - `[Conditional("UNIT_LOGGING_EXCEPTION")]` |

All methods are **conditionally compiled** and **auto-detect caller member name**.

## LogLevel Enum

**Log level hierarchy:** `Debug(0)` < `Info(1)` < `Warning(2)` < `Error(3)` < `Critical(4)` < `Exception(5)` < `None(6)`

## ILoggerManager

### ILoggerManager Methods

| Method | Description |
|--------|-------------|
| `ILogger GetLogger(string name)` | **Get logger** by name |
| `ILogger GetLogger(Type ownerType)` | **Get logger** for type - delegates to `GetLogger(ownerType.Name)` |
| `ILogger GetLogger(object owner)` | **Get logger** for object instance - delegates to `GetLogger(owner.GetType())` |
| `ILogger GetLogger<T>()` | **Get logger** for generic type - delegates to `GetLogger(typeof(T))` |
| `ILogger GetDefaultLogger()` | **Get default logger** - delegates to `GetLogger(nameof(UniT))` |
| `IEnumerable<ILogger> GetAllLoggers()` | **Get all registered loggers** |

## Classes

| Class | Description |
|-------|-------------|
| `LoggerManager` (abstract) | **Base logger manager** - `protected LoggerManager(LogLevel logLevel)`, abstract `CreateLogger(string name, LogLevel logLevel)` |
| `UnityLogger` (sealed) | **Unity implementation** of ILogger, formats: `[LogLevel] [Name] [Context] Message` |
| `UnityLoggerManager` (sealed) | **Unity logger manager** - `[Preserve] public UnityLoggerManager(LogLevel logLevel)`, creates UnityLogger instances |

## DI Registration

| Extension | Description |
|-----------|-------------|
| `builder.RegisterLoggerManager()` | **VContainer registration** - registers with default **LogLevel.Info** |
| `Container.BindLoggerManager()` | **Zenject binding** - binds ILogger per-object via `GetLogger(ctx.ObjectType)` |
| `container.AddLoggerManager()` | **Custom DI registration** - registers with default **LogLevel.Info** |

## Conditional Symbols

**Symbols:** `UNIT_LOGGING_DEBUG`, `UNIT_LOGGING_INFO`, `UNIT_LOGGING_WARNING`, `UNIT_LOGGING_ERROR`, `UNIT_LOGGING_CRITICAL`, `UNIT_LOGGING_EXCEPTION`

Control which **log levels** are **compiled in**.

## Usage Example

```csharp
public class MyClass
{
    private readonly ILogger _logger;
    
    public MyClass(ILoggerManager loggerManager)
    {
        _logger = loggerManager.GetLogger(this);
    }
    
    public void DoWork()
    {
        _logger.Info("Starting work");
        // ... work ...
        _logger.Debug("Work completed");
    }
}
```
