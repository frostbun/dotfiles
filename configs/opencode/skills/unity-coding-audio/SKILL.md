---
name: unity-coding-audio
description: |
  Use this skill when implementing audio management with UniT.Audio package in Unity C# projects. This skill covers IAudioManager for sound and music playback, volume control, IAudioManagerSettings for audio configuration, and async loading. Essential when playing sound effects, managing background music, controlling volume levels, or loading audio assets.
---

# UniT.Audio API Reference

Namespace: `UniT.Audio`

## IAudioManager

### Sound Methods

| Method | Description |
|--------|-------------|
| `LoadSound(AudioClip clip)` / `LoadSound(object key)` | **Load sound** from AudioClip or by key |
| `PlaySoundOneShot(AudioClip clip)` / `PlaySoundOneShot(object key)` | **Play sound once** without tracking |
| `PlaySound(AudioClip clip, bool loop = false, bool force = false)` / `PlaySound(object key, bool loop = false, bool force = false)` | **Play sound** with optional **looping** and **force** restart |
| `PauseSound(AudioClip clip)` / `PauseSound(object key)` / `PauseAllSounds()` | **Pause sound** by clip, key, or **all sounds** |
| `ResumeSound(AudioClip clip)` / `ResumeSound(object key)` / `ResumeAllSounds()` | **Resume sound** by clip, key, or **all sounds** |
| `StopSound(AudioClip clip)` / `StopSound(object key)` / `StopAllSounds()` | **Stop sound** by clip, key, or **all sounds** |
| `UnloadSound(AudioClip clip)` / `UnloadSound(object key)` / `UnloadAllSounds()` | **Unload sound** from memory |

### Music Methods

| Method | Description |
|--------|-------------|
| `LoadMusic(AudioClip clip)` / `LoadMusic(object key)` | **Load music** from AudioClip or by key |
| `PlayMusic(AudioClip clip, bool loop = true, bool force = false)` / `PlayMusic(object key, bool loop = true, bool force = false)` | **Play music** with optional **looping** (default true) and **force** restart |
| `PauseMusic()` / `ResumeMusic()` / `StopMusic()` | **Pause**, **resume**, or **stop** current music |
| `UnloadMusic(AudioClip clip)` / `UnloadMusic(object key)` / `UnloadAllMusics()` | **Unload music** from memory |

### Music Properties

| Property | Description |
|----------|-------------|
| `object? CurrentMusic { get; }` | **Currently playing** music key |
| `float MusicTime { get; set; }` | **Playback position** in seconds |

### Async Methods

| Method | Description |
|--------|-------------|
| `LoadSoundAsync(object key, progress?, cancellationToken?)` | **Asynchronously load** sound asset |
| `LoadMusicAsync(object key, ...)` | **Asynchronously load** music asset |

## IAudioManagerSettings

### Output Change Events

| Event | Description |
|-------|-------------|
| `SoundVolumeOutputChanged` | Fires when **sound volume output** changes |
| `MuteSoundOutputChanged` | Fires when **sound mute output** changes |
| `MusicVolumeOutputChanged` | Fires when **music volume output** changes |
| `MuteMusicOutputChanged` | Fires when **music mute output** changes |

### Volume Change Events

| Event | Description |
|-------|-------------|
| `SoundVolumeChanged` | Fires when **sound volume** setting changes |
| `MuteSoundChanged` | Fires when **sound mute** setting changes |
| `MusicVolumeChanged` | Fires when **music volume** setting changes |
| `MuteMusicChanged` | Fires when **music mute** setting changes |
| `MasterVolumeChanged` | Fires when **master volume** changes |
| `MuteMasterChanged` | Fires when **master mute** changes |

### Output Properties

| Property | Description |
|----------|-------------|
| `float SoundVolumeOutput { get; }` | **Computed output** volume (sound * master) |
| `bool MuteSoundOutput { get; }` | **Computed output** mute state (sound || master) |
| `float MusicVolumeOutput { get; }` | **Computed output** volume (music * master) |
| `bool MuteMusicOutput { get; }` | **Computed output** mute state (music || master) |

### Volume Properties

| Property | Description |
|----------|-------------|
| `float SoundVolume { get; set; }` | **Sound volume** setting [0, 1] |
| `bool MuteSound { get; set; }` | **Sound mute** toggle |
| `float MusicVolume { get; set; }` | **Music volume** setting [0, 1] |
| `bool MuteMusic { get; set; }` | **Music mute** toggle |
| `float MasterVolume { get; set; }` | **Master volume** [0, 1], throws **ArgumentOutOfRangeException** if out of range |
| `bool MuteMaster { get; set; }` | **Master mute** toggle |

### Audio Source Registration Methods

| Method | Description |
|--------|-------------|
| `RegisterSound(AudioSource source)` | **Register external AudioSource** to follow volume settings |
| `UnregisterSound(AudioSource source)` | **Unregister external AudioSource** from volume settings |

## AudioManager

**Sealed class** implementing **IAudioManager** and **IAudioManagerSettings**.

| Constructor | Description |
|-------------|-------------|
| `[Preserve] public AudioManager(IAssetsManager assetsManager, ILoggerManager loggerManager)` | **Creates AudioManager** with required dependencies |

## DI Registration

| Container | Registration Method |
|-----------|---------------------|
| **VContainer** | `builder.RegisterAudioManager()` |
| **Zenject** | `Container.BindAudioManager()` |
| **Custom DI** | `container.AddAudioManager()` |

## Usage Example

```csharp
public class GameAudio
{
    private readonly IAudioManager _audio;
    
    public GameAudio(IAudioManager audio)
    {
        _audio = audio;
    }
    
    public void PlayJumpSound()
    {
        _audio.PlaySoundOneShot("JumpSound");
    }
    
    public void PlayBackgroundMusic()
    {
        _audio.PlayMusic("BackgroundMusic", loop: true);
    }
    
    public void SetVolume(float volume)
    {
        _audio.Settings.MasterVolume = volume;
    }
}
```
