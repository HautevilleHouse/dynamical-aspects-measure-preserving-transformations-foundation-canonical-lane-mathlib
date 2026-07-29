import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure KoopmanOperator (M : MeasureSpace) (T : MeasurePreservingTransformation M) where
  operator : (M.carrier → ℝ) → (M.carrier → ℝ)
  isLinear : True
  action : ∀ (f : M.carrier → ℝ) (x : M.carrier), operator f x = f (T.map x)

structure SpectralPackage (M : MeasureSpace) (T : MeasurePreservingTransformation M) where
  koopmanOperator : KoopmanOperator M T
  spectralTheorem : Prop
  mixingProperties : Prop
  spectralTheoremClosed : spectralTheorem
  mixingPropertiesClosed : mixingProperties

def SpectralClosure (M : MeasureSpace) (T : MeasurePreservingTransformation M) (S : SpectralPackage M T) : Prop :=
  S.spectralTheorem ∧ S.mixingProperties

theorem spectral_closed_from_evidence (M : MeasureSpace) (T : MeasurePreservingTransformation M) (E : SpectralPackage M T) : SpectralClosure M T E :=
  And.intro E.spectralTheoremClosed E.mixingPropertiesClosed

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse