import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure MeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : carrier → ℝ
  measureNonnegative : ∀ s, measure s ≥ 0
  measureEmpty : measure ∅ = 0
  sigmaAdditive : ∀ (f : ℕ → Set carrier), Disjoint (λ i j => f i ∩ f j = ∅) → measure (⋃ i, f i) = ∑' i, measure (f i)

structure MeasurePreservingMap (X Y : MeasureSpace) where
  map : X.carrier → Y.carrier
  measurable : ∀ s ∈ Y.sigmaAlgebra, map⁻¹' s ∈ X.sigmaAlgebra
  measurePreserving : ∀ s ∈ Y.sigmaAlgebra, X.measure (map⁻¹' s) = Y.measure s

def measurePreservingTransformations (X : MeasureSpace) : Set (MeasurePreservingMap X X) :=
  { T : MeasurePreservingMap X X | True }

theorem identity_measure_preserving (X : MeasureSpace) : MeasurePreservingMap X X := by
  refine { map := id, measurable := ?_, measurePreserving := ?_ }
  · intro s hs
    simp [hs]
  · intro s hs
    simp

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse