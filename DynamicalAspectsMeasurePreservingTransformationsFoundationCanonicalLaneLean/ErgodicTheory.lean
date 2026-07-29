import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure ErgodicMeasure (M : MeasureSpace) (T : MeasurePreservingTransformation M) where
  invariantSetsAreTrivial : ∀ s, s ∈ M.sigmaAlgebra → (T.map⁻¹' s = s) → (M.measure s = 0 ∨ M.measure (M.carrier \ s) = 0)

structure ErgodicPackage (M : MeasureSpace) (T : MeasurePreservingTransformation M) where
  ergodicMeasure : ErgodicMeasure M T
  ergodicDecomposition : Prop
  ergodicTheorem : Prop
  ergodicTheoremClosed : ergodicTheorem
  ergodicDecompositionClosed : ergodicDecomposition

def ErgodicClosure (M : MeasureSpace) (T : MeasurePreservingTransformation M) (E : ErgodicPackage M T) : Prop :=
  E.ergodicTheorem ∧ E.ergodicDecomposition

theorem ergodic_closed_from_evidence (M : MeasureSpace) (T : MeasurePreservingTransformation M) (E : ErgodicPackage M T) : ErgodicClosure M T E :=
  And.intro E.ergodicTheoremClosed E.ergodicDecompositionClosed

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse