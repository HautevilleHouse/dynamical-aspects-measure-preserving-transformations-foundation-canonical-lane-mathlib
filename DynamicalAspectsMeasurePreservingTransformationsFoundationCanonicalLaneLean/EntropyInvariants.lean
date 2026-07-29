import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasurePreservingTransformation

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure EntropyInvariantsPackage {X : Type u} [MeasurableSpace X] (T : MeasurePreservingTransformation X) where
  measureTheoreticEntropy : Prop
  topologicalEntropy : Prop
  variationalPrinciple : Prop
  entropyAsInvariant : Prop

structure EntropyInvariantsEvidence {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (E : EntropyInvariantsPackage T) where
  measureTheoreticEntropyClosed : E.measureTheoreticEntropy
  topologicalEntropyClosed : E.topologicalEntropy
  variationalPrincipleClosed : E.variationalPrinciple
  entropyAsInvariantClosed : E.entropyAsInvariant

def EntropyInvariantsClosed {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (E : EntropyInvariantsPackage T) : Prop :=
  E.measureTheoreticEntropy ∧ E.topologicalEntropy ∧ E.variationalPrinciple ∧ E.entropyAsInvariant

theorem entropy_invariants_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (E : EntropyInvariantsPackage T) (Ev : EntropyInvariantsEvidence E) :
    EntropyInvariantsClosed E := by
  exact And.intro Ev.measureTheoreticEntropyClosed
    (And.intro Ev.topologicalEntropyClosed
      (And.intro Ev.variationalPrincipleClosed Ev.entropyAsInvariantClosed))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
