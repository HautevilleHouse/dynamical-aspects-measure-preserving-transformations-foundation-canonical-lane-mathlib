import DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.Ergodicity

/-!
# Return Times Package (Poincaré Recurrence)
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure ReturnTimesPackage {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F}
    {Er : ErgodicityPackage E} where
  recurrenceTheorem : Prop
  returnTimeEstimates : Prop
  quantitativeRecurrence : Prop
  hittingTimes : Prop
  ceaselessRecurrence : Prop

structure ReturnTimesEvidence {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F}
    {Er : ErgodicityPackage E} (R : ReturnTimesPackage Er) where
  recurrenceTheoremClosed : R.recurrenceTheorem
  returnTimeEstimatesClosed : R.returnTimeEstimates
  quantitativeRecurrenceClosed : R.quantitativeRecurrence
  hittingTimesClosed : R.hittingTimes
  ceaselessRecurrenceClosed : R.ceaselessRecurrence

def ReturnTimesClosed {G : RiemannianCurvaturePackage}
    {F : MeasurePreservingFlowPackage G} {E : EntropyInvariantPackage F}
    {Er : ErgodicityPackage E} (R : ReturnTimesPackage Er) : Prop :=
  R.recurrenceTheorem ∧ R.returnTimeEstimates ∧
  R.quantitativeRecurrence ∧ R.hittingTimes ∧ R.ceaselessRecurrence

theorem return_times_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeasurePreservingFlowPackage G}
    {E : EntropyInvariantPackage F} {Er : ErgodicityPackage E}
    (R : ReturnTimesPackage Er) (Ev : ReturnTimesEvidence R) :
    ReturnTimesClosed R := by
  exact And.intro Ev.recurrenceTheoremClosed
    (And.intro Ev.returnTimeEstimatesClosed
      (And.intro Ev.quantitativeRecurrenceClosed
        (And.intro Ev.hittingTimesClosed Ev.ceaselessRecurrenceClosed)))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse