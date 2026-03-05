---
name: unity-coding-easings
description: |
  Use this skill when implementing animations with easing functions in Unity C# projects using the UniT.Easings package. This skill covers 31 easing functions (Linear, Sine, Quad, Cubic, Quart, Quint, Expo, Circ, Back, Elastic, Bounce), the Easing.Apply method for custom animations, Transform extension methods for Move/Rotate/Scale, and Color/Text/Slider/Renderer extensions. Essential when animating UI elements, transforms, or any interpolated values with smooth easing.
---

# UniT.Easings API Reference

Namespace: `UniT.Easings`

## Easing Functions

All easing functions follow the signature: `float Function(float x)` where x is in range [0, 1].

### Available Functions

**Linear:**
- `Linear` - **Constant speed**

**Sine:**
- `InSine` - **Slow start, accelerates**
- `OutSine` - **Fast start, decelerates**
- `InOutSine` - **Slow start and end**

**Quad (Quadratic):**
- `InQuad` - **Quadratic ease in**
- `OutQuad` - **Quadratic ease out** (Default)
- `InOutQuad` - **Quadratic ease in-out**

**Cubic:**
- `InCubic` - **Cubic ease in**
- `OutCubic` - **Cubic ease out**
- `InOutCubic` - **Cubic ease in-out**

**Quart (Quartic):**
- `InQuart` - **Quartic ease in**
- `OutQuart` - **Quartic ease out**
- `InOutQuart` - **Quartic ease in-out**

**Quint (Quintic):**
- `InQuint` - **Quintic ease in**
- `OutQuint` - **Quintic ease out**
- `InOutQuint` - **Quintic ease in-out**

**Expo (Exponential):**
- `InExpo` - **Exponential ease in**
- `OutExpo` - **Exponential ease out**
- `InOutExpo` - **Exponential ease in-out**

**Circ (Circular):**
- `InCirc` - **Circular ease in**
- `OutCirc` - **Circular ease out**
- `InOutCirc` - **Circular ease in-out**

**Back:**
- `InBack` - **Back ease in** (overshoots start)
- `OutBack` - **Back ease out** (overshoots end)
- `InOutBack` - **Back ease in-out**

**Elastic:**
- `InElastic` - **Elastic ease in** (spring-like)
- `OutElastic` - **Elastic ease out**
- `InOutElastic` - **Elastic ease in-out**

**Bounce:**
- `InBounce` - **Bounce ease in**
- `OutBounce` - **Bounce ease out**
- `InOutBounce` - **Bounce ease in-out**

### Configuration
- `Easing.DefaultFunction { get; set; }` - Default easing function (default: `OutQuad`)

## Timer Functions

Namespace: `UniT.Easings`

Timer functions provide delta time for animation updates:
- `Easing.DeltaTime` - **`Time.deltaTime`**
- `Easing.UnscaledDeltaTime` - **`Time.unscaledDeltaTime`**
- `Easing.FixedDeltaTime` - **`Time.fixedDeltaTime`**
- `Easing.FixedUnscaledDeltaTime` - **`Time.fixedUnscaledDeltaTime`**
- `Easing.DefaultTimer { get; set; }` - Default timer function (default: `DeltaTime`)

## Timing

Namespace: `UniT.Easings`

Controls when animations update:
- `Easing.Timing.Update` - **Update every frame** (default)
- `Easing.Timing.LateUpdate` - **Update at end of frame**
- `Easing.Timing.FixedUpdate` - **Update with physics** (fixed timestep)

Applied via optional parameter: `Timing timing = Timing.Update`

## Easing.Apply Methods

- `UniTask Apply(Action<float> action, float duration, Function? easing = null, Timer? timer = null, Timing timing = Timing.Update, CancellationToken cancellationToken = default)` - **Apply easing over duration**
- `UniTask Apply(Action<float> action, float begin, float end, float duration, ...)` - **Float interpolation**
- `UniTask Apply(Action<int> action, int begin, int end, float duration, ...)` - **Integer interpolation**
- `UniTask Apply(Action<Vector3> action, Vector3 begin, Vector3 end, float duration, ...)` - **Vector3 interpolation**
- `UniTask Apply(Action<Color> action, Color begin, Color end, float duration, ...)` - **Color interpolation**

## Transform Extensions

### Move
- `MoveAsync(begin, end, duration, ...)` - **World position**
- `MoveXAsync(begin, end, duration, ...)` / `MoveYAsync` / `MoveZAsync` - **Single axis**
- `MoveAsync(end, duration, ...)` - **From current position**
- `MoveXAsync(end, duration, ...)` / `MoveYAsync` / `MoveZAsync` - **Single axis from current**
- `ResetPositionAsync(duration, ...)` - **To Vector3.zero**

### LocalMove
- `LocalMoveAsync(begin, end, duration, ...)` - **Local position**
- `LocalMoveXAsync(begin, end, duration, ...)` / `LocalMoveYAsync` / `LocalMoveZAsync` - **Single axis**
- `LocalMoveAsync(end, duration, ...)` - **From current local position**
- `LocalMoveXAsync(end, duration, ...)` / `LocalMoveYAsync` / `LocalMoveZAsync` - **Single axis from current**
- `ResetLocalPositionAsync(duration, ...)` - **To Vector3.zero**

### Rotate (Euler Angles)
- `RotateAsync(begin, end, duration, normalize = true, ...)` - **World rotation**
- `RotateXAsync(begin, end, duration, normalize = true, ...)` / `RotateYAsync` / `RotateZAsync` - **Single axis**
- `RotateAsync(end, duration, normalize = true, ...)` - **From current rotation**
- `RotateXAsync(end, duration, normalize = true, ...)` / `RotateYAsync` / `RotateZAsync` - **Single axis from current**
- `RotateAsync(begin, end, duration, ...)` - **Quaternion version**
- `RotateAsync(end, duration, ...)` - **Quaternion from current**
- `ResetRotationAsync(duration, normalize = true, ...)` - **To Vector3.zero**

### LocalRotate
- `LocalRotateAsync(begin, end, duration, normalize = true, ...)` - **Local rotation**
- `LocalRotateXAsync(begin, end, duration, normalize = true, ...)` / `LocalRotateYAsync` / `LocalRotateZAsync` - **Single axis**
- `LocalRotateAsync(end, duration, normalize = true, ...)` - **From current local rotation**
- `LocalRotateXAsync(end, duration, normalize = true, ...)` / `LocalRotateYAsync` / `LocalRotateZAsync` - **Single axis from current**
- `LocalRotateAsync(begin, end, duration, ...)` - **Quaternion version**
- `LocalRotateAsync(end, duration, ...)` - **Quaternion from current**
- `ResetLocalRotationAsync(duration, normalize = true, ...)` - **To Vector3.zero**

### Scale (World)
- `ScaleAsync(begin, end, duration, ...)` - **Vector3 scale**
- `ScaleXAsync(begin, end, duration, ...)` / `ScaleYAsync` / `ScaleZAsync` - **Single axis**
- `ScaleAsync(end, duration, ...)` - **From current world scale**
- `ScaleAsync(begin, end, duration, ...)` - **Float (uniform) scale**
- `ScaleAsync(end, duration, ...)` - **Float from current**

### LocalScale
- `LocalScaleAsync(begin, end, duration, ...)` - **Vector3 local scale**
- `LocalScaleXAsync(begin, end, duration, ...)` / `LocalScaleYAsync` / `LocalScaleZAsync` - **Single axis**
- `LocalScaleAsync(end, duration, ...)` - **From current local scale**
- `LocalScaleAsync(begin, end, duration, ...)` - **Float (uniform) local scale**
- `LocalScaleAsync(end, duration, ...)` - **Float from current**
- `LocalScaleInAsync(duration, ...)` - **Scale from 0 to 1**
- `LocalScaleOutAsync(duration, ...)` - **Scale from 1 to 0**

## Color Extensions

Available for: `SpriteRenderer`, `CanvasGroup`, `Material`, `Graphic`

**ChangeColor:**
- `ChangeColorAsync(begin, end, duration, ...)` / `ChangeColorAsync(end, duration, ...)` - **Color interpolation**

**Fade (alpha):**
- `FadeAsync(begin, end, duration, ...)` / `FadeAsync(end, duration, ...)` - **Alpha interpolation**
- `FadeInAsync(duration, ...)` - **Fade from current alpha to 1**
- `FadeOutAsync(duration, ...)` - **Fade from current alpha to 0**

## Text Extensions

Available for: `UnityEngine.UI.Text`, `TMPro.TMP_Text` (requires TextMeshPro)

- `CountAsync(begin, end, duration, formatter, ...)` - **Float counter**
- `CountAsync(begin, end, duration, formatter, ...)` - **Integer counter**

Example formatter: `value => $"Score: {value:N0}"`

## Slider Extensions

### Slider
- `SlideAsync(begin, end, duration, ...)` / `SlideAsync(end, duration, ...)` - **Value interpolation**
- `SlideInAsync(duration, ...)` - **Value 0 to 1**
- `SlideOutAsync(duration, ...)` - **Value 1 to 0**

### Image (Filled)
- `FillAsync(begin, end, duration, ...)` / `FillAsync(end, duration, ...)` - **Fill interpolation**
- `FillInAsync(duration, ...)` - **Fill 0 to 1**
- `FillOutAsync(duration, ...)` - **Fill 1 to 0**

## Renderer Extensions

### SkinnedMeshRenderer
- `BlendAsync(index, begin, end, duration, ...)` / `BlendAsync(index, end, duration, ...)` - **Blend shape weight**
- `BlendInAsync(index, duration, ...)` - **Weight 0 to 100**
- `BlendOutAsync(index, duration, ...)` - **Weight 100 to 0**

## Usage Example

```csharp
using UniT.Easings;
using Cysharp.Threading.Tasks;

public class AnimationExample : MonoBehaviour
{
    public async UniTask AnimateUI()
    {
        // Scale in with bounce
        await transform.LocalScaleInAsync(0.5f, Easing.OutBounce);
        
        // Move with elastic
        await transform.LocalMoveAsync(new Vector3(100, 0, 0), 0.3f, Easing.OutElastic);
        
        // Fade out canvas group
        await canvasGroup.FadeOutAsync(0.3f, Easing.InQuad);
    }
    
    public async UniTask CustomAnimation(CancellationToken cancellationToken)
    {
        // Custom float animation with cancellation
        await Easing.Apply(
            value => transform.position = new Vector3(value, 0, 0),
            begin: 0f,
            end: 10f,
            duration: 1f,
            easing: Easing.InOutCubic,
            timer: Easing.Timer.UnscaledDeltaTime,
            cancellationToken: cancellationToken
        );
    }
}
```
