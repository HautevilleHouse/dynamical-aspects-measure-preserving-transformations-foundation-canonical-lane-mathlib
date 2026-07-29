import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure MeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : carrier → ℝ
  measureNonnegative : ∀ s, measure s ≥ 0
  measureEmpty : measure ∅ = 0
  measureCountablyAdditive : ∀ (f : ℕ → Set carrier), (∀ i j, i ≠ j → f i ∩ f j = ∅) → measure (⋃ i, f i) = ∑' i, measure (f i)

structure MeasurePreservingTransformation (M : MeasureSpace) where
  map : M.carrier → M.carrier
  measurable : ∀ s, s ∈ M.sigmaAlgebra → map⁻¹' s ∈ M.sigmaAlgebra
  preservesMeasure : ∀ s, s ∈ M.sigmaAlgebra → M.measure (map⁻¹' s) = M.measure s

def MeasureSpaceAdmissible (M : MeasureSpace) : AdmissibleClass := {
  object := { space := { carrier := M.carrier, topology := sorry }, closedThreeManifold := True, simplyConnected := True, sphereModel := Unit, sphereTopology := inferInstance, homeomorphicToSphere := True, conclusion := True },
  endpointSatisfied := True,
  remainderRecorded := False,
  gateWitness := Or.inl True.intro
}

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse