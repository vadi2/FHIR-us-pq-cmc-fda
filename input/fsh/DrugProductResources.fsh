Extension: ContentPercent
Id:  content-percent
Title: "Content Percent"
Description: "constituent content percent"
* ^context[+].type = #element
* ^context[=].expression = "ManufacturedItemDefinition.component.constituent"
* value[x] 1..1
* value[x] obeys cmc-decimal-format
* value[x] only decimal
* . ^short = "Constituent Content Percent"
* . ^definition = """The percentage of the constituent in the component. [Source: SME Defined]
Example: Product Total Weight = 1200 mg and Product Ingredient Amount = 325 mg, so Product Ingredient Content Percent = 27.08
"""

Extension: OptionalDenominator
Id:  optional-denominator
Title: "Optional Denominator"
Description: "The constituent optional denominator is used then the unit is other than 1 per product part."
* ^context[+].type = #element
* ^context[=].expression = "ManufacturedItemDefinition.component.amount"
* ^context[+].type = #element
* ^context[=].expression = "ManufacturedItemDefinition.component.constituent.amount"
* value[x] 1..1
* value[x] only Quantity

* . ^short = "Product Part Total Weight Numeric Denominator | Product Part Ingredient Amount Numeric Denominator"
* . ^definition = """Specifies the quantity of the ingredient(s) consistent with this single dose unit (e.g., one tablet, capsule) of drug product. [Source: SME Defined]
Example: if the tablet contains 325 mg of the ingredient in each unit dose, then Product Ingredient Numeric Denominator = 1
"""

Extension: ContainerClosureExtension
Id: pq-container-closure-extension
Title: "Container Closure"
Description: "The packaging information including a brief description of the components, the assembled packaging system and any precautions needed to ensure the protection and preservation of the drug substance or drug product during their use in the clinical trials."
* . ^short = "Container Closure System Information"
* ^context[+].type = #element
* ^context[=].expression = "MedicinalProductDefinition"
* ^context[+].type = #element
* ^context[=].expression = "SubstanceDefinition"
* extension contains
    containerType 1..1 MS and
    closureType 1..1 MS and  
    description 1..1 MS and
    depiction 0..* MS 
* extension[containerType].value[x] 1..1
* extension[containerType].value[x] only CodeableConcept
* extension[containerType].value[x] from PqcmcContainerTypeTerminology (required)
* extension[containerType].value[x] ^short = "Container Type"
* extension[containerType].value[x] ^definition = "The kind of container that drug substances and finished dosage forms are contained in, which could include both the immediate (or primary) and secondary containers [Source: Adapted from NCI Thesaurus C4164]"
* extension[closureType].value[x] 1..1
* extension[closureType].value[x] only CodeableConcept
* extension[closureType].value[x] from PqcmcClosureTypeTerminology (required)
* extension[closureType].value[x] ^short = "Closure Type"
* extension[closureType].value[x] ^definition = "The kind of closures used for the container in which the drug substances and finished dosage forms are stored. [Source: SME Defined]"
* extension[description].value[x] 1..1
* extension[description].value[x] only markdown
* extension[description].value[x] ^short = "Container Closure System Description"
* extension[description].value[x] ^definition = """Any textual comments that describe the sum of container closure system (CCS) components that together contain and protect the dosage form or drug substance. [Source: Adapted from Q1A(R2)-ICH Glossary]
Example: White opaque, round 50 mL HDPE bottle with a fitted 33 mm child resistant black polypropylene threaded cap closure, aluminum sealed, and containing molecular sieve canister 2 gm (CAN TRISORB 2G) as desiccant.
Note: This includes primary packaging components and secondary packaging components, if the latter are intended to provide additional protection to the drug substance or the drug product. A packaging system is equivalent to a container closure system. [Source: Adapted from Q1A(R2)-ICH Glossary]
"""
* extension[depiction].value[x] 1..1
* extension[depiction].value[x] only Reference(Base64DocumentReference)

