import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Ergodic.MeasurePreserving
import Mathlib.MeasureTheory.MeasureSpace

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure FlowMeasurePreservingPackage (X : Type u) [MeasurableSpace X] (μ : MeasureTheory.Measure X) where
  flow : ℝ → X → X
  measurableFlow : ∀ t, Measurable (flow t)
  measurePreserving : ∀ t, MeasureTheory.MeasurePreserving (flow t) μ μ
  flowProperty : ∀ t s, flow (t + s) = flow t ∘ flow s
  initialCondition : flow 0 = id

structure FlowMeasurePreservingEvidence {X : Type u} [MeasurableSpace X] {μ : MeasureTheory.Measure X}
    (F : FlowMeasurePreservingPackage X μ) where
  measurableFlowClosed : ∀ t, Measurable (F.flow t)
  measurePreservingClosed : ∀ t, MeasureTheory.MeasurePreserving (F.flow t) μ μ
  flowPropertyClosed : ∀ t s, F.flow (t + s) = F.flow t ∘ F.flow s
  initialConditionClosed : F.flow 0 = id

def FlowMeasurePreservingClosed {X : Type u} [MeasurableSpace X] {μ : MeasureTheory.Measure X}
    (F : FlowMeasurePreservingPackage X μ) : Prop :=
  (∀ t, Measurable (F.flow t)) ∧ (∀ t, MeasureTheory.MeasurePreserving (F.flow t) μ μ) ∧
  (∀ t s, F.flow (t + s) = F.flow t ∘ F.flow s) ∧ (F.flow 0 = id)

theorem flow_measure_preserving_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {μ : MeasureTheory.Measure X}
    (F : FlowMeasurePreservingPackage X μ) (E : FlowMeasurePreservingEvidence F) :
    FlowMeasurePreservingClosed F := by
  exact And.intro (fun t => E.measurableFlowClosed t)
    (And.intro (fun t => E.measurePreservingClosed t)
      (And.intro (fun t s => E.flowPropertyClosed t s) E.initialConditionClosed))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
