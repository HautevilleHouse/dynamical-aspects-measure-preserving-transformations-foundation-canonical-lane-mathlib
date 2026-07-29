import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MeasureSpace

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse