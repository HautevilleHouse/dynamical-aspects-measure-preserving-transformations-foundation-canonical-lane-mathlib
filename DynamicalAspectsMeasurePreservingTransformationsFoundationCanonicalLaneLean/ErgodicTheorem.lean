import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure PointwiseErgodicTheorem (M : Type u) [MeasurableSpace M] (μ : Measure M) (T : MeasurePreservingTransformation M μ) where
  ergodicAveragesConverge : ∀ f : Lp ℝ 1 μ, (fun x : M => (1/n : ℕ) * ∑_{k=0}^{n-1} f (T.T^[k] x)) → (∫ f dμ) a.e.

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