Profile: FinishedProduct
Parent: ManufacturedItemDefinition
Id: pqcmc-product-part
Title: "Manufactured Drug Product"
Description: "The manufactured drug product defined by all its parts or layers. If the drug product composition is homogeneous it will have a single part or component."
* obeys cmc-capsule-count-required
* obeys cmc-arbitrary-unit-text-required
* obeys cmc-coating-indication-required
* obeys cmc-tablet-layer-count-required
* obeys cmc-tablet-bead-count-required
* obeys cmc-capsule-classification-required
* meta.profile 1..1 MS
* identifier 0..1 MS
* status 1..1 MS
* name MS
* name ^short = "Product Proprietary Name | Product Non-proprietary Name"
* name ^definition = """Product Proprietary Name: The exclusive name of a drug product owned by a company under trademark law regardless of registration status with the Patent and Trademark Office (PTO). [Source: SME Defined] Note: Excludes dosage form, route of administration and strength. 
Example: Tylenol

Product Non-proprietary Name: A name unprotected by trademark rights that is entirely in the public domain. It may be used without restriction by the public at large, both lay and professional. [Source: SME Defined]"""
* manufacturedDoseForm.coding from PqcmcManufacturedDoseFormTerminology
* property 1..* MS
* property ^slicing.discriminator.type = #value
* property ^slicing.discriminator.path = "type"
* property ^slicing.rules = #closed
* property ^slicing.description = "Slice based on value"
* property contains
      OvrRelsProf 1..1 MS and
      OvrRelsMech 0..1 MS and
      CoatInd 0..1 MS and
      LayCnt 0..1 MS and
      BeaTypCnt 0..1 MS and
      CapClass 0..1 MS and
      CapConCnt 0..1 MS and
      Schematic 1..* MS and
      WgtTyp 1..1 MS and
      TotWgtNum 1..1 MS and
      TotWgtDen 0..1 MS and
      TotWgtTxt 0..1 MS and
      TotWgtOper 0..1 MS and
      QualStd 1..* MS
* property[OvrRelsProf].type MS
* property[OvrRelsProf].type = $NCIT#OvrRelsProf "Product Overall Release Profile"
* property[OvrRelsProf].type from pqcmc-product-characteristic
* property[OvrRelsProf].valueCodeableConcept 1..1 MS
* property[OvrRelsProf].valueCodeableConcept ^short = "Product Overall Release Profile"
* property[OvrRelsProf].valueCodeableConcept ^definition = """The overall release profile is the drug release profile (e.g., IR, DR, or ER-USP nomenclature) that is achieved by the drug delivery system used in the dosage form design as evident from the pharmacokinetic plasma drug concentration versus time curve (this is currently focused on solids).
For example, a capsule filled with IR and DR beads will exhibit an ER release profile as evident from the pharmacokinetic curve. In this example, the "product overall release profile" is "ER". [Source: SME Defined]
"""
* property[OvrRelsProf].valueCodeableConcept.coding from PqcmcReleaseProfile

* property[OvrRelsMech].type MS
* property[OvrRelsMech].type = $NCIT#OvrRelsMech "Product Overall Release Mechanism"
* property[OvrRelsMech].type from pqcmc-product-characteristic
* property[OvrRelsMech].valueCodeableConcept 1..1 MS
* property[OvrRelsMech].valueCodeableConcept ^short = "Product Overall Release Mechanism"
* property[OvrRelsMech].valueCodeableConcept ^definition = """TThe dosage form design used to achieve an ER release profile.  Examples of overall release mechanisms include osmotic pump, reservoir, and matrix. [Source: SME Defined]
"""
* property[OvrRelsMech].valueCodeableConcept.coding from PqcmcReleaseMechanism

* property[CoatInd].type MS
* property[CoatInd].type from pqcmc-product-characteristic
* property[CoatInd].type = $NCIT#CoatInd "Coating Indicator"
* property[CoatInd].valueBoolean 1..1 MS
* property[CoatInd].valueBoolean ^short = "Product Coating Indicator"
* property[CoatInd].valueBoolean ^definition = "A property that identifies whether the drug product contains any coatings. [Source: SME Defined]"

