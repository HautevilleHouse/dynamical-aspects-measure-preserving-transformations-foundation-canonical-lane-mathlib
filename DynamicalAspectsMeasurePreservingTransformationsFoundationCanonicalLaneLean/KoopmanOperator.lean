import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure KoopmanOperator (M : Type u) [MeasurableSpace M] (μ : Measure M) (T : MeasurePreservingTransformation M μ) where
  U : (Lp ℝ 2 μ) → (Lp ℝ 2 μ)
  unitary : IsUnitary U

structure KoopmanEigenvalue (M : Type u) [MeasurableSpace M] (μ : Measure M) (T : MeasurePreservingTransformation M μ) where
  λ : ℂ
  f : Lp ℝ 2 μ
  eigenvalue : KoopmanOperator M μ T → f ≠ 0 ∧ λ • f = U f

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
