import DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : TransformAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TransformWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalAspectsMeasurePreservingTransformationsFoundationCanonicalLaneLean
end HautevilleHouse