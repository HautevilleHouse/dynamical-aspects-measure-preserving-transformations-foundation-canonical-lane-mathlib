import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure MixingProperty (M : Type u) [MeasurableSpace M] (μ : Measure M) (T : MeasurePreservingTransformation M μ) where
  mixing : ∀ A B, MeasurableSet A → MeasurableSet B →
    (fun n : ℕ => μ (T.T⁻¹'^[n] A ∩ B)) ⇝ (λ _ : ℕ => μ A * μ B)

structure WeakMixing extends MeasurePreservingTransformation M μ where
  weakMixing : ∀ A B, MeasurableSet A → MeasurableSet B →
    limsup (fun n : ℕ => |μ (T⁻¹'^[n] A ∩ B) - μ A * μ B|) ^ (1/n) < 1

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
