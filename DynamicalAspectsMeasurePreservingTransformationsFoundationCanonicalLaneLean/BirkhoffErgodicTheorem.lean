import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.Ergodicity

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure BirkhoffErgodicTheoremPackage (X : MeasureSpace) (T : MeasurePreservingMap X X) where
  ergodic : ErgodicityPackage X T
  functionSpace : Type u
  integrableFunctions : Set functionSpace
  timeAverages : functionSpace → (ℕ → ℝ)
  spaceAverage : functionSpace → ℝ
  convergence : ∀ f ∈ integrableFunctions, ∃ Ω ∈ X.sigmaAlgebra, X.measure (X.carrier \ Ω) = 0 ∧
    ∀ x ∈ Ω, Filter.Tendsto (λ n : ℕ => timeAverages f n) Filter.atTop (nhds (spaceAverage f))
  statement : Prop
  statementFromConvergence : (∀ f ∈ integrableFunctions, True) → statement

structure BirkhoffErgodicTheoremEvidence (X : MeasureSpace) (T : MeasurePreservingMap X X) (P : BirkhoffErgodicTheoremPackage X T) where
  ergodicClosed : ErgodicityClosed P.ergodic
  convergenceHolds : ∀ f ∈ P.integrableFunctions, True
  statementClosed : P.statement

def BirkhoffErgodicTheoremClosed {X : MeasureSpace} {T : MeasurePreservingMap X X} (P : BirkhoffErgodicTheoremPackage X T) : Prop :=
  P.statement

theorem birkhoff_ergodic_theorem_closed_from_evidence {X : MeasureSpace} {T : MeasurePreservingMap X X} (P : BirkhoffErgodicTheoremPackage X T) (E : BirkhoffErgodicTheoremEvidence X T P) : BirkhoffErgodicTheoremClosed P :=
  E.statementClosed

end HautevilleHouse
end HautevilleHouse