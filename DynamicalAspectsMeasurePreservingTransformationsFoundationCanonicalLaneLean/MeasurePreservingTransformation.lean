import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure MeasurePreservingTransformation (M : Type u) [MeasurableSpace M] (μ : Measure M) where
  T : M → M
  measurable : Measurable T
  preservesMeasure : ∀ s, MeasurableSet s → μ (T⁻¹' s) = μ s

structure ErgodicTransformation (M : Type u) [MeasurableSpace M] (μ : Measure M) extends MeasurePreservingTransformation M μ where
  ergodic : ∀ s, MeasurableSet s → (μ (s) = 0 ∨ μ (s) = μ (Set.univ)) := by
    intro s hs
    have : T⁻¹' s = s := ?_
    sorry

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
