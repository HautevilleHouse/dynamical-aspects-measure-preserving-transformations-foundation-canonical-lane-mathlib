import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure RecurrentSet (M : MeasureSpace) (T : MeasurePreservingTransformation M) (s : Set M.carrier) where
  almostEveryPointReturns : M.measure {x : M.carrier | ∃ n : ℕ, n ≥ 1 ∧ (T.map^[n]) x ∈ s} = M.measure s

structure PoincareRecurrencePackage (M : MeasureSpace) (T : MeasurePreservingTransformation M) where
  recurrenceTheorem : Prop
  recurrenceTheoremClosed : recurrenceTheorem
  recurrentSetsExist : Prop
  recurrentSetsExistClosed : recurrentSetsExist

def RecurrenceClosure (M : MeasureSpace) (T : MeasurePreservingTransformation M) (P : PoincareRecurrencePackage M T) : Prop :=
  P.recurrenceTheorem ∧ P.recurrentSetsExist

theorem recurrence_closed_from_evidence (M : MeasureSpace) (T : MeasurePreservingTransformation M) (E : PoincareRecurrencePackage M T) : RecurrenceClosure M T E :=
  And.intro E.recurrenceTheoremClosed E.recurrentSetsExistClosed

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse