import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasurePreservingTransformations

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure Partition (X : MeasureSpace) where
  sets : List (Set X.carrier)
  measurable : ∀ s ∈ sets, s ∈ X.sigmaAlgebra
  disjoint : List.Pairwise (λ s t => s ∩ t = ∅) sets
  cover : ⋃₀ sets = X.carrier

structure EntropyData (X : MeasureSpace) (T : MeasurePreservingMap X X) where
  partition : Partition X
  entropy : ℝ
  entropyDefined : entropy = - ∑ s in partition.sets, X.measure s * Real.log (X.measure s)
  conditionalEntropy : Partition X → ℝ
  kolmogorovSinaiEntropy : ℝ
  ksEntropyLimit : Filter.Tendsto (λ n : ℕ => (1/n) * conditionalEntropy partition) Filter.atTop (nhds kolmogorovSinaiEntropy)

structure EntropyPackage (X : MeasureSpace) (T : MeasurePreservingMap X X) where
  entropyData : EntropyData X T
  entropyProposition : Prop
  entropyFromData : entropyData.kolmogorovSinaiEntropy = entropyData.entropy → entropyProposition

def EntropyClosed {X : MeasureSpace} {T : MeasurePreservingMap X X} (E : EntropyPackage X T) : Prop :=
  E.entropyProposition

theorem entropy_closed_from_data {X : MeasureSpace} {T : MeasurePreservingMap X X} (E : EntropyPackage X T) (h : E.entropyData.kolmogorovSinaiEntropy = E.entropyData.entropy) : EntropyClosed E :=
  E.entropyFromData h

end HautevilleHouse
end HautevilleHouse