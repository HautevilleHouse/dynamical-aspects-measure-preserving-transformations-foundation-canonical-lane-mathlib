import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasurePreservingTransformation

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure SpectralTheoryPackage {X : Type u} [MeasurableSpace X] (T : MeasurePreservingTransformation X) where
  koopmanOperator : Type v
  spectrum : Prop
  spectralMeasure : Prop
  unitaryProperty : Prop

structure SpectralTheoryEvidence {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (S : SpectralTheoryPackage T) where
  koopmanOperatorClosed : S.koopmanOperator
  spectrumClosed : S.spectrum
  spectralMeasureClosed : S.spectralMeasure
  unitaryPropertyClosed : S.unitaryProperty

def SpectralTheoryClosed {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (S : SpectralTheoryPackage T) : Prop :=
  S.koopmanOperator ∧ S.spectrum ∧ S.spectralMeasure ∧ S.unitaryProperty

theorem spectral_theory_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {T : MeasurePreservingTransformation X}
    (S : SpectralTheoryPackage T) (Ev : SpectralTheoryEvidence S) :
    SpectralTheoryClosed S := by
  exact And.intro Ev.koopmanOperatorClosed
    (And.intro Ev.spectrumClosed
      (And.intro Ev.spectralMeasureClosed Ev.unitaryPropertyClosed))

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse
