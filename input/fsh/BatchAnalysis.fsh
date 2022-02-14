Extension: QualitySpecificationExtension
Id: pq-quality-specification-extension
Title: "Quality Specification Reference"
Description: "The product specification used in the batch release or stability testing."
* . ^short = "Specification and Specification Version"
* extension contains 
    specification 1..1 MS and
    specificationVersion 1..1 MS 
* extension[specification]
* extension[specification].valueString
* extension[specification].valueString ^short = "Specification Title"
* extension[specification].valueString ^definition = ""
* extension[specificationVersion]
* extension[specificationVersion].valueString
* extension[specificationVersion].valueString ^short = "Specification Version"
* extension[specificationVersion].valueString ^definition = ""

Profile: BatchAnalysis
Parent: DiagnosticReport
Id: pqcmc-batch-analysis
Title: "Batch Analysis"
Description: "Batch or lot release testing  to ensure that pharmaceutical products meet the product specification."

* .extension contains pq-quality-specification-extension named qualitySpecification 1..1 MS
* identifier 1..1 MS
* identifier.value 1..1
* status MS
* status ^short = "Status of the batch analysis"
* status ^definition = "The status of the batch analysis. Consult the HL7 list of permitted values in http://hl7.org/fhir/ValueSet/diagnostic-report-status"
* code MS
* code.text 1..1 MS
* code.text ^short = "Name/Code for this batch analysis."
* subject 1..1 MS
* subject only Reference(DrugProductInstance or DrugSubstanceInstance)
* subject ^short = "A single medication batch/lot or a single subtance batch/lot "
* performer 1..1 MS
* performer only Reference(MfgTestSiteOrganization)
* performer ^short = "Test Site"
* performer ^definition = "Reference to the organization profile that contains the name, identifer(s) and address of the testing site."
* result MS
* result only Reference(RensultObservation)

Profile: RensultObservation
Parent: Observation
Id: pq-result-observation
Title: "Result Observation"
Description: "Belgian profile for an observation in a laboratory report"

* identifier MS
* status MS
* category MS
* code ^definition = ""
* subject only Reference(DrugProductInstance or DrugSubstanceInstance)
* effective[x] MS
* issued MS
* performer only Reference(MfgTestSiteOrganization)
* performer MS
* performer ^short = ""
* value[x] MS
* dataAbsentReason MS
* interpretation MS
* interpretation from PqcmcConformanceCriteriaTerminology
* note MS