* property[LayCnt].type MS
* property[LayCnt].type from pqcmc-product-characteristic
* property[LayCnt].type = $NCIT#TabLayCnt "Tablet Layer Count"
* property[LayCnt].value[x] 1..1 MS
* property[LayCnt].value[x] only Quantity
* property[LayCnt].valueQuantity.value ^short = "Product Tablet Layer Count"
* property[LayCnt].valueQuantity.value ^definition = """The total number of layers in the tablet. [Source: SME Defined]
Note: Non-layered tablets will be considered as one layer tablets."""
* property[LayCnt].valueQuantity.code = $NCIT#C66832 "1*"

* property[BeaTypCnt].type MS
* property[BeaTypCnt].type from pqcmc-product-characteristic
* property[BeaTypCnt].type = $NCIT#BeaTypCnt "Tablet Bead Type Count"
* property[BeaTypCnt].value[x] 1..1 MS
* property[BeaTypCnt].value[x] only Quantity
* property[BeaTypCnt].valueQuantity.value ^short = "Tablet Bead Type Count"
* property[BeaTypCnt].valueQuantity.value ^definition = """TThe total number of type of beads present in a tablet [Source: SME Defined]
Example: For the case of a 1- layer tablet containing 2 types of beads, Tablet Bead Type Count = 2.
"""
* property[BeaTypCnt].valueQuantity.code = $NCIT#C66832 "1*"

* property[CapClass].type MS
* property[CapClass].type from pqcmc-product-characteristic
* property[CapClass].type = $NCIT#CapClass "Capsule Classification Category"
* property[CapClass].valueCodeableConcept 1..1 MS
* property[CapClass].valueCodeableConcept ^short = "Capsule Shell Part Classification Category"
* property[CapClass].valueCodeableConcept ^definition = "Categorization of the capsule shell based on factors such as the shell’s barrier to water and oxygen, reactivity, and the material it is made of. [Source: SME Defined]"
* property[CapClass].valueCodeableConcept.coding from PqcmcCapsuleClassificationCategory

* property[CapConCnt].type MS
* property[CapConCnt].type from pqcmc-product-characteristic
* property[CapConCnt].type = $NCIT#CapConCnt "Capsule Constituent Count"
* property[CapConCnt].value[x] 1..1 MS
* property[CapConCnt].value[x] only Quantity
* property[CapConCnt].valueQuantity.value ^short = "Product Capsule Constituent Count"
* property[CapConCnt].valueQuantity.value ^definition = """The number of distinct constituents contained in the capsule shell of the drug product. [Source: SME Defined]
Example: For the case of a capsule shell filled with one type of bead and a minitablet, Constituent Type Count = 2.
"""
* property[CapConCnt].valueQuantity.code = $NCIT#C66832 "1*"

* property[Schematic].type MS
* property[Schematic].type from pqcmc-product-characteristic
* property[Schematic].type = $NCIT#Schematic "Product Schematic"
* property[Schematic].valueAttachment 1..1 MS
* property[Schematic].valueAttachment ^short = "Product Schematic"
* property[Schematic].valueAttachment ^definition = "The pictorial representation of the drug product. [Source: SME Defined]"

* property[WgtTyp].type MS
* property[WgtTyp].type from pqcmc-product-characteristic
* property[WgtTyp].type = $NCIT#WgtTyp "Product Weight Type"
* property[WgtTyp].valueCodeableConcept 1..1 MS
* property[WgtTyp].valueCodeableConcept ^short = "Product Weight Type"
* property[WgtTyp].valueCodeableConcept ^definition = """A physical (content) or activity measurement of the weight of the drug product unit. [Source: SME Defined]
Example: Mass, Activity"""
* property[WgtTyp].valueCodeableConcept.coding from PqcmcStrengthTypeTerminology

* property[TotWgtNum].type MS
* property[TotWgtNum].type from pqcmc-product-characteristic
* property[TotWgtNum].type = $NCIT#TotWgtNum "Product Total Weight Numeric Numerator"
* property[TotWgtNum].value[x] 1..1 MS
* property[TotWgtNum].value[x] only Quantity
* property[TotWgtNum].valueQuantity.value ^short = "Product Total Weight Numeric Numerator"
* property[TotWgtNum].valueQuantity.value ^definition = """Specifies the total quantity of all ingredients in a single unit of the drug product. [Source: SME Defined]
Note: a single unit of a solid oral dose form could be a tablet or a capsule"""
* property[TotWgtNum].valueQuantity.code from PqcmcUnitsMeasureTerminology

* property[TotWgtDen].type MS
* property[TotWgtDen].type from pqcmc-product-characteristic
* property[TotWgtDen].type = $NCIT#TotWgtDen "Product Total Weight Numeric Denominator"
* property[TotWgtDen].value[x] 1..1 MS
* property[TotWgtDen].value[x] only Quantity
* property[TotWgtDen].valueQuantity.value ^short = "Product Total Weight Numeric Denominator"
* property[TotWgtDen].valueQuantity.value ^definition = """Specifies the quantity of the ingredient (s) consistent with a single unit dose or as expressed on the label. [Source: SME Defined]
Note: For solid oral dose forms, by definition this is 1
"""
* property[TotWgtDen].valueQuantity.code from PqcmcUnitsMeasureTerminology
* property[TotWgtTxt].type MS
* property[TotWgtTxt].type from pqcmc-product-characteristic
* property[TotWgtTxt].type = $NCIT#TotWgtTxt "Total Weight Textual"
* property[TotWgtTxt].value[x] 1..1 MS
* property[TotWgtTxt].value[x] only markdown
* property[TotWgtTxt].valueMarkdown.value ^short = "Product Total Weight Textual"
* property[TotWgtTxt].valueMarkdown.value ^definition = """A written description of the weight of the drug product. [Source: SME Defined]
Note: This is typically applicable to biologics
Example: International Units for Enzymes"""
* property[TotWgtOper].type MS
* property[TotWgtOper].type from pqcmc-product-characteristic
* property[TotWgtOper].type = $NCIT#TotWgtOper "Total Weight Operator"
* property[TotWgtOper].valueCodeableConcept 1..1 MS
* property[TotWgtOper].valueCodeableConcept ^short = "Product Total Weight Operator"
* property[TotWgtOper].valueCodeableConcept ^definition = """A mathematical symbol that denotes equality or inequality between two values. [Source: SME Defined] Examples: LT, EQ, NMT.
Note: This is typically applicable to biologics.
"""
* property[TotWgtOper].valueCodeableConcept from PqcmcStrengthOperatorTerminology
* property[QualStd].type MS
* property[QualStd].type from pqcmc-product-characteristic
* property[QualStd].type = $NCIT#QualStd "Quality Standard"
* property[QualStd].valueCodeableConcept 1..1 MS  
* property[QualStd].valueCodeableConcept ^short = "Product Quality Standard"
* property[QualStd].valueCodeableConcept ^definition = """The established benchmark to which the component complies. [Source: SME Defined]
Examples: USP/NF, EP, Company Standard
"""
* property[QualStd].valueCodeableConcept from PqcmcQualityBenchmarkTerminology (required)

// Product parts
* component 1..* MS
* component obeys cmc-ppidref-required
* component.type 1..1 MS
* component.type ^short = "Product Part Type"
* component.type ^definition = """Identifies the kind of element, based on the design the applicant develops to achieve the desired drug product and overall release profile. [Source: SME Defined]
Example: Layer, Bead, Minitablet, Capsule Shell, Coating
"""
* component.type.coding from PqcmcProductPartType
* component.function.text 0..1 MS
* component.function.text ^short = "Product Part Function Description"
* component.function.text ^definition = """The main purpose for the part in the dosage form. [Source: SME Defined]
Example: In a two layer tablet with two APIs: Product Part Function Description for Layer 1 = Deliver API 1 and Product Part Function Description for Layer 2 = Deliver API 2
"""
* component.amount.value 1..1 MS
* component.amount.extension contains optional-denominator named WghtlDenom  0..1 MS	
* component.amount.value ^short = "Product Part Total Weight Numeric Numerator"
* component.amount.value ^definition = """Specifies the total quantity of all ingredients in a single part of the drug product. [Source: SME Defined]
Note: a single unit of a solid oral dose form could be a layer of a tablet or a minitablet in a capsule
"""
* component.amount.unit 1..1 MS
* component.amount.unit ^short = "Product Part Total Weight Numeric Numerator UOM"
* component.amount.unit ^definition = """The labeled unit of measure for the content of the drug product, expressed quantitatively per dosage unit. [Source: Adapted for NCI E C117055]
Example: mg
"""
* component.amount.code 1..1 MS
* component.amount.code from PqcmcUnitsMeasureTerminology

// ingredient
* component.constituent 1..* MS
* component.constituent obeys cmc-ingredient-functions
* component.constituent.extension contains content-percent named ConstituentPercent  1..1 MS	
* component.constituent.amount 1..1  MS
* component.constituent.amount.extension contains optional-denominator named OptionalDenom  0..1 MS	
* component.constituent.amount.value 1..1 MS
* component.constituent.amount.value ^short = "Product Part Ingredient Amount Numeric Numerator"
* component.constituent.amount.value ^definition = """Specifies the quantity of an ingredient in a single part of the drug product. [Source: SME Defined]
Note: a single part of a solid oral dose form could be a layer of a tablet or a minitablet in a capsule
Note: Amount can also be referred to as potency in biologics and other products.
"""
* component.constituent.amount.unit 1..1 MS
* component.constituent.amount.unit ^short = "Product Part Ingredient Amount Numeric Numerator UOM"
* component.constituent.amount.unit ^definition = """The labeled unit of measure for the content of an ingredient, expressed quantitatively per product part. [Source: Adapted for NCI EVS C117055]
"""
* component.constituent.amount.code 1..1 MS
* component.constituent.amount.code from PqcmcUnitsMeasureTerminology
* component.constituent.location 0..* MS
* component.constituent.location ^short = "Product Part Ingredient Physical Location"
* component.constituent.location ^definition = """Identifies where the ingredient physically resides within the product part. [Source: SME Defined]
Examples: Intragranular, Extra granular, Blend
"""
* component.constituent.location.coding 1..1 MS
* component.constituent.location.coding from PqcmcProductPartIngredientPhysicalLocation
* component.constituent.location.text 0..1 MS
* component.constituent.function 1..2 MS
* component.constituent.function.coding 1..1 MS
* component.constituent.function ^slicing.discriminator.type = #value // or #value
* component.constituent.function ^slicing.discriminator.path = "coding"
// * component.constituent.function ^slicing.ordered = true
* component.constituent.function ^slicing.rules = #closed
* component.constituent.function ^slicing.description = "Slice on the function coding"
* component.constituent.function contains
    Category 1..1 MS and
    Function 0..1 MS
* component.constituent.function[Category] ^short = "Product Part Ingredient Component Function Category"
* component.constituent.function[Category] ^definition = """A classification that identifies the higher level purpose of that material. [Source: SME Defined]
Example: Active Ingredient, Inactive Ingredient, Adjuvant."""
* component.constituent.function[Category].coding from PqcmcDrugProductComponentFunctionCategoryTerminology (required)
* component.constituent.function[Function] ^short = "Product Part Ingredient Function"
* component.constituent.function[Function] ^definition = """A sub-classification of part ingredients identifying its purpose/role in the drug product part (e.g., in the layer, bead, minitablet). [Source: SME Defined]
Examples: Filler, Surfactant"""
* component.constituent.function[Function].coding from PqcmcExcipientFunctionTerminology (required)
* component.constituent.hasIngredient 1..1 MS
* component.constituent.hasIngredient only CodeableReference(DrugProductComponent)
// Product part properties
* component.property 0..* MS
* component.property 1..* MS
* component.property ^slicing.discriminator.type = #value
* component.property ^slicing.discriminator.path = "type"
* component.property ^slicing.rules = #closed
* component.property ^slicing.description = "Slice based on value"
* component.property contains
    PPiD 1..1 MS and
    PPiDref 0..1 MS and
    RelsProf 1..1 MS and
    RelsMech 0..1 MS and
    CoatPurpose 0..* MS and
    Color 0..1 MS and
    ContPercent 1..1 MS and
    AddInfo 0..1 MS 
* component.property[PPiD].type MS
* component.property[PPiD].type = $NCIT#PPiD "Product Part Identifier"
* component.property[PPiD].value[x] 1..1 MS
* component.property[PPiD].value[x] only CodeableConcept
* component.property[PPiD].valueCodeableConcept.coding from CmcRelationshipTypesVS	
* component.property[PPiD].valueCodeableConcept.coding  ^short = "Product Part Role"
* component.property[PPiD].valueCodeableConcept.coding ^definition = """If the Product does not have parts the Product Part Role is 'Primary'.
If the Product does have parts and the Product Part does not have a Product Part Identifier Reference then the component is a 'Parent'.  
If the Product does have parts and there is a Product Part Identifier Reference the component  is a 'Child'.
"""
* component.property[PPiD].valueCodeableConcept.text 1..1 MS
* component.property[PPiD].valueCodeableConcept.text ^short = "Product Part Identifier"
* component.property[PPiD].valueCodeableConcept.text ^definition = """A submitter designated identifier that uniquely identifies the part within the drug product. [Source: SME Defined]
Examples: 1, A1, Red bead, Blue minitablet
"""
* component.property[PPiDref].type MS
* component.property[PPiDref].type = $NCIT#PPiDref "Product Part Identifier Reference"
* component.property[PPiDref].value[x] 1..1 MS
* component.property[PPiDref].value[x] only CodeableConcept
* component.property[PPiDref].valueCodeableConcept.text 1..1 MS
* component.property[PPiDref].valueCodeableConcept.text ^short = "Product Part Identifier Reference"
* component.property[PPiDref].valueCodeableConcept.text ^definition = """ Identifies the parent or outer-level product part. [Source: SME Defined]
Example: A bead (Product Part Identifier = “B1”) has a seal coating (Product Part Identifier = “SCoat”) and is contained in a Hard HPMC capsule shell (Product Part Identifier “Cap Shell”). For the seal coating, Product Part Identifier Reference = “B1”, because the seal coat is applied to the bead.
"""
* component.property[RelsProf].type MS
* component.property[RelsProf].type = $NCIT#RelsProf "Product Part Release Profile"
* component.property[RelsProf].value[x] 1..1 MS
* component.property[RelsProf].value[x] only CodeableConcept
* component.property[RelsProf].valueCodeableConcept ^short = "Product Part Release Profile"
* component.property[RelsProf].valueCodeableConcept ^definition = """The behavior in which drug substance migrates from the drug product part to the surrounding environment (e.g., biological fluids, dissolution media, etc.) [Source: SME Defined]"""
* component.property[RelsProf].valueCodeableConcept.coding from PqcmcReleaseProfile

* component.property[RelsMech].type = $NCIT#RelsMech "Product Part Release Mechanism"
* component.property[RelsMech].value[x] 1..1 MS
* component.property[RelsMech].value[x] only CodeableConcept
* component.property[RelsMech].valueCodeableConcept ^short = "Product Part Release Mechanism"
* component.property[RelsMech].valueCodeableConcept ^definition = """The method employed to realize the specified part release profile. [Source: SME Defined] Example: matrix or reservoir"""

* component.property[RelsMech].valueCodeableConcept.coding from PqcmcReleaseMechanism

* component.property[CoatPurpose].type MS
* component.property[CoatPurpose].type = $NCIT#CoatPurpose "Coating Product Part Purpose"
* component.property[CoatPurpose].value[x] 1..1 MS
* component.property[CoatPurpose].value[x] only CodeableConcept
* component.property[CoatPurpose].valueCodeableConcept ^short = "Coating Product Part Purpose"
* component.property[CoatPurpose].valueCodeableConcept ^definition = """
The reason the coating or covering was added. [Source: SME Defined]
Examples: rate-controlling, color, release type, protective, taste masking.
"""
* component.property[CoatPurpose].valueCodeableConcept.coding from PqcmcCoatingPurpose

* component.property[Color].type MS
* component.property[Color].type = $NCIT#Color "Product Part Color Description"
* component.property[Color].value[x] 1..1 MS
* component.property[Color].value[x] only CodeableConcept
* component.property[Color].valueCodeableConcept.text 1..1 MS
* component.property[Color].valueCodeableConcept.text ^short = "Product Part Color Description"
* component.property[Color].valueCodeableConcept.text ^definition = """The hue or the tint of the drug product part. [Source: SME Defined]
Examples: yellow, pink, blue, pale yellow."""

* component.property[ContPercent].type MS
* component.property[ContPercent].type = $NCIT#ContPercent "Product Part Content Percent"
* component.property[ContPercent].value[x] 1..1 MS
* component.property[ContPercent].value[x] only Quantity
* component.property[ContPercent].valueQuantity ^short = "Product Part Content Percent"
* component.property[ContPercent].valueQuantity ^definition = """The percentage of the drug product as a whole, that is represented by this part. [Source: SME Defined]
Example: total tablet weight = 400 mg, total weight of layer = 250 mg, then Content Percent for the layer = 62.5
"""
* component.property[AddInfo].type MS
* component.property[AddInfo].type = $NCIT#AddInfo "Product Part Additional Information"
* component.property[AddInfo].value[x] only markdown
* component.property[AddInfo].valueMarkdown ^short = "Product Part Additional Information"
* component.property[AddInfo].valueMarkdown ^definition = """A placeholder for providing any comments that are relevant to the drug product component. [Source: SME Defined] Examples: removed during process, adjusted for loss on drying.
Implementation note: This is represented in  markdown.  For multiple comments utilize markdwon formating for separation of notes.
"""
* component.component 0..* MS



Profile: RoutineDrugProduct
Parent: MedicinalProductDefinition
Id: pqcmc-routine-drug-product 
Title: "Routine Drug Product"
Description: "Includes the identifying information of the drug product. Profile of Drug Product profile."

* meta.profile 1..1 MS
* identifier 0..1 MS
* identifier ^short = "Optional user designated identifier"
* combinedPharmaceuticalDoseForm 1..1 MS
* combinedPharmaceuticalDoseForm.coding.code 1..1 MS
* combinedPharmaceuticalDoseForm.coding.code ^short = "Product Dosage Form"
* combinedPharmaceuticalDoseForm.coding.code ^definition = """The form in which active and/or inert ingredient(s) are physically presented as indicated on the packaging according to the USP. [Source: NCI EVS - C42636]
Examples: tablet, capsule, solution, cream, etc. that contains a drug substance generally, but not necessarily, in association with excipients. [Source: ICH Q1A(R2)] See also 21 CFR 314.3.
Note: If there is a new dosage form that does not exist in the controlled terminology, then propose this new dosage form during sponsor meetings with FDA.

SME comment -- this is the marketed dosage form
"""
* combinedPharmaceuticalDoseForm.coding.code from SplPharmaceuticalDosageFormTerminology (required)
* route 1..* MS
* route.coding.code 1..1 MS
* route.coding.code ^short = "Product Route of Administration"
* route.coding.code ^definition = "Designation of the part of the body through which or into which, or the way in which, the medicinal product is intended to be introduced. In some cases a medicinal product can be intended for more than one route and/or method of administration. [Source: NCI E C38114]"
* route.coding.code from SplDrugRouteofAdministrationTerminology (required)
* insert ProprietaryAndNonProprietaryNames
* name.usage.jurisdiction 0..0

Profile: DrugProductContainerClosure
Parent: MedicinalProductDefinition
Id: pqcmc-drugproduct-container-closure
Title: "Drug Product Container Closure"
Description: "Description and coding of the container closure system. Profile of Drug Product profile."

* meta.profile 1..1 MS
* .extension contains pq-container-closure-extension named containerClosure 1..* MS
* identifier 0..1 
* identifier ^short = "optional user designated identifier"	
* insert ProprietaryAndNonProprietaryNames
* name.usage.jurisdiction 0..0

Profile: DrugProductDescription
Parent: MedicinalProductDefinition
Id: pqcmc-drug-product-description
Title: "Drug Product Description"
Description: "Includes the properties of the drug product and components. Profile of Drug Product profile."

* meta.profile 1..1 MS
* identifier 0..1 
* identifier ^short = "optional user designated identifier"	
* description 0..1 MS
* description ^short = "Drug Product Description"
* description ^definition = """A textual narrative describing the drug product or products. [Source: SME Defined]
Examples: dosage form, container closure system, purpose."""
* combinedPharmaceuticalDoseForm 1..1 MS
  * coding 1..1 MS
  * coding ^short = "Product Dosage Form"
  * coding ^definition = """The form in which active and/or inert ingredient(s) are physically presented as indicated on the packaging according to the USP. [Source: NCI EVS - C42636]
Examples: tablet, capsule, solution, cream, etc. that contains a drug substance generally, but not necessarily, in association with excipients. [Source: ICH Q1A(R2)] See also 21 CFR 314.3.
Note: If there is a new dosage form that does not exist in the controlled terminology, then propose this new dosage form during sponsor meetings with FDA.

SME comment -- this is the marketed dosage form"""
  * coding  from SplPharmaceuticalDosageFormTerminology (required)
* route 0..1 MS
* route ^short = "Route of Administration"
* route ^definition = "Designation of the part of the body through which or into which, or the way in which, the medicinal product is intended to be introduced. In some cases a medicinal product can be intended for more than one route and/or method of administration. [Source: NCI E C38114]"
  * coding 1..1 MS
  * coding from SplDrugRouteofAdministrationTerminology (required)
* insert ProprietaryAndNonProprietaryNames
* name.usage.jurisdiction 0..0
* crossReference MS
* crossReference.product 
* crossReference.product ^short = "Co-Packaged Product"
* crossReference.product only CodeableReference(DrugProductDescription)

RuleSet: ProprietaryAndNonProprietaryNames
* name 1..2 MS
* name.productName 1..1 MS
* name.type 1..1 MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "type"
* name ^slicing.rules = #open
* name ^slicing.description = "Require non-proprietary name. Parts required if present in the non-proprietary name"
* name contains Proprietary 0..1 and NonProprietary 1..1
* name[Proprietary].type = $NameType#PROP "Proprietary"
* name[Proprietary].part 0..* MS
* name[Proprietary].part.part 1..1 MS
* name[Proprietary].part.type 1..1 MS
* name[Proprietary].part ^slicing.discriminator.type = #value
* name[Proprietary].part ^slicing.discriminator.path = "type"
* name[Proprietary].part ^slicing.rules = #open
* name[Proprietary].part ^slicing.description = "Optional name parts"
* name[Proprietary].part.type from PqcmcNamePartTerminology (required)
* name[NonProprietary].type = $NameType#NON "Non-Proprietary"
* name[NonProprietary].part 1..* MS
* name[NonProprietary].part ^definition = """Name Parts are a means of specifying a range of acceptable forms of the name of a product.
Note: The minimum is the scientific name.
"""
* name[NonProprietary].part.part 1..1 MS
* name[NonProprietary].part.type 1..1 MS
* name[NonProprietary].part ^slicing.discriminator.type = #value
* name[NonProprietary].part ^slicing.discriminator.path = "type"
* name[NonProprietary].part ^slicing.rules = #open
* name[NonProprietary].part ^slicing.description = "The scientific name part is required and all name parts if present"
//* name[NonProprietary].part.part contains Scientific 1..1 Invented 0..1 Formulation 0..1 Strength 0..1 Container 0..1 Form 0..1 Device 0..1
* name[NonProprietary].part contains 
  Scientific 1..* and
  Invented 0..* and 
  Formulation 0..* and 
  Strength 1..* and 
  Container 0..* and
  Form 0..* and 
  Device 0..*
* name[NonProprietary].part.type from PqcmcNamePartTerminology (required)
* name[NonProprietary].part[Scientific].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#SCI
* name[NonProprietary].part[Invented].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#INV
* name[NonProprietary].part[Formulation].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#FORMUL
* name[NonProprietary].part[Strength].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#STR
* name[NonProprietary].part[Container].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#CON
* name[NonProprietary].part[Form].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#FRM
* name[NonProprietary].part[Device].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#DEV
