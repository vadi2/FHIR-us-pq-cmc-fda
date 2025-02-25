Instance: d9e7c2f7-0f59-4645-bb6d-5a8dd2425049
InstanceOf: SupplierOrganization
Title: "Example of a Supplier Organization"
Description: "This example if for a Supplier Organization"
Usage: #example
* identifier[DUNSNumber].type = $NCIT#C134003 "DUNS"
* identifier[DUNSNumber].value = "173265332"
* identifier[DUNSNumber].type = $NCIT#C134003 "DUNS"
* identifier[DUNSNumber].system = $DUNS
* name = "Mega Chem Supply"
* contact.address.line[0] = "350 W Main Street"
* contact.address.state = "NY"
* contact.address.city = "Rochester"
* contact.address.country = "USA"   //* contact.address.country = "United States""
* contact.address.postalCode = "14608"
* contact.address.text = "Mega Chem Supply, 350 W Main Street, Rochester, NY, United States"

Instance: 580c28ac-1a2c-49fa-9be3-de997da5edcf
InstanceOf: RoutineSubstanceDefinition
Title: "Example RoutineSubstanceDefinition - IBUPROFEN"
Description: "Provides sufficient information to identify a drug substance"
Usage: #example
* identifier.value = "P-Isobutylhydratropic Acid" 
* classification = $NCIT#C48807 "Chemical"
* grade = $NCIT#C134006 "USP-NF"
* manufacturer = Reference(urn:uuid:e99bddfa-c1b5-435b-bbe8-24816b4e23e5)
* supplier = Reference(urn:uuid:d9e7c2f7-0f59-4645-bb6d-5a8dd2425049)
* code.code.coding[unii] = $UNII#WK2XYI10QM
* name[gsrs].name = "IBUPROFENPIRIN"
* name[gsrs].preferred = true

Instance: cc82a0ce-b72f-4d58-8ea0-6f323e2a9a93
InstanceOf: QualitySpecification
Title: "A quality specification is for a drug substance"
Description: "A quality specification is for an API "
Usage: #example

* extension[specificationType].valueCodeableConcept = $NCIT#C134022 "Drug Substance"
* extension[spec-additional-info].valueMarkdown = "This API is is currently characterized through a standard battery of physicochemical characterzation tests."
* identifier.value = "ExampleSpecification2"
* version = "1.0"
* title = "Quality Specification for an API"
* type.coding[ApprovalStatus] = $NCIT#C134010 "Tentatively Approved"
* status = #active
* subjectReference = Reference(urn:uuid:580c28ac-1a2c-49fa-9be3-de997da5edcf)
* date = 2022-12-08
* approvalDate = 2022-12-08
* goal[+]
  * id = "b304ed45-5295-4082-9827-f20e1ff0d1d3"
  * description.text = "Negative"
  * addresses[+] = $NCIT#C134029 "Release"
  * addresses[+] = $NCIT#C134030 "Stability"
  * target[+]
    * detailCodeableConcept.text = "Negative"
* goal[+]
  * id = "d4e38c52-30f6-4bb7-ab84-99439a7266ce"
  * description.text = "Negative"
  * addresses[+] = $NCIT#C134029 "Release"
  * addresses[+] = $NCIT#C134030 "Stability"
  * target[+]
    * detailCodeableConcept.text = "Negative"
* goal[+]
  * id = "2abf1f19-e1b1-42e4-b943-79f5fa1642fe"
  * description.text = "Negative"
  * addresses[+] = $NCIT#C134029 "Release"
  * addresses[+] = $NCIT#C134030 "Stability"
  * target[+]
    * detailCodeableConcept.text = "Negative"
* goal[+]
  * id = "c0ed4a79-8f40-4d26-8845-4cea166fb627"
  * description.text = "NMT 10 colony-forming units"
  * addresses[+] = $NCIT#C134029 "Release"
  * addresses[+] = $NCIT#C134030 "Stability"
  * target[+]
    * detailQuantity.extension[interpretationCode].valueCodeableConcept = $NCIT#C61586 "NMT (not more than)"
    * detailQuantity = 10 $NCIT#C68742 "colony forming units"
* goal[+]
  * id = "442983b5-bbc3-4534-9f1b-5ae5e4c531c1"
  * description.text = "NMT 100 colony-forming units"
  * addresses[+] = $NCIT#C134029 "Release"
  * addresses[+] = $NCIT#C134030 "Stability"
  * target[+]
    * detailQuantity.extension[interpretationCode].valueCodeableConcept = $NCIT#C61586 "NMT (not more than)"
    * detailQuantity = 100 $NCIT#C68742 "colony forming units"
* action[+]
  * id = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
  * extension[testOrder].valueDecimal = 1
  * title = "Microbiological Examination of Nonsterile Products"
  * code
    * coding = $NCIT#C96102 "Compendial"
    * text = "Visual"
  * reason[+].extension[categoryLevel].valueInteger = 1
  * reason[=].coding = $TestCats#TC13 "Microbial Limits"
  * documentation.type = #documentation
  * documentation.label = "USP <61>"
  * action[+]
    * extension[stageOrder].valueDecimal = 1
    * linkId = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
    * prefix = "Stage 1"
    * title = "Staphylococcus aureus"
    * goalId[+] = "b304ed45-5295-4082-9827-f20e1ff0d1d3"
  * action[+]
    * extension[stageOrder].valueDecimal = 2
    * linkId = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
    * prefix = "Stage 2"
    * title = "Pseudomonas aeruginosa"
    * goalId[+] = "d4e38c52-30f6-4bb7-ab84-99439a7266ce"
  * action[+]
    * extension[stageOrder].valueDecimal = 3
    * linkId = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
    * prefix = "Stage 3"
    * title = "Bacillus subtilis"
    * goalId[+] = "2abf1f19-e1b1-42e4-b943-79f5fa1642fe"
  * action[+]
    * extension[stageOrder].valueDecimal = 4
    * linkId = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
    * prefix = "Stage 4"
    * title = "Total Aerobic Microbial Count (TAMC)"
    * goalId[+] = "c0ed4a79-8f40-4d26-8845-4cea166fb627"
  * action[+]
    * extension[stageOrder].valueDecimal = 5
    * linkId = "997a8ec6-eabf-41a3-b166-ddc3dfb35c27"
    * prefix = "Stage 5"
    * title = "Total Yeasts and Molds Count (TYMC)"
    * goalId[+] = "442983b5-bbc3-4534-9f1b-5ae5e4c531c1"

Instance: 55d92f43-e328-4011-bbcf-744e3afd954f
InstanceOf: EctdCompositionSP4151
Title: "eCTD Drug Substance Specification Composition SP4151"
Description: "Composition SP4151 implementing eCTD 3.2.S.4.1."
Usage: #example

* identifier.value = "ExampleSpecification2"
* status = #final
* type.coding = $SectionTypes#SP4151 "Quality Specification"
* author = Reference(urn:uuid:4f3e9af1-306b-4fad-bf04-7881400b266a)
* date = 2023-12-15T22:36:51.299Z
* title = """Quality Specification for an API"""
* section[Api]
  * code = $SectionTypes#32S41 "Substance Specification"
  * title = "32S41"
  * entry = Reference(urn:uuid:cc82a0ce-b72f-4d58-8ea0-6f323e2a9a93)

Instance: 6004e36e-7df9-469d-9b29-8e9f9bd7e95f
InstanceOf: CMCeCTDDocumentSP4151
Title: "FHIR Document example of 3.2.P.4.1."
Description: "FHIR document bundle with the CMC eCTD SP4151 profile for a Drug Substance"
Usage: #example
* identifier.extension[version].valueString = "0.1.24"
* identifier.system = $IDsys
* identifier.value = "urn:uuid:3e9cc7a1-e157-4b46-980a-33a8e50dcf65"
* timestamp = 2023-12-15T22:36:51.299Z
* entry[0].resource = 55d92f43-e328-4011-bbcf-744e3afd954f
* entry[=].fullUrl = "urn:uuid:55d92f43-e328-4011-bbcf-744e3afd954f"
* entry[+].resource = cc82a0ce-b72f-4d58-8ea0-6f323e2a9a93
* entry[=].fullUrl = "urn:uuid:cc82a0ce-b72f-4d58-8ea0-6f323e2a9a93"
* entry[+].resource = 580c28ac-1a2c-49fa-9be3-de997da5edcf
* entry[=].fullUrl = "urn:uuid:580c28ac-1a2c-49fa-9be3-de997da5edcf"
* entry[+].resource = 4f3e9af1-306b-4fad-bf04-7881400b266a
* entry[=].fullUrl = "urn:uuid:4f3e9af1-306b-4fad-bf04-7881400b266a"
* entry[+].resource = e99bddfa-c1b5-435b-bbe8-24816b4e23e5
* entry[=].fullUrl = "urn:uuid:e99bddfa-c1b5-435b-bbe8-24816b4e23e5"
* entry[+].resource = d9e7c2f7-0f59-4645-bb6d-5a8dd2425049
* entry[=].fullUrl = "urn:uuid:d9e7c2f7-0f59-4645-bb6d-5a8dd2425049"
