import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasurePreservingTransformations

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure MixingData (X : MeasureSpace) (T : MeasurePreservingMap X X) where
  strongMixing : Prop
  weakMixing : Prop
  correlationFunction : Set X.carrier → Set X.carrier → ℕ → ℝ
  strongMixingDecay : ∀ A B ∈ X.sigmaAlgebra, X.measure (A ∩ B) = X.measure A * X.measure B →
    Filter.Tendsto (λ n : ℕ => |correlationFunction A B n|) Filter.atTop (nhds 0)
  weakMixingDef : ∀ A B ∈ X.sigmaAlgebra,
    (1 / (N+1)) * ∑ n in Finset.range N, |correlationFunction A B n| → 0 as N → ∞

structure MixingPackage (X : MeasureSpace) (T : MeasurePreservingMap X X) where
  mixingData : MixingData X T
  strongMixingProposition : Prop
  weakMixingProposition : Prop
  strongFromData : mixingData.strongMixing → strongMixingProposition
  weakFromData : mixingData.weakMixing → weakMixingProposition

def MixingClosed {X : MeasureSpace} {T : MeasurePreservingMap X X} (M : MixingPackage X T) : Prop :=
  M.strongMixingProposition ∨ M.weakMixingProposition

theorem mixing_closed_from_data {X : MeasureSpace} {T : MeasurePreservingMap X X} (M : MixingPackage X T) (h : M.mixingData.strongMixing) : MixingClosed M :=
  Or.inl (M.strongFromData h)

end HautevilleHouse
end HautevilleHouse