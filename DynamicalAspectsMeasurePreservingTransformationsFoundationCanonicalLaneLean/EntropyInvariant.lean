import DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasurePreservingFlow

/-!
# Entropy Invariant Package
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure EntropyInvariantPackage {G : RiemannianCurvaturePackage}
    (F : MeasurePreservingFlowPackage G) where
  entropyFunctional : Type u
  kolmogorovSinaiEntropy : Prop
  topologicalEntropy : Prop
  entropyInvariant : Prop
  variationalPrinciple : Prop

structure EntropyInvariantEvidence {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} (E : EntropyInvariantPackage F) where
  kolmogorovSinaiEntropyClosed : E.kolmogorovSinaiEntropy
  topologicalEntropyClosed : E.topologicalEntropy
  entropyInvariantClosed : E.entropyInvariant
  variationalPrincipleClosed : E.variationalPrinciple

def EntropyInvariantClosed {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} (E : EntropyInvariantPackage F) : Prop :=
  E.kolmogorovSinaiEntropy ∧ E.topologicalEntropy ∧
  E.entropyInvariant ∧ E.variationalPrinciple

theorem entropy_invariant_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeasurePreservingFlowPackage G}
    (E : EntropyInvariantPackage F) (Ev : EntropyInvariantEvidence E) :
    EntropyInvariantClosed E := by
  exact And.intro Ev.kolmogorovSinaiEntropyClosed
    (And.intro Ev.topologicalEntropyClosed
      (And.intro Ev.entropyInvariantClosed Ev.variationalPrincipleClosed))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse