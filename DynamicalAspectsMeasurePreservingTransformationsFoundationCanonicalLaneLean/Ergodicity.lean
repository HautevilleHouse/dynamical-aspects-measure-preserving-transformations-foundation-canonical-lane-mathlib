import DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.EntropyInvariant

/-!
# Ergodicity Package
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure ErgodicityPackage {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F} where
  invariantSigmaAlgebra : Prop
  ergodicDecomposition : Prop
  mixingProperties : Prop
  spectralGap : Prop

structure ErgodicityEvidence {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F}
    (Er : ErgodicityPackage E) where
  invariantSigmaAlgebraClosed : Er.invariantSigmaAlgebra
  ergodicDecompositionClosed : Er.ergodicDecomposition
  mixingPropertiesClosed : Er.mixingProperties
  spectralGapClosed : Er.spectralGap

def ErgodicityClosed {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F}
    (Er : ErgodicityPackage E) : Prop :=
  Er.invariantSigmaAlgebra ∧ Er.ergodicDecomposition ∧
  Er.mixingProperties ∧ Er.spectralGap

theorem ergodicity_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeasurePreservingFlowPackage G}
    {E : EntropyInvariantPackage F} (Er : ErgodicityPackage E)
    (Ev : ErgodicityEvidence Er) : ErgodicityClosed Er := by
  exact And.intro Ev.invariantSigmaAlgebraClosed
    (And.intro Ev.ergodicDecompositionClosed
      (And.intro Ev.mixingPropertiesClosed Ev.spectralGapClosed))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse