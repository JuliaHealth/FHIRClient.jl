module R4Types

import Dates
import JSON3
import SaferIntegers
import StructTypes
import TimeZones

abstract type AbstractFHIRType
end

abstract type AbstractResource <: AbstractFHIRType
end

const Date = Dates.Date
const DateTime = Dates.DateTime
const SafeInt32 = SaferIntegers.SafeInt32
const Time = Dates.Time
const ZonedDateTime = TimeZones.ZonedDateTime
const string_fhir = String

# const FHIRNumber = Float64
const FHIRInt32 = SafeInt32

struct FHIRNumber <: AbstractFHIRType
    value::String
end
@inline Base.getindex(x::FHIRNumber) = x.value::String
@inline StructTypes.StructType(::Type{T}) where {T <: FHIRNumber} = JSON3.RawType()
@inline StructTypes.construct(::Type{T}, x::JSON3.RawValue) where {T <: FHIRNumber} = FHIRNumber(unsafe_string(pointer(x.bytes, x.pos), x.len))
@inline JSON3.rawbytes(x::FHIRNumber) = codeunits(x.value)

abstract type AbstractContainer{T} <: AbstractFHIRType
end

struct ResourceList
end

mutable struct Count <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comparator::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _unit::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    comparator::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    unit::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Count} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Count} = (:id,:extension,:value,:_value,:comparator,:_comparator,:unit,:_unit,:system,:_system,:code,:_code,)



mutable struct Coding <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _userSelected::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    code::Union{String, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    userSelected::Union{Bool, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Coding} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Coding} = (:id,:extension,:system,:_system,:version,:_version,:code,:_code,:display,:_display,:userSelected,:_userSelected,)



mutable struct Duration <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comparator::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _unit::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    comparator::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    unit::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Duration} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Duration} = (:id,:extension,:value,:_value,:comparator,:_comparator,:unit,:_unit,:system,:_system,:code,:_code,)



mutable struct DataRequirement_Sort <: AbstractFHIRType
    _direction::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    direction::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DataRequirement_Sort} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DataRequirement_Sort} = (:id,:extension,:modifierExtension,:path,:_path,:direction,:_direction,)



mutable struct Attachment <: AbstractFHIRType
    _contentType::Union{Element, Nothing}
    _creation::Union{Element, Nothing}
    _data::Union{Element, Nothing}
    _hash::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _size::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    contentType::Union{String, Nothing}
    creation::Union{Union{DateTime, ZonedDateTime}, Nothing}
    data::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    hash::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{String, Nothing}
    size::Union{SafeInt32, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Attachment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Attachment} = (:id,:extension,:contentType,:_contentType,:language,:_language,:data,:_data,:url,:_url,:size,:_size,:hash,:_hash,:title,:_title,:creation,:_creation,)



mutable struct Money <: AbstractFHIRType
    _currency::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    currency::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Money} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Money} = (:id,:extension,:value,:_value,:currency,:_currency,)



mutable struct ParameterDefinition <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    name::Union{String, Nothing}
    profile::Union{String, Nothing}
    type::Union{String, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ParameterDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ParameterDefinition} = (:id,:extension,:name,:_name,:use,:_use,:min,:_min,:max,:_max,:documentation,:_documentation,:type,:_type,:profile,)



mutable struct Distance <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comparator::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _unit::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    comparator::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    unit::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Distance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Distance} = (:id,:extension,:value,:_value,:comparator,:_comparator,:unit,:_unit,:system,:_system,:code,:_code,)



mutable struct Age <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comparator::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _unit::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    comparator::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    unit::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Age} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Age} = (:id,:extension,:value,:_value,:comparator,:_comparator,:unit,:_unit,:system,:_system,:code,:_code,)



mutable struct Expression <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _reference::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{String, Nothing}
    name::Union{String, Nothing}
    reference::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Expression} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Expression} = (:id,:extension,:description,:_description,:name,:_name,:language,:_language,:expression,:_expression,:reference,:_reference,)



mutable struct Quantity <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comparator::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _unit::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    comparator::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    system::Union{String, Nothing}
    unit::Union{string_fhir, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Quantity} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Quantity} = (:id,:extension,:value,:_value,:comparator,:_comparator,:unit,:_unit,:system,:_system,:code,:_code,)



mutable struct Period <: AbstractFHIRType
    _end::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    end::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    start::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Period} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Period} = (:id,:extension,:start,:_start,:end,:_end,)



mutable struct Reference <: AbstractFHIRType
    _display::Union{Element, Nothing}
    _reference::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    reference::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Reference} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Reference} = (:id,:extension,:reference,:_reference,:type,:_type,:identifier,:display,:_display,)



mutable struct ContactPoint <: AbstractFHIRType
    _rank::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    period::Union{Period, Nothing}
    rank::Union{SafeInt32, Nothing}
    system::Union{String, Nothing}
    use::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ContactPoint} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ContactPoint} = (:id,:extension,:system,:_system,:value,:_value,:use,:_use,:rank,:_rank,:period,)



mutable struct DataRequirement_DateFilter <: AbstractFHIRType
    _path::Union{Element, Nothing}
    _searchParam::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
    searchParam::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDuration::Union{Duration, Nothing}
    valuePeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DataRequirement_DateFilter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DataRequirement_DateFilter} = (:id,:extension,:modifierExtension,:path,:_path,:searchParam,:_searchParam,:valueDateTime,:_valueDateTime,:valuePeriod,:valueDuration,)



mutable struct DataRequirement_CodeFilter <: AbstractFHIRType
    _path::Union{Element, Nothing}
    _searchParam::Union{Element, Nothing}
    code::Union{Vector{Coding}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
    searchParam::Union{string_fhir, Nothing}
    valueSet::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DataRequirement_CodeFilter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DataRequirement_CodeFilter} = (:id,:extension,:modifierExtension,:path,:_path,:searchParam,:_searchParam,:valueSet,:code,)



mutable struct Range <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    high::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    low::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Range} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Range} = (:id,:extension,:low,:high,)



mutable struct RelatedArtifact <: AbstractFHIRType
    _citation::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    _label::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    citation::Union{String, Nothing}
    display::Union{string_fhir, Nothing}
    document::Union{Attachment, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    label::Union{string_fhir, Nothing}
    resource::Union{String, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RelatedArtifact} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RelatedArtifact} = (:id,:extension,:type,:_type,:label,:_label,:display,:_display,:citation,:_citation,:url,:_url,:document,:resource,)



mutable struct Signature <: AbstractFHIRType
    _data::Union{Element, Nothing}
    _sigFormat::Union{Element, Nothing}
    _targetFormat::Union{Element, Nothing}
    _when::Union{Element, Nothing}
    data::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    onBehalfOf::Union{Reference, Nothing}
    sigFormat::Union{String, Nothing}
    targetFormat::Union{String, Nothing}
    type::Union{Vector{Coding}, Nothing}
    when::Union{Union{DateTime, ZonedDateTime}, Nothing}
    who::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Signature} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Signature} = (:id,:extension,:type,:when,:_when,:who,:onBehalfOf,:targetFormat,:_targetFormat,:sigFormat,:_sigFormat,:data,:_data,)



mutable struct Ratio <: AbstractFHIRType
    denominator::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    numerator::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Ratio} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Ratio} = (:id,:extension,:numerator,:denominator,)



mutable struct Address <: AbstractFHIRType
    _city::Union{Element, Nothing}
    _country::Union{Element, Nothing}
    _district::Union{Element, Nothing}
    _line::Union{Vector{Element}, Nothing}
    _postalCode::Union{Element, Nothing}
    _state::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    city::Union{string_fhir, Nothing}
    country::Union{string_fhir, Nothing}
    district::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    line::Union{Vector{string_fhir}, Nothing}
    period::Union{Period, Nothing}
    postalCode::Union{string_fhir, Nothing}
    state::Union{string_fhir, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Address} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Address} = (:id,:extension,:use,:_use,:type,:_type,:text,:_text,:line,:_line,:city,:_city,:district,:_district,:state,:_state,:postalCode,:_postalCode,:country,:_country,:period,)



mutable struct CodeableConcept <: AbstractFHIRType
    _text::Union{Element, Nothing}
    coding::Union{Vector{Coding}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    text::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeableConcept} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeableConcept} = (:id,:extension,:coding,:text,:_text,)



mutable struct Annotation <: AbstractFHIRType
    _authorString::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    _time::Union{Element, Nothing}
    authorReference::Union{Reference, Nothing}
    authorString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    time::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Annotation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Annotation} = (:id,:extension,:authorReference,:authorString,:_authorString,:time,:_time,:text,:_text,)



mutable struct Meta <: AbstractFHIRType
    _lastUpdated::Union{Element, Nothing}
    _source::Union{Element, Nothing}
    _versionId::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    lastUpdated::Union{Union{DateTime, ZonedDateTime}, Nothing}
    profile::Union{Vector{String}, Nothing}
    security::Union{Vector{Coding}, Nothing}
    source::Union{String, Nothing}
    tag::Union{Vector{Coding}, Nothing}
    versionId::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Meta} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Meta} = (:id,:extension,:versionId,:_versionId,:lastUpdated,:_lastUpdated,:source,:_source,:profile,:security,:tag,)



mutable struct SampledData <: AbstractFHIRType
    _data::Union{Element, Nothing}
    _dimensions::Union{Element, Nothing}
    _factor::Union{Element, Nothing}
    _lowerLimit::Union{Element, Nothing}
    _period::Union{Element, Nothing}
    _upperLimit::Union{Element, Nothing}
    data::Union{string_fhir, Nothing}
    dimensions::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    lowerLimit::Union{FHIRNumber, Nothing}
    origin::Union{Quantity, Nothing}
    period::Union{FHIRNumber, Nothing}
    upperLimit::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SampledData} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SampledData} = (:id,:extension,:origin,:period,:_period,:factor,:_factor,:lowerLimit,:_lowerLimit,:upperLimit,:_upperLimit,:dimensions,:_dimensions,:data,:_data,)



mutable struct HumanName <: AbstractFHIRType
    _family::Union{Element, Nothing}
    _given::Union{Vector{Element}, Nothing}
    _prefix::Union{Vector{Element}, Nothing}
    _suffix::Union{Vector{Element}, Nothing}
    _text::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    family::Union{string_fhir, Nothing}
    given::Union{Vector{string_fhir}, Nothing}
    id::Union{string_fhir, Nothing}
    period::Union{Period, Nothing}
    prefix::Union{Vector{string_fhir}, Nothing}
    suffix::Union{Vector{string_fhir}, Nothing}
    text::Union{string_fhir, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: HumanName} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: HumanName} = (:id,:extension,:use,:_use,:text,:_text,:family,:_family,:given,:_given,:prefix,:_prefix,:suffix,:_suffix,:period,)



mutable struct Timing_Repeat <: AbstractFHIRType
    _count::Union{Element, Nothing}
    _countMax::Union{Element, Nothing}
    _dayOfWeek::Union{Vector{Element}, Nothing}
    _duration::Union{Element, Nothing}
    _durationMax::Union{Element, Nothing}
    _durationUnit::Union{Element, Nothing}
    _frequency::Union{Element, Nothing}
    _frequencyMax::Union{Element, Nothing}
    _offset::Union{Element, Nothing}
    _period::Union{Element, Nothing}
    _periodMax::Union{Element, Nothing}
    _periodUnit::Union{Element, Nothing}
    _timeOfDay::Union{Vector{Element}, Nothing}
    _when::Union{Vector{Element}, Nothing}
    boundsDuration::Union{Duration, Nothing}
    boundsPeriod::Union{Period, Nothing}
    boundsRange::Union{Range, Nothing}
    count::Union{SafeInt32, Nothing}
    countMax::Union{SafeInt32, Nothing}
    dayOfWeek::Union{Vector{String}, Nothing}
    duration::Union{FHIRNumber, Nothing}
    durationMax::Union{FHIRNumber, Nothing}
    durationUnit::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    frequency::Union{SafeInt32, Nothing}
    frequencyMax::Union{SafeInt32, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    offset::Union{SafeInt32, Nothing}
    period::Union{FHIRNumber, Nothing}
    periodMax::Union{FHIRNumber, Nothing}
    periodUnit::Union{String, Nothing}
    timeOfDay::Union{Vector{Time}, Nothing}
    when::Union{Vector{String}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Timing_Repeat} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Timing_Repeat} = (:id,:extension,:modifierExtension,:boundsDuration,:boundsRange,:boundsPeriod,:count,:_count,:countMax,:_countMax,:duration,:_duration,:durationMax,:_durationMax,:durationUnit,:_durationUnit,:frequency,:_frequency,:frequencyMax,:_frequencyMax,:period,:_period,:periodMax,:_periodMax,:periodUnit,:_periodUnit,:dayOfWeek,:_dayOfWeek,:timeOfDay,:_timeOfDay,:when,:_when,:offset,:_offset,)



mutable struct Identifier <: AbstractFHIRType
    _system::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    assigner::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    period::Union{Period, Nothing}
    system::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    use::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Identifier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Identifier} = (:id,:extension,:use,:_use,:type,:system,:_system,:value,:_value,:period,:assigner,)



mutable struct UsageContext <: AbstractFHIRType
    code::Union{Coding, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueReference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: UsageContext} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: UsageContext} = (:id,:extension,:code,:valueCodeableConcept,:valueQuantity,:valueRange,:valueReference,)



mutable struct Dosage_DoseAndRate <: AbstractFHIRType
    doseQuantity::Union{Quantity, Nothing}
    doseRange::Union{Range, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    rateQuantity::Union{Quantity, Nothing}
    rateRange::Union{Range, Nothing}
    rateRatio::Union{Ratio, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Dosage_DoseAndRate} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Dosage_DoseAndRate} = (:id,:extension,:modifierExtension,:type,:doseRange,:doseQuantity,:rateRatio,:rateRange,:rateQuantity,)



mutable struct DataRequirement <: AbstractFHIRType
    _limit::Union{Element, Nothing}
    _mustSupport::Union{Vector{Element}, Nothing}
    _type::Union{Element, Nothing}
    codeFilter::Union{Vector{DataRequirement_CodeFilter}, Nothing}
    dateFilter::Union{Vector{DataRequirement_DateFilter}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    limit::Union{SafeInt32, Nothing}
    mustSupport::Union{Vector{string_fhir}, Nothing}
    profile::Union{Vector{String}, Nothing}
    sort::Union{Vector{DataRequirement_Sort}, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DataRequirement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DataRequirement} = (:id,:extension,:type,:_type,:profile,:subjectCodeableConcept,:subjectReference,:mustSupport,:_mustSupport,:codeFilter,:dateFilter,:limit,:_limit,:sort,)



mutable struct ContactDetail <: AbstractFHIRType
    _name::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    name::Union{string_fhir, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ContactDetail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ContactDetail} = (:id,:extension,:name,:_name,:telecom,)



mutable struct Contributor <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contributor} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contributor} = (:id,:extension,:type,:_type,:name,:_name,:contact,)



mutable struct Timing <: AbstractFHIRType
    _event::Union{Vector{Element}, Nothing}
    code::Union{CodeableConcept, Nothing}
    event::Union{Vector{Union{DateTime, ZonedDateTime}}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    repeat::Union{Timing_Repeat, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Timing} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Timing} = (:id,:extension,:modifierExtension,:event,:_event,:repeat,:code,)



mutable struct TriggerDefinition <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _timingDate::Union{Element, Nothing}
    _timingDateTime::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    condition::Union{Expression, Nothing}
    data::Union{Vector{DataRequirement}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    name::Union{string_fhir, Nothing}
    timingDate::Union{string_fhir, Nothing}
    timingDateTime::Union{string_fhir, Nothing}
    timingReference::Union{Reference, Nothing}
    timingTiming::Union{Timing, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TriggerDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TriggerDefinition} = (:id,:extension,:type,:_type,:name,:_name,:timingTiming,:timingReference,:timingDate,:_timingDate,:timingDateTime,:_timingDateTime,:data,:condition,)



mutable struct Dosage <: AbstractFHIRType
    _asNeededBoolean::Union{Element, Nothing}
    _patientInstruction::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    additionalInstruction::Union{Vector{CodeableConcept}, Nothing}
    asNeededBoolean::Union{Bool, Nothing}
    asNeededCodeableConcept::Union{CodeableConcept, Nothing}
    doseAndRate::Union{Vector{Dosage_DoseAndRate}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    maxDosePerAdministration::Union{Quantity, Nothing}
    maxDosePerLifetime::Union{Quantity, Nothing}
    maxDosePerPeriod::Union{Ratio, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patientInstruction::Union{string_fhir, Nothing}
    route::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    site::Union{CodeableConcept, Nothing}
    text::Union{string_fhir, Nothing}
    timing::Union{Timing, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Dosage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Dosage} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:text,:_text,:additionalInstruction,:patientInstruction,:_patientInstruction,:timing,:asNeededBoolean,:_asNeededBoolean,:asNeededCodeableConcept,:site,:route,:method,:doseAndRate,:maxDosePerPeriod,:maxDosePerAdministration,:maxDosePerLifetime,)



mutable struct Extension <: AbstractFHIRType
    _url::Union{Element, Nothing}
    _valueBase64Binary::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCanonical::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInstant::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueMarkdown::Union{Element, Nothing}
    _valueOid::Union{Element, Nothing}
    _valuePositiveInt::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUnsignedInt::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    _valueUrl::Union{Element, Nothing}
    _valueUuid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    valueAddress::Union{Address, Nothing}
    valueAge::Union{Age, Nothing}
    valueAnnotation::Union{Annotation, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCanonical::Union{string_fhir, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueContactDetail::Union{ContactDetail, Nothing}
    valueContactPoint::Union{ContactPoint, Nothing}
    valueContributor::Union{Contributor, Nothing}
    valueCount::Union{Count, Nothing}
    valueDataRequirement::Union{DataRequirement, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueDistance::Union{Distance, Nothing}
    valueDosage::Union{Dosage, Nothing}
    valueDuration::Union{Duration, Nothing}
    valueExpression::Union{Expression, Nothing}
    valueHumanName::Union{HumanName, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueIdentifier::Union{Identifier, Nothing}
    valueInstant::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueMarkdown::Union{string_fhir, Nothing}
    valueMeta::Union{Meta, Nothing}
    valueMoney::Union{Money, Nothing}
    valueOid::Union{string_fhir, Nothing}
    valueParameterDefinition::Union{ParameterDefinition, Nothing}
    valuePeriod::Union{Period, Nothing}
    valuePositiveInt::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueReference::Union{Reference, Nothing}
    valueRelatedArtifact::Union{RelatedArtifact, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueSignature::Union{Signature, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueTiming::Union{Timing, Nothing}
    valueTriggerDefinition::Union{TriggerDefinition, Nothing}
    valueUnsignedInt::Union{FHIRInt32, Nothing}
    valueUri::Union{string_fhir, Nothing}
    valueUrl::Union{string_fhir, Nothing}
    valueUsageContext::Union{UsageContext, Nothing}
    valueUuid::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Extension} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Extension} = (:id,:extension,:url,:_url,:valueBase64Binary,:_valueBase64Binary,:valueBoolean,:_valueBoolean,:valueCanonical,:_valueCanonical,:valueCode,:_valueCode,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,:valueId,:_valueId,:valueInstant,:_valueInstant,:valueInteger,:_valueInteger,:valueMarkdown,:_valueMarkdown,:valueOid,:_valueOid,:valuePositiveInt,:_valuePositiveInt,:valueString,:_valueString,:valueTime,:_valueTime,:valueUnsignedInt,:_valueUnsignedInt,:valueUri,:_valueUri,:valueUrl,:_valueUrl,:valueUuid,:_valueUuid,:valueAddress,:valueAge,:valueAnnotation,:valueAttachment,:valueCodeableConcept,:valueCoding,:valueContactPoint,:valueCount,:valueDistance,:valueDuration,:valueHumanName,:valueIdentifier,:valueMoney,:valuePeriod,:valueQuantity,:valueRange,:valueRatio,:valueReference,:valueSampledData,:valueSignature,:valueTiming,:valueContactDetail,:valueContributor,:valueDataRequirement,:valueExpression,:valueParameterDefinition,:valueRelatedArtifact,:valueTriggerDefinition,:valueUsageContext,:valueDosage,:valueMeta,)



mutable struct Contract_Legal <: AbstractFHIRType
    contentAttachment::Union{Attachment, Nothing}
    contentReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Legal} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Legal} = (:id,:extension,:modifierExtension,:contentAttachment,:contentReference,)



mutable struct DetectedIssue_Evidence <: AbstractFHIRType
    code::Union{Vector{CodeableConcept}, Nothing}
    detail::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DetectedIssue_Evidence} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DetectedIssue_Evidence} = (:id,:extension,:modifierExtension,:code,:detail,)



mutable struct MedicationKnowledge_Kinetics <: AbstractFHIRType
    areaUnderCurve::Union{Vector{Quantity}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    halfLifePeriod::Union{Duration, Nothing}
    id::Union{string_fhir, Nothing}
    lethalDose50::Union{Vector{Quantity}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Kinetics} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Kinetics} = (:id,:extension,:modifierExtension,:areaUnderCurve,:lethalDose50,:halfLifePeriod,)



mutable struct EffectEvidenceSynthesis_CertaintySubcomponent <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    rating::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_CertaintySubcomponent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_CertaintySubcomponent} = (:id,:extension,:modifierExtension,:type,:rating,:note,)



mutable struct Contract_Signer <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    party::Union{Reference, Nothing}
    signature::Union{Vector{Signature}, Nothing}
    type::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Signer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Signer} = (:id,:extension,:modifierExtension,:type,:party,:signature,)



mutable struct InsurancePlan_Contact <: AbstractFHIRType
    address::Union{Address, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{HumanName, Nothing}
    purpose::Union{CodeableConcept, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Contact} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Contact} = (:id,:extension,:modifierExtension,:purpose,:name,:telecom,:address,)



mutable struct CoverageEligibilityRequest_Diagnosis <: AbstractFHIRType
    diagnosisCodeableConcept::Union{CodeableConcept, Nothing}
    diagnosisReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityRequest_Diagnosis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityRequest_Diagnosis} = (:id,:extension,:modifierExtension,:diagnosisCodeableConcept,:diagnosisReference,)



mutable struct ImagingStudy_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImagingStudy_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImagingStudy_Performer} = (:id,:extension,:modifierExtension,:function,:actor,)



mutable struct DeviceDefinition_Property <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueCode::Union{Vector{CodeableConcept}, Nothing}
    valueQuantity::Union{Vector{Quantity}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_Property} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_Property} = (:id,:extension,:modifierExtension,:type,:valueQuantity,:valueCode,)



mutable struct Element <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Element} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Element} = (:id,:extension,)



mutable struct Procedure_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onBehalfOf::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Procedure_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Procedure_Performer} = (:id,:extension,:modifierExtension,:function,:actor,:onBehalfOf,)



mutable struct ClaimResponse_Total <: AbstractFHIRType
    amount::Union{Money, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Total} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Total} = (:id,:extension,:modifierExtension,:category,:amount,)



mutable struct Contract_Rule <: AbstractFHIRType
    contentAttachment::Union{Attachment, Nothing}
    contentReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Rule} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Rule} = (:id,:extension,:modifierExtension,:contentAttachment,:contentReference,)



mutable struct MedicationKnowledge_RelatedMedicationKnowledge <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Vector{Reference}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_RelatedMedicationKnowledge} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_RelatedMedicationKnowledge} = (:id,:extension,:modifierExtension,:type,:reference,)



mutable struct MedicinalProduct_CountryLanguage <: AbstractFHIRType
    country::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    jurisdiction::Union{CodeableConcept, Nothing}
    language::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct_CountryLanguage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct_CountryLanguage} = (:id,:extension,:modifierExtension,:country,:jurisdiction,:language,)



mutable struct DocumentReference_Context <: AbstractFHIRType
    encounter::Union{Vector{Reference}, Nothing}
    event::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    facilityType::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    practiceSetting::Union{CodeableConcept, Nothing}
    related::Union{Vector{Reference}, Nothing}
    sourcePatientInfo::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentReference_Context} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentReference_Context} = (:id,:extension,:modifierExtension,:encounter,:event,:period,:facilityType,:practiceSetting,:sourcePatientInfo,:related,)



mutable struct MedicinalProductPharmaceutical_Characteristics <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    status::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPharmaceutical_Characteristics} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPharmaceutical_Characteristics} = (:id,:extension,:modifierExtension,:code,:status,)



mutable struct SubstanceReferenceInformation_GeneElement <: AbstractFHIRType
    element::Union{Identifier, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Vector{Reference}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceReferenceInformation_GeneElement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceReferenceInformation_GeneElement} = (:id,:extension,:modifierExtension,:type,:element,:source,)



mutable struct Coverage_Exception <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Coverage_Exception} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Coverage_Exception} = (:id,:extension,:modifierExtension,:type,:period,)



mutable struct CoverageEligibilityResponse_Error <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityResponse_Error} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityResponse_Error} = (:id,:extension,:modifierExtension,:code,)



mutable struct MedicinalProductContraindication_OtherTherapy <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    therapyRelationshipType::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductContraindication_OtherTherapy} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductContraindication_OtherTherapy} = (:id,:extension,:modifierExtension,:therapyRelationshipType,:medicationCodeableConcept,:medicationReference,)



mutable struct MedicationKnowledge_Dosage <: AbstractFHIRType
    dosage::Union{Vector{Dosage}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Dosage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Dosage} = (:id,:extension,:modifierExtension,:type,:dosage,)



mutable struct Consent_Actor <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Reference, Nothing}
    role::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent_Actor} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent_Actor} = (:id,:extension,:modifierExtension,:role,:reference,)



mutable struct Invoice_Participant <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    role::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Invoice_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Invoice_Participant} = (:id,:extension,:modifierExtension,:role,:actor,)



mutable struct CareTeam_Participant <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    member::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onBehalfOf::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    role::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CareTeam_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CareTeam_Participant} = (:id,:extension,:modifierExtension,:role,:member,:onBehalfOf,:period,)



mutable struct Claim_Related <: AbstractFHIRType
    claim::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Identifier, Nothing}
    relationship::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Related} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Related} = (:id,:extension,:modifierExtension,:claim,:relationship,:reference,)



mutable struct SupplyDelivery_SuppliedItem <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SupplyDelivery_SuppliedItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SupplyDelivery_SuppliedItem} = (:id,:extension,:modifierExtension,:quantity,:itemCodeableConcept,:itemReference,)



mutable struct SpecimenDefinition_Additive <: AbstractFHIRType
    additiveCodeableConcept::Union{CodeableConcept, Nothing}
    additiveReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SpecimenDefinition_Additive} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SpecimenDefinition_Additive} = (:id,:extension,:modifierExtension,:additiveCodeableConcept,:additiveReference,)



mutable struct ChargeItem_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItem_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItem_Performer} = (:id,:extension,:modifierExtension,:function,:actor,)



mutable struct Claim_Payee <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    party::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Payee} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Payee} = (:id,:extension,:modifierExtension,:type,:party,)



mutable struct Substance_Ingredient <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Ratio, Nothing}
    substanceCodeableConcept::Union{CodeableConcept, Nothing}
    substanceReference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Substance_Ingredient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Substance_Ingredient} = (:id,:extension,:modifierExtension,:quantity,:substanceCodeableConcept,:substanceReference,)



mutable struct MedicationKnowledge_MaxDispense <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Duration, Nothing}
    quantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_MaxDispense} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_MaxDispense} = (:id,:extension,:modifierExtension,:quantity,:period,)



mutable struct MedicationKnowledge_Packaging <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Packaging} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Packaging} = (:id,:extension,:modifierExtension,:type,:quantity,)



mutable struct Condition_Evidence <: AbstractFHIRType
    code::Union{Vector{CodeableConcept}, Nothing}
    detail::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Condition_Evidence} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Condition_Evidence} = (:id,:extension,:modifierExtension,:code,:detail,)



mutable struct MedicinalProductInteraction_Interactant <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductInteraction_Interactant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductInteraction_Interactant} = (:id,:extension,:modifierExtension,:itemReference,:itemCodeableConcept,)



mutable struct Procedure_FocalDevice <: AbstractFHIRType
    action::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    manipulated::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Procedure_FocalDevice} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Procedure_FocalDevice} = (:id,:extension,:modifierExtension,:action,:manipulated,)



mutable struct ExplanationOfBenefit_Total <: AbstractFHIRType
    amount::Union{Money, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Total} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Total} = (:id,:extension,:modifierExtension,:category,:amount,)



mutable struct NutritionOrder_Administration <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
    rateQuantity::Union{Quantity, Nothing}
    rateRatio::Union{Ratio, Nothing}
    schedule::Union{Timing, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_Administration} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_Administration} = (:id,:extension,:modifierExtension,:schedule,:quantity,:rateQuantity,:rateRatio,)



mutable struct Population <: AbstractFHIRType
    ageCodeableConcept::Union{CodeableConcept, Nothing}
    ageRange::Union{Range, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    physiologicalCondition::Union{CodeableConcept, Nothing}
    race::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Population} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Population} = (:id,:extension,:modifierExtension,:ageRange,:ageCodeableConcept,:gender,:race,:physiologicalCondition,)



mutable struct ExplanationOfBenefit_Payee <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    party::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Payee} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Payee} = (:id,:extension,:modifierExtension,:type,:party,)



mutable struct Immunization_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Immunization_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Immunization_Performer} = (:id,:extension,:modifierExtension,:function,:actor,)



mutable struct RiskEvidenceSynthesis_CertaintySubcomponent <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    rating::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis_CertaintySubcomponent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis_CertaintySubcomponent} = (:id,:extension,:modifierExtension,:type,:rating,:note,)



mutable struct MedicinalProductAuthorization_JurisdictionalAuthorization <: AbstractFHIRType
    country::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    legalStatusOfSupply::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    validityPeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductAuthorization_JurisdictionalAuthorization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductAuthorization_JurisdictionalAuthorization} = (:id,:extension,:modifierExtension,:identifier,:country,:jurisdiction,:legalStatusOfSupply,:validityPeriod,)



mutable struct Organization_Contact <: AbstractFHIRType
    address::Union{Address, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{HumanName, Nothing}
    purpose::Union{CodeableConcept, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Organization_Contact} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Organization_Contact} = (:id,:extension,:modifierExtension,:purpose,:name,:telecom,:address,)



mutable struct MedicinalProductPackaged_BatchIdentifier <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    immediatePackaging::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outerPackaging::Union{Identifier, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPackaged_BatchIdentifier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPackaged_BatchIdentifier} = (:id,:extension,:modifierExtension,:outerPackaging,:immediatePackaging,)



mutable struct SubstanceAmount_ReferenceRange <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    highLimit::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    lowLimit::Union{Quantity, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceAmount_ReferenceRange} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceAmount_ReferenceRange} = (:id,:extension,:modifierExtension,:lowLimit,:highLimit,)



mutable struct Condition_Stage <: AbstractFHIRType
    assessment::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    summary::Union{CodeableConcept, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Condition_Stage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Condition_Stage} = (:id,:extension,:modifierExtension,:summary,:assessment,:type,)



mutable struct ExplanationOfBenefit_Related <: AbstractFHIRType
    claim::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Identifier, Nothing}
    relationship::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Related} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Related} = (:id,:extension,:modifierExtension,:claim,:relationship,:reference,)



mutable struct MedicationKnowledge_Monograph <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Monograph} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Monograph} = (:id,:extension,:modifierExtension,:type,:source,)



mutable struct DocumentReference_Content <: AbstractFHIRType
    attachment::Union{Attachment, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    format::Union{Coding, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentReference_Content} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentReference_Content} = (:id,:extension,:modifierExtension,:attachment,:format,)



mutable struct ClinicalImpression_Investigation <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    item::Union{Vector{Reference}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClinicalImpression_Investigation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClinicalImpression_Investigation} = (:id,:extension,:modifierExtension,:code,:item,)



mutable struct MedicationKnowledge_MedicineClassification <: AbstractFHIRType
    classification::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_MedicineClassification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_MedicineClassification} = (:id,:extension,:modifierExtension,:type,:classification,)



mutable struct MedicationRequest_InitialFill <: AbstractFHIRType
    duration::Union{Duration, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationRequest_InitialFill} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationRequest_InitialFill} = (:id,:extension,:modifierExtension,:quantity,:duration,)



mutable struct MedicationAdministration_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationAdministration_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationAdministration_Performer} = (:id,:extension,:modifierExtension,:function,:actor,)



mutable struct SubstanceReferenceInformation_Classification <: AbstractFHIRType
    classification::Union{CodeableConcept, Nothing}
    domain::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Vector{Reference}, Nothing}
    subtype::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceReferenceInformation_Classification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceReferenceInformation_Classification} = (:id,:extension,:modifierExtension,:domain,:classification,:subtype,:source,)



mutable struct Encounter_Participant <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    individual::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_Participant} = (:id,:extension,:modifierExtension,:type,:period,:individual,)



mutable struct Composition_Event <: AbstractFHIRType
    code::Union{Vector{CodeableConcept}, Nothing}
    detail::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Composition_Event} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Composition_Event} = (:id,:extension,:modifierExtension,:code,:period,:detail,)



mutable struct Encounter_ClassHistory <: AbstractFHIRType
    class::Union{Coding, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_ClassHistory} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_ClassHistory} = (:id,:extension,:modifierExtension,:class,:period,)



mutable struct MedicinalProductIndication_OtherTherapy <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    therapyRelationshipType::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIndication_OtherTherapy} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIndication_OtherTherapy} = (:id,:extension,:modifierExtension,:therapyRelationshipType,:medicationCodeableConcept,:medicationReference,)



mutable struct Provenance_Agent <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onBehalfOf::Union{Reference, Nothing}
    role::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
    who::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Provenance_Agent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Provenance_Agent} = (:id,:extension,:modifierExtension,:type,:role,:who,:onBehalfOf,)



mutable struct InsurancePlan_Cost <: AbstractFHIRType
    applicability::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    qualifiers::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
    value::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Cost} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Cost} = (:id,:extension,:modifierExtension,:type,:applicability,:qualifiers,:value,)



mutable struct MedicationKnowledge_Schedule <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    schedule::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Schedule} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Schedule} = (:id,:extension,:modifierExtension,:schedule,)



mutable struct DeviceDefinition_Capability <: AbstractFHIRType
    description::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_Capability} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_Capability} = (:id,:extension,:modifierExtension,:type,:description,)



mutable struct Device_Property <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueCode::Union{Vector{CodeableConcept}, Nothing}
    valueQuantity::Union{Vector{Quantity}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device_Property} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device_Property} = (:id,:extension,:modifierExtension,:type,:valueQuantity,:valueCode,)



mutable struct SubstanceReferenceInformation_Gene <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    gene::Union{CodeableConcept, Nothing}
    geneSequenceOrigin::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceReferenceInformation_Gene} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceReferenceInformation_Gene} = (:id,:extension,:modifierExtension,:geneSequenceOrigin,:gene,:source,)



mutable struct SubstanceSourceMaterial_PartDescription <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    part::Union{CodeableConcept, Nothing}
    partLocation::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_PartDescription} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_PartDescription} = (:id,:extension,:modifierExtension,:part,:partLocation,)



mutable struct Encounter_Hospitalization <: AbstractFHIRType
    admitSource::Union{CodeableConcept, Nothing}
    destination::Union{Reference, Nothing}
    dietPreference::Union{Vector{CodeableConcept}, Nothing}
    dischargeDisposition::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    origin::Union{Reference, Nothing}
    preAdmissionIdentifier::Union{Identifier, Nothing}
    reAdmission::Union{CodeableConcept, Nothing}
    specialArrangement::Union{Vector{CodeableConcept}, Nothing}
    specialCourtesy::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_Hospitalization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_Hospitalization} = (:id,:extension,:modifierExtension,:preAdmissionIdentifier,:origin,:admitSource,:reAdmission,:dietPreference,:specialCourtesy,:specialArrangement,:destination,:dischargeDisposition,)



mutable struct NutritionOrder_Texture <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    foodType::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_Texture} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_Texture} = (:id,:extension,:modifierExtension,:modifier,:foodType,)



mutable struct Contract_Party <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Vector{Reference}, Nothing}
    role::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Party} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Party} = (:id,:extension,:modifierExtension,:reference,:role,)



mutable struct PlanDefinition_Target <: AbstractFHIRType
    detailCodeableConcept::Union{CodeableConcept, Nothing}
    detailQuantity::Union{Quantity, Nothing}
    detailRange::Union{Range, Nothing}
    due::Union{Duration, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measure::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_Target} = (:id,:extension,:modifierExtension,:measure,:detailQuantity,:detailRange,:detailCodeableConcept,:due,)



mutable struct NutritionOrder_Nutrient <: AbstractFHIRType
    amount::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_Nutrient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_Nutrient} = (:id,:extension,:modifierExtension,:modifier,:amount,)



mutable struct ProductShelfLife <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Quantity, Nothing}
    specialPrecautionsForStorage::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ProductShelfLife} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ProductShelfLife} = (:id,:extension,:modifierExtension,:identifier,:type,:period,:specialPrecautionsForStorage,)



mutable struct MedicationDispense_Performer <: AbstractFHIRType
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    function::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationDispense_Performer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationDispense_Performer} = (:id,:extension,:modifierExtension,:function,:actor,)



mutable struct Contract_Subject <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Vector{Reference}, Nothing}
    role::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Subject} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Subject} = (:id,:extension,:modifierExtension,:reference,:role,)



mutable struct Practitioner_Qualification <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    issuer::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Practitioner_Qualification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Practitioner_Qualification} = (:id,:extension,:modifierExtension,:identifier,:code,:period,:issuer,)



mutable struct Contract_Friendly <: AbstractFHIRType
    contentAttachment::Union{Attachment, Nothing}
    contentReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Friendly} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Friendly} = (:id,:extension,:modifierExtension,:contentAttachment,:contentReference,)



mutable struct DocumentManifest_Related <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    ref::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentManifest_Related} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentManifest_Related} = (:id,:extension,:modifierExtension,:identifier,:ref,)



mutable struct InsurancePlan_Limit <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Limit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Limit} = (:id,:extension,:modifierExtension,:value,:code,)



mutable struct MeasureReport_Component <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Component} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Component} = (:id,:extension,:modifierExtension,:code,:value,)



mutable struct SubstanceSourceMaterial_OrganismGeneral <: AbstractFHIRType
    class::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    kingdom::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    order::Union{CodeableConcept, Nothing}
    phylum::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_OrganismGeneral} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_OrganismGeneral} = (:id,:extension,:modifierExtension,:kingdom,:phylum,:class,:order,)



mutable struct SubstanceSpecification_MolecularWeight <: AbstractFHIRType
    amount::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_MolecularWeight} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_MolecularWeight} = (:id,:extension,:modifierExtension,:method,:type,:amount,)



mutable struct Communication_Payload <: AbstractFHIRType
    _contentString::Union{Element, Nothing}
    contentAttachment::Union{Attachment, Nothing}
    contentReference::Union{Reference, Nothing}
    contentString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Communication_Payload} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Communication_Payload} = (:id,:extension,:modifierExtension,:contentString,:_contentString,:contentAttachment,:contentReference,)



mutable struct Measure_SupplementalData <: AbstractFHIRType
    _description::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    criteria::Union{Expression, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    usage::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure_SupplementalData} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure_SupplementalData} = (:id,:extension,:modifierExtension,:code,:usage,:description,:_description,:criteria,)



mutable struct PractitionerRole_NotAvailable <: AbstractFHIRType
    _description::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    during::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PractitionerRole_NotAvailable} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PractitionerRole_NotAvailable} = (:id,:extension,:modifierExtension,:description,:_description,:during,)



mutable struct RiskEvidenceSynthesis_PrecisionEstimate <: AbstractFHIRType
    _from::Union{Element, Nothing}
    _level::Union{Element, Nothing}
    _to::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    from::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    level::Union{FHIRNumber, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    to::Union{FHIRNumber, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis_PrecisionEstimate} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis_PrecisionEstimate} = (:id,:extension,:modifierExtension,:type,:level,:_level,:from,:_from,:to,:_to,)



mutable struct ImplementationGuide_Page <: AbstractFHIRType
    _generation::Union{Element, Nothing}
    _nameUrl::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    generation::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    nameReference::Union{Reference, Nothing}
    nameUrl::Union{string_fhir, Nothing}
    page::Union{Vector{ImplementationGuide_Page}, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Page} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Page} = (:id,:extension,:modifierExtension,:nameUrl,:_nameUrl,:nameReference,:title,:_title,:generation,:_generation,:page,)



mutable struct SubstanceSourceMaterial_Author <: AbstractFHIRType
    _authorDescription::Union{Element, Nothing}
    authorDescription::Union{string_fhir, Nothing}
    authorType::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_Author} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_Author} = (:id,:extension,:modifierExtension,:authorType,:authorDescription,:_authorDescription,)



mutable struct DeviceRequest_Parameter <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceRequest_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceRequest_Parameter} = (:id,:extension,:modifierExtension,:code,:valueCodeableConcept,:valueQuantity,:valueRange,:valueBoolean,:_valueBoolean,)



mutable struct ExplanationOfBenefit_Financial <: AbstractFHIRType
    _allowedString::Union{Element, Nothing}
    _allowedUnsignedInt::Union{Element, Nothing}
    _usedUnsignedInt::Union{Element, Nothing}
    allowedMoney::Union{Money, Nothing}
    allowedString::Union{string_fhir, Nothing}
    allowedUnsignedInt::Union{FHIRInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    usedMoney::Union{Money, Nothing}
    usedUnsignedInt::Union{FHIRInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Financial} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Financial} = (:id,:extension,:modifierExtension,:type,:allowedUnsignedInt,:_allowedUnsignedInt,:allowedString,:_allowedString,:allowedMoney,:usedUnsignedInt,:_usedUnsignedInt,:usedMoney,)



mutable struct CoverageEligibilityResponse_Benefit <: AbstractFHIRType
    _allowedString::Union{Element, Nothing}
    _allowedUnsignedInt::Union{Element, Nothing}
    _usedString::Union{Element, Nothing}
    _usedUnsignedInt::Union{Element, Nothing}
    allowedMoney::Union{Money, Nothing}
    allowedString::Union{string_fhir, Nothing}
    allowedUnsignedInt::Union{FHIRInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    usedMoney::Union{Money, Nothing}
    usedString::Union{string_fhir, Nothing}
    usedUnsignedInt::Union{FHIRInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityResponse_Benefit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityResponse_Benefit} = (:id,:extension,:modifierExtension,:type,:allowedUnsignedInt,:_allowedUnsignedInt,:allowedString,:_allowedString,:allowedMoney,:usedUnsignedInt,:_usedUnsignedInt,:usedString,:_usedString,:usedMoney,)



mutable struct ElementDefinition_Type <: AbstractFHIRType
    _aggregation::Union{Vector{Element}, Nothing}
    _code::Union{Element, Nothing}
    _versioning::Union{Element, Nothing}
    aggregation::Union{Vector{String}, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{Vector{String}, Nothing}
    targetProfile::Union{Vector{String}, Nothing}
    versioning::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Type} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Type} = (:id,:extension,:modifierExtension,:code,:_code,:profile,:targetProfile,:aggregation,:_aggregation,:versioning,:_versioning,)



mutable struct InsurancePlan_Benefit1 <: AbstractFHIRType
    cost::Union{Vector{InsurancePlan_Cost}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Benefit1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Benefit1} = (:id,:extension,:modifierExtension,:type,:cost,)



mutable struct Consent_Policy <: AbstractFHIRType
    _authority::Union{Element, Nothing}
    _uri::Union{Element, Nothing}
    authority::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    uri::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent_Policy} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent_Policy} = (:id,:extension,:modifierExtension,:authority,:_authority,:uri,:_uri,)



mutable struct InsurancePlan_Benefit <: AbstractFHIRType
    _requirement::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    limit::Union{Vector{InsurancePlan_Limit}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    requirement::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Benefit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Benefit} = (:id,:extension,:modifierExtension,:type,:requirement,:_requirement,:limit,)



mutable struct ImplementationGuide_Grouping <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Grouping} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Grouping} = (:id,:extension,:modifierExtension,:name,:_name,:description,:_description,)



mutable struct ExplanationOfBenefit_SupportingInfo <: AbstractFHIRType
    _sequence::Union{Element, Nothing}
    _timingDate::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{Coding, Nothing}
    sequence::Union{SafeInt32, Nothing}
    timingDate::Union{string_fhir, Nothing}
    timingPeriod::Union{Period, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_SupportingInfo} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_SupportingInfo} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:category,:code,:timingDate,:_timingDate,:timingPeriod,:valueBoolean,:_valueBoolean,:valueString,:_valueString,:valueQuantity,:valueAttachment,:valueReference,:reason,)



mutable struct AppointmentResponse <: AbstractResource
    _comment::Union{Element, Nothing}
    _end::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _participantStatus::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    actor::Union{Reference, Nothing}
    appointment::Union{Reference, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    end::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    participantStatus::Union{String, Nothing}
    participantType::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    start::Union{Union{DateTime, ZonedDateTime}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AppointmentResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AppointmentResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:appointment,:start,:_start,:end,:_end,:participantType,:actor,:participantStatus,:_participantStatus,:comment,:_comment,)



mutable struct MedicinalProductPharmaceutical_WithdrawalPeriod <: AbstractFHIRType
    _supportingInformation::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    supportingInformation::Union{string_fhir, Nothing}
    tissue::Union{CodeableConcept, Nothing}
    value::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPharmaceutical_WithdrawalPeriod} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPharmaceutical_WithdrawalPeriod} = (:id,:extension,:modifierExtension,:tissue,:value,:supportingInformation,:_supportingInformation,)



mutable struct Appointment_Participant <: AbstractFHIRType
    _required::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    actor::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    required::Union{String, Nothing}
    status::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Appointment_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Appointment_Participant} = (:id,:extension,:modifierExtension,:type,:actor,:required,:_required,:status,:_status,:period,)



mutable struct CapabilityStatement_Document <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Document} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Document} = (:id,:extension,:modifierExtension,:mode,:_mode,:documentation,:_documentation,:profile,)



mutable struct TerminologyCapabilities_Translation <: AbstractFHIRType
    _needsMap::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    needsMap::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Translation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Translation} = (:id,:extension,:modifierExtension,:needsMap,:_needsMap,)



mutable struct BiologicallyDerivedProduct_Storage <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _scale::Union{Element, Nothing}
    _temperature::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    duration::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    scale::Union{String, Nothing}
    temperature::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BiologicallyDerivedProduct_Storage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BiologicallyDerivedProduct_Storage} = (:id,:extension,:modifierExtension,:description,:_description,:temperature,:_temperature,:scale,:_scale,:duration,)



mutable struct Slot <: AbstractResource
    _comment::Union{Element, Nothing}
    _end::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _overbooked::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    appointmentType::Union{CodeableConcept, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    end::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    overbooked::Union{Bool, Nothing}
    resourceType::Union{String, Nothing}
    schedule::Union{Reference, Nothing}
    serviceCategory::Union{Vector{CodeableConcept}, Nothing}
    serviceType::Union{Vector{CodeableConcept}, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    start::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Slot} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Slot} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:serviceCategory,:serviceType,:specialty,:appointmentType,:schedule,:status,:_status,:start,:_start,:end,:_end,:overbooked,:_overbooked,:comment,:_comment,)



mutable struct TerminologyCapabilities_Closure <: AbstractFHIRType
    _translation::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    translation::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Closure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Closure} = (:id,:extension,:modifierExtension,:translation,:_translation,)



mutable struct CapabilityStatement_Operation <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    definition::Union{String, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Operation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Operation} = (:id,:extension,:modifierExtension,:name,:_name,:definition,:documentation,:_documentation,)



mutable struct TerminologyCapabilities_Implementation <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Implementation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Implementation} = (:id,:extension,:modifierExtension,:description,:_description,:url,:_url,)



mutable struct CareTeam <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    managingOrganization::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    participant::Union{Vector{CareTeam_Participant}, Nothing}
    period::Union{Period, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CareTeam} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CareTeam} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:category,:name,:_name,:subject,:encounter,:period,:participant,:reasonCode,:reasonReference,:managingOrganization,:telecom,:note,)



mutable struct AuditEvent_Network <: AbstractFHIRType
    _address::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    address::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent_Network} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent_Network} = (:id,:extension,:modifierExtension,:address,:_address,:type,:_type,)



mutable struct ExampleScenario_Version <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _versionId::Union{Element, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    versionId::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Version} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Version} = (:id,:extension,:modifierExtension,:versionId,:_versionId,:description,:_description,)



mutable struct EffectEvidenceSynthesis_SampleSize <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _numberOfParticipants::Union{Element, Nothing}
    _numberOfStudies::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfParticipants::Union{SafeInt32, Nothing}
    numberOfStudies::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_SampleSize} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_SampleSize} = (:id,:extension,:modifierExtension,:description,:_description,:numberOfStudies,:_numberOfStudies,:numberOfParticipants,:_numberOfParticipants,)



mutable struct ExplanationOfBenefit_Accident <: AbstractFHIRType
    _date::Union{Element, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    locationAddress::Union{Address, Nothing}
    locationReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Accident} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Accident} = (:id,:extension,:modifierExtension,:date,:_date,:type,:locationAddress,:locationReference,)



mutable struct StructureMap_Structure <: AbstractFHIRType
    _alias::Union{Element, Nothing}
    _documentation::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    alias::Union{string_fhir, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Structure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Structure} = (:id,:extension,:modifierExtension,:url,:mode,:_mode,:alias,:_alias,:documentation,:_documentation,)



mutable struct PlanDefinition_Goal <: AbstractFHIRType
    addresses::Union{Vector{CodeableConcept}, Nothing}
    category::Union{CodeableConcept, Nothing}
    description::Union{CodeableConcept, Nothing}
    documentation::Union{Vector{RelatedArtifact}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    priority::Union{CodeableConcept, Nothing}
    start::Union{CodeableConcept, Nothing}
    target::Union{Vector{PlanDefinition_Target}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_Goal} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_Goal} = (:id,:extension,:modifierExtension,:category,:description,:priority,:start,:addresses,:documentation,:target,)



mutable struct MolecularSequence_ReferenceSeq <: AbstractFHIRType
    _genomeBuild::Union{Element, Nothing}
    _orientation::Union{Element, Nothing}
    _referenceSeqString::Union{Element, Nothing}
    _strand::Union{Element, Nothing}
    _windowEnd::Union{Element, Nothing}
    _windowStart::Union{Element, Nothing}
    chromosome::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    genomeBuild::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    orientation::Union{String, Nothing}
    referenceSeqId::Union{CodeableConcept, Nothing}
    referenceSeqPointer::Union{Reference, Nothing}
    referenceSeqString::Union{string_fhir, Nothing}
    strand::Union{String, Nothing}
    windowEnd::Union{SafeInt32, Nothing}
    windowStart::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_ReferenceSeq} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_ReferenceSeq} = (:id,:extension,:modifierExtension,:chromosome,:genomeBuild,:_genomeBuild,:orientation,:_orientation,:referenceSeqId,:referenceSeqPointer,:referenceSeqString,:_referenceSeqString,:strand,:_strand,:windowStart,:_windowStart,:windowEnd,:_windowEnd,)



mutable struct Organization <: AbstractResource
    _active::Union{Element, Nothing}
    _alias::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    address::Union{Vector{Address}, Nothing}
    alias::Union{Vector{string_fhir}, Nothing}
    contact::Union{Vector{Organization_Contact}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    partOf::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Organization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Organization} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:type,:name,:_name,:alias,:_alias,:telecom,:address,:partOf,:contact,:endpoint,)



mutable struct TestScript_RequestHeader <: AbstractFHIRType
    _field::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    field::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_RequestHeader} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_RequestHeader} = (:id,:extension,:modifierExtension,:field,:_field,:value,:_value,)



mutable struct ImplementationGuide_DependsOn <: AbstractFHIRType
    _packageId::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    packageId::Union{String, Nothing}
    uri::Union{String, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_DependsOn} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_DependsOn} = (:id,:extension,:modifierExtension,:uri,:packageId,:_packageId,:version,:_version,)



mutable struct Encounter_Location <: AbstractFHIRType
    _status::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    location::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    physicalType::Union{CodeableConcept, Nothing}
    status::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_Location} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_Location} = (:id,:extension,:modifierExtension,:location,:status,:_status,:physicalType,:period,)



mutable struct CapabilityStatement_SupportedMessage <: AbstractFHIRType
    _mode::Union{Element, Nothing}
    definition::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_SupportedMessage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_SupportedMessage} = (:id,:extension,:modifierExtension,:mode,:_mode,:definition,)



mutable struct MeasureReport_Population <: AbstractFHIRType
    _count::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    count::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    subjectResults::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Population} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Population} = (:id,:extension,:modifierExtension,:code,:count,:_count,:subjectResults,)



mutable struct TestScript_Fixture <: AbstractFHIRType
    _autocreate::Union{Element, Nothing}
    _autodelete::Union{Element, Nothing}
    autocreate::Union{Bool, Nothing}
    autodelete::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resource::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Fixture} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Fixture} = (:id,:extension,:modifierExtension,:autocreate,:_autocreate,:autodelete,:_autodelete,:resource,)



mutable struct Composition_Section <: AbstractFHIRType
    _mode::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    author::Union{Vector{Reference}, Nothing}
    code::Union{CodeableConcept, Nothing}
    emptyReason::Union{CodeableConcept, Nothing}
    entry::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Reference, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    orderedBy::Union{CodeableConcept, Nothing}
    section::Union{Vector{Composition_Section}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Composition_Section} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Composition_Section} = (:id,:extension,:modifierExtension,:title,:_title,:code,:author,:focus,:text,:mode,:_mode,:orderedBy,:entry,:emptyReason,:section,)



mutable struct AdverseEvent_Causality <: AbstractFHIRType
    _productRelatedness::Union{Element, Nothing}
    assessment::Union{CodeableConcept, Nothing}
    author::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    productRelatedness::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AdverseEvent_Causality} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AdverseEvent_Causality} = (:id,:extension,:modifierExtension,:assessment,:productRelatedness,:_productRelatedness,:author,:method,)



mutable struct ImplementationGuide_Parameter <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Parameter} = (:id,:extension,:modifierExtension,:code,:_code,:value,:_value,)



mutable struct HealthcareService_Eligibility <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    comment::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: HealthcareService_Eligibility} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: HealthcareService_Eligibility} = (:id,:extension,:modifierExtension,:code,:comment,:_comment,)



mutable struct Flag <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    author::Union{Reference, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Flag} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Flag} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:category,:code,:subject,:period,:encounter,:author,)



mutable struct MolecularSequence_Inner <: AbstractFHIRType
    _end::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    end::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    start::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Inner} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Inner} = (:id,:extension,:modifierExtension,:start,:_start,:end,:_end,)



mutable struct CapabilityStatement_Software <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _releaseDate::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    releaseDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Software} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Software} = (:id,:extension,:modifierExtension,:name,:_name,:version,:_version,:releaseDate,:_releaseDate,)



mutable struct Specimen_Collection <: AbstractFHIRType
    _collectedDateTime::Union{Element, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    collectedDateTime::Union{string_fhir, Nothing}
    collectedPeriod::Union{Period, Nothing}
    collector::Union{Reference, Nothing}
    duration::Union{Duration, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fastingStatusCodeableConcept::Union{CodeableConcept, Nothing}
    fastingStatusDuration::Union{Duration, Nothing}
    id::Union{string_fhir, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Specimen_Collection} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Specimen_Collection} = (:id,:extension,:modifierExtension,:collector,:collectedDateTime,:_collectedDateTime,:collectedPeriod,:duration,:quantity,:method,:bodySite,:fastingStatusCodeableConcept,:fastingStatusDuration,)



mutable struct GuidanceResponse <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _moduleCanonical::Union{Element, Nothing}
    _moduleUri::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    dataRequirement::Union{Vector{DataRequirement}, Nothing}
    encounter::Union{Reference, Nothing}
    evaluationMessage::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    moduleCanonical::Union{string_fhir, Nothing}
    moduleCodeableConcept::Union{CodeableConcept, Nothing}
    moduleUri::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{Union{DateTime, ZonedDateTime}, Nothing}
    outputParameters::Union{Reference, Nothing}
    performer::Union{Reference, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    requestIdentifier::Union{Identifier, Nothing}
    resourceType::Union{String, Nothing}
    result::Union{Reference, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: GuidanceResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: GuidanceResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:requestIdentifier,:identifier,:moduleUri,:_moduleUri,:moduleCanonical,:_moduleCanonical,:moduleCodeableConcept,:status,:_status,:subject,:encounter,:occurrenceDateTime,:_occurrenceDateTime,:performer,:reasonCode,:reasonReference,:note,:evaluationMessage,:outputParameters,:result,:dataRequirement,)



mutable struct MedicationStatement <: AbstractResource
    _dateAsserted::Union{Element, Nothing}
    _effectiveDateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    category::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    context::Union{Reference, Nothing}
    dateAsserted::Union{Union{DateTime, ZonedDateTime}, Nothing}
    derivedFrom::Union{Vector{Reference}, Nothing}
    dosage::Union{Vector{Dosage}, Nothing}
    effectiveDateTime::Union{string_fhir, Nothing}
    effectivePeriod::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    informationSource::Union{Reference, Nothing}
    language::Union{String, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{Vector{CodeableConcept}, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationStatement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationStatement} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:partOf,:status,:_status,:statusReason,:category,:medicationCodeableConcept,:medicationReference,:subject,:context,:effectiveDateTime,:_effectiveDateTime,:effectivePeriod,:dateAsserted,:_dateAsserted,:informationSource,:derivedFrom,:reasonCode,:reasonReference,:note,:dosage,)



mutable struct BiologicallyDerivedProduct_Manipulation <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _timeDateTime::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    timeDateTime::Union{string_fhir, Nothing}
    timePeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BiologicallyDerivedProduct_Manipulation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BiologicallyDerivedProduct_Manipulation} = (:id,:extension,:modifierExtension,:description,:_description,:timeDateTime,:_timeDateTime,:timePeriod,)



mutable struct EffectEvidenceSynthesis_ResultsByExposure <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _exposureState::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    exposureState::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    riskEvidenceSynthesis::Union{Reference, Nothing}
    variantState::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_ResultsByExposure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_ResultsByExposure} = (:id,:extension,:modifierExtension,:description,:_description,:exposureState,:_exposureState,:variantState,:riskEvidenceSynthesis,)



mutable struct MedicationKnowledge_Substitution <: AbstractFHIRType
    _allowed::Union{Element, Nothing}
    allowed::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Substitution} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Substitution} = (:id,:extension,:modifierExtension,:type,:allowed,:_allowed,)



mutable struct TestScript_Origin <: AbstractFHIRType
    _index::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    index::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Origin} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Origin} = (:id,:extension,:modifierExtension,:index,:_index,:profile,)



mutable struct RiskEvidenceSynthesis_Certainty <: AbstractFHIRType
    certaintySubcomponent::Union{Vector{RiskEvidenceSynthesis_CertaintySubcomponent}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    rating::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis_Certainty} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis_Certainty} = (:id,:extension,:modifierExtension,:rating,:note,:certaintySubcomponent,)



mutable struct MessageDefinition_Focus <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageDefinition_Focus} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageDefinition_Focus} = (:id,:extension,:modifierExtension,:code,:_code,:profile,:min,:_min,:max,:_max,)



mutable struct Bundle_Request <: AbstractFHIRType
    _ifMatch::Union{Element, Nothing}
    _ifModifiedSince::Union{Element, Nothing}
    _ifNoneExist::Union{Element, Nothing}
    _ifNoneMatch::Union{Element, Nothing}
    _method::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    ifMatch::Union{string_fhir, Nothing}
    ifModifiedSince::Union{Union{DateTime, ZonedDateTime}, Nothing}
    ifNoneExist::Union{string_fhir, Nothing}
    ifNoneMatch::Union{string_fhir, Nothing}
    method::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle_Request} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle_Request} = (:id,:extension,:modifierExtension,:method,:_method,:url,:_url,:ifNoneMatch,:_ifNoneMatch,:ifModifiedSince,:_ifModifiedSince,:ifMatch,:_ifMatch,:ifNoneExist,:_ifNoneExist,)



mutable struct MedicationDispense_Substitution <: AbstractFHIRType
    _wasSubstituted::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{Vector{CodeableConcept}, Nothing}
    responsibleParty::Union{Vector{Reference}, Nothing}
    type::Union{CodeableConcept, Nothing}
    wasSubstituted::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationDispense_Substitution} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationDispense_Substitution} = (:id,:extension,:modifierExtension,:wasSubstituted,:_wasSubstituted,:type,:reason,:responsibleParty,)



mutable struct Location_HoursOfOperation <: AbstractFHIRType
    _allDay::Union{Element, Nothing}
    _closingTime::Union{Element, Nothing}
    _daysOfWeek::Union{Vector{Element}, Nothing}
    _openingTime::Union{Element, Nothing}
    allDay::Union{Bool, Nothing}
    closingTime::Union{Time, Nothing}
    daysOfWeek::Union{Vector{String}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    openingTime::Union{Time, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Location_HoursOfOperation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Location_HoursOfOperation} = (:id,:extension,:modifierExtension,:daysOfWeek,:_daysOfWeek,:allDay,:_allDay,:openingTime,:_openingTime,:closingTime,:_closingTime,)



mutable struct Task_Input <: AbstractFHIRType
    _valueBase64Binary::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCanonical::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInstant::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueMarkdown::Union{Element, Nothing}
    _valueOid::Union{Element, Nothing}
    _valuePositiveInt::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUnsignedInt::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    _valueUrl::Union{Element, Nothing}
    _valueUuid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueAddress::Union{Address, Nothing}
    valueAge::Union{Age, Nothing}
    valueAnnotation::Union{Annotation, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCanonical::Union{string_fhir, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueContactDetail::Union{ContactDetail, Nothing}
    valueContactPoint::Union{ContactPoint, Nothing}
    valueContributor::Union{Contributor, Nothing}
    valueCount::Union{Count, Nothing}
    valueDataRequirement::Union{DataRequirement, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueDistance::Union{Distance, Nothing}
    valueDosage::Union{Dosage, Nothing}
    valueDuration::Union{Duration, Nothing}
    valueExpression::Union{Expression, Nothing}
    valueHumanName::Union{HumanName, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueIdentifier::Union{Identifier, Nothing}
    valueInstant::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueMarkdown::Union{string_fhir, Nothing}
    valueMeta::Union{Meta, Nothing}
    valueMoney::Union{Money, Nothing}
    valueOid::Union{string_fhir, Nothing}
    valueParameterDefinition::Union{ParameterDefinition, Nothing}
    valuePeriod::Union{Period, Nothing}
    valuePositiveInt::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueReference::Union{Reference, Nothing}
    valueRelatedArtifact::Union{RelatedArtifact, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueSignature::Union{Signature, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueTiming::Union{Timing, Nothing}
    valueTriggerDefinition::Union{TriggerDefinition, Nothing}
    valueUnsignedInt::Union{FHIRInt32, Nothing}
    valueUri::Union{string_fhir, Nothing}
    valueUrl::Union{string_fhir, Nothing}
    valueUsageContext::Union{UsageContext, Nothing}
    valueUuid::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Task_Input} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Task_Input} = (:id,:extension,:modifierExtension,:type,:valueBase64Binary,:_valueBase64Binary,:valueBoolean,:_valueBoolean,:valueCanonical,:_valueCanonical,:valueCode,:_valueCode,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,:valueId,:_valueId,:valueInstant,:_valueInstant,:valueInteger,:_valueInteger,:valueMarkdown,:_valueMarkdown,:valueOid,:_valueOid,:valuePositiveInt,:_valuePositiveInt,:valueString,:_valueString,:valueTime,:_valueTime,:valueUnsignedInt,:_valueUnsignedInt,:valueUri,:_valueUri,:valueUrl,:_valueUrl,:valueUuid,:_valueUuid,:valueAddress,:valueAge,:valueAnnotation,:valueAttachment,:valueCodeableConcept,:valueCoding,:valueContactPoint,:valueCount,:valueDistance,:valueDuration,:valueHumanName,:valueIdentifier,:valueMoney,:valuePeriod,:valueQuantity,:valueRange,:valueRatio,:valueReference,:valueSampledData,:valueSignature,:valueTiming,:valueContactDetail,:valueContributor,:valueDataRequirement,:valueExpression,:valueParameterDefinition,:valueRelatedArtifact,:valueTriggerDefinition,:valueUsageContext,:valueDosage,:valueMeta,)



mutable struct MedicinalProductInteraction <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    effect::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    incidence::Union{CodeableConcept, Nothing}
    interactant::Union{Vector{MedicinalProductInteraction_Interactant}, Nothing}
    language::Union{String, Nothing}
    management::Union{CodeableConcept, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductInteraction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductInteraction} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:subject,:description,:_description,:interactant,:type,:effect,:incidence,:management,)



mutable struct Person_Link <: AbstractFHIRType
    _assurance::Union{Element, Nothing}
    assurance::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    target::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Person_Link} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Person_Link} = (:id,:extension,:modifierExtension,:target,:assurance,:_assurance,)



mutable struct Bundle_Search <: AbstractFHIRType
    _mode::Union{Element, Nothing}
    _score::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    score::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle_Search} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle_Search} = (:id,:extension,:modifierExtension,:mode,:_mode,:score,:_score,)



mutable struct CapabilityStatement_Implementation <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    custodian::Union{Reference, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Implementation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Implementation} = (:id,:extension,:modifierExtension,:description,:_description,:url,:_url,:custodian,)



mutable struct Questionnaire_Initial <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueUri::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Questionnaire_Initial} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Questionnaire_Initial} = (:id,:extension,:modifierExtension,:valueBoolean,:_valueBoolean,:valueDecimal,:_valueDecimal,:valueInteger,:_valueInteger,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueTime,:_valueTime,:valueString,:_valueString,:valueUri,:_valueUri,:valueAttachment,:valueCoding,:valueQuantity,:valueReference,)



mutable struct MedicinalProduct_ManufacturingBusinessOperation <: AbstractFHIRType
    _effectiveDate::Union{Element, Nothing}
    authorisationReferenceNumber::Union{Identifier, Nothing}
    confidentialityIndicator::Union{CodeableConcept, Nothing}
    effectiveDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    manufacturer::Union{Vector{Reference}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operationType::Union{CodeableConcept, Nothing}
    regulator::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct_ManufacturingBusinessOperation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct_ManufacturingBusinessOperation} = (:id,:extension,:modifierExtension,:operationType,:authorisationReferenceNumber,:effectiveDate,:_effectiveDate,:confidentialityIndicator,:manufacturer,:regulator,)



mutable struct ProdCharacteristic <: AbstractFHIRType
    _color::Union{Vector{Element}, Nothing}
    _imprint::Union{Vector{Element}, Nothing}
    _shape::Union{Element, Nothing}
    color::Union{Vector{string_fhir}, Nothing}
    depth::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    externalDiameter::Union{Quantity, Nothing}
    height::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    image::Union{Vector{Attachment}, Nothing}
    imprint::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    nominalVolume::Union{Quantity, Nothing}
    scoring::Union{CodeableConcept, Nothing}
    shape::Union{string_fhir, Nothing}
    weight::Union{Quantity, Nothing}
    width::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ProdCharacteristic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ProdCharacteristic} = (:id,:extension,:modifierExtension,:height,:width,:depth,:weight,:nominalVolume,:externalDiameter,:shape,:_shape,:color,:_color,:imprint,:_imprint,:image,:scoring,)



mutable struct Questionnaire_EnableWhen <: AbstractFHIRType
    _answerBoolean::Union{Element, Nothing}
    _answerDate::Union{Element, Nothing}
    _answerDateTime::Union{Element, Nothing}
    _answerDecimal::Union{Element, Nothing}
    _answerInteger::Union{Element, Nothing}
    _answerString::Union{Element, Nothing}
    _answerTime::Union{Element, Nothing}
    _operator::Union{Element, Nothing}
    _question::Union{Element, Nothing}
    answerBoolean::Union{Bool, Nothing}
    answerCoding::Union{Coding, Nothing}
    answerDate::Union{string_fhir, Nothing}
    answerDateTime::Union{string_fhir, Nothing}
    answerDecimal::Union{FHIRNumber, Nothing}
    answerInteger::Union{FHIRInt32, Nothing}
    answerQuantity::Union{Quantity, Nothing}
    answerReference::Union{Reference, Nothing}
    answerString::Union{string_fhir, Nothing}
    answerTime::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operator::Union{String, Nothing}
    question::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Questionnaire_EnableWhen} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Questionnaire_EnableWhen} = (:id,:extension,:modifierExtension,:question,:_question,:operator,:_operator,:answerBoolean,:_answerBoolean,:answerDecimal,:_answerDecimal,:answerInteger,:_answerInteger,:answerDate,:_answerDate,:answerDateTime,:_answerDateTime,:answerTime,:_answerTime,:answerString,:_answerString,:answerCoding,:answerQuantity,:answerReference,)



mutable struct Immunization_Education <: AbstractFHIRType
    _documentType::Union{Element, Nothing}
    _presentationDate::Union{Element, Nothing}
    _publicationDate::Union{Element, Nothing}
    _reference::Union{Element, Nothing}
    documentType::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    presentationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    publicationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    reference::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Immunization_Education} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Immunization_Education} = (:id,:extension,:modifierExtension,:documentType,:_documentType,:reference,:_reference,:publicationDate,:_publicationDate,:presentationDate,:_presentationDate,)



mutable struct StructureDefinition_Mapping <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _identity::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _uri::Union{Element, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identity::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    uri::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureDefinition_Mapping} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureDefinition_Mapping} = (:id,:extension,:modifierExtension,:identity,:_identity,:uri,:_uri,:name,:_name,:comment,:_comment,)



mutable struct DocumentManifest <: AbstractResource
    _created::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _source::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    author::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    content::Union{Vector{Reference}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    masterIdentifier::Union{Identifier, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    recipient::Union{Vector{Reference}, Nothing}
    related::Union{Vector{DocumentManifest_Related}, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentManifest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentManifest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:masterIdentifier,:identifier,:status,:_status,:type,:subject,:created,:_created,:author,:recipient,:source,:_source,:description,:_description,:content,:related,)



mutable struct Contract_Action <: AbstractFHIRType
    _contextLinkId::Union{Vector{Element}, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _linkId::Union{Vector{Element}, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _performerLinkId::Union{Vector{Element}, Nothing}
    _reason::Union{Vector{Element}, Nothing}
    _reasonLinkId::Union{Vector{Element}, Nothing}
    _requesterLinkId::Union{Vector{Element}, Nothing}
    _securityLabelNumber::Union{Vector{Element}, Nothing}
    context::Union{Reference, Nothing}
    contextLinkId::Union{Vector{string_fhir}, Nothing}
    doNotPerform::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    intent::Union{CodeableConcept, Nothing}
    linkId::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    performer::Union{Reference, Nothing}
    performerLinkId::Union{Vector{string_fhir}, Nothing}
    performerRole::Union{CodeableConcept, Nothing}
    performerType::Union{Vector{CodeableConcept}, Nothing}
    reason::Union{Vector{string_fhir}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonLinkId::Union{Vector{string_fhir}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    requester::Union{Vector{Reference}, Nothing}
    requesterLinkId::Union{Vector{string_fhir}, Nothing}
    securityLabelNumber::Union{Vector{SafeInt32}, Nothing}
    status::Union{CodeableConcept, Nothing}
    subject::Union{Vector{Contract_Subject}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Action} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Action} = (:id,:extension,:modifierExtension,:doNotPerform,:_doNotPerform,:type,:subject,:intent,:linkId,:_linkId,:status,:context,:contextLinkId,:_contextLinkId,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:requester,:requesterLinkId,:_requesterLinkId,:performerType,:performerRole,:performer,:performerLinkId,:_performerLinkId,:reasonCode,:reasonReference,:reason,:_reason,:reasonLinkId,:_reasonLinkId,:note,:securityLabelNumber,:_securityLabelNumber,)



mutable struct EpisodeOfCare_Diagnosis <: AbstractFHIRType
    _rank::Union{Element, Nothing}
    condition::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    rank::Union{SafeInt32, Nothing}
    role::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EpisodeOfCare_Diagnosis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EpisodeOfCare_Diagnosis} = (:id,:extension,:modifierExtension,:condition,:role,:rank,:_rank,)



mutable struct ExplanationOfBenefit_CareTeam <: AbstractFHIRType
    _responsible::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    provider::Union{Reference, Nothing}
    qualification::Union{CodeableConcept, Nothing}
    responsible::Union{Bool, Nothing}
    role::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_CareTeam} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_CareTeam} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:provider,:responsible,:_responsible,:role,:qualification,)



mutable struct Measure_Population <: AbstractFHIRType
    _description::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    criteria::Union{Expression, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure_Population} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure_Population} = (:id,:extension,:modifierExtension,:code,:description,:_description,:criteria,)



mutable struct BiologicallyDerivedProduct_Processing <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _timeDateTime::Union{Element, Nothing}
    additive::Union{Reference, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    procedure::Union{CodeableConcept, Nothing}
    timeDateTime::Union{string_fhir, Nothing}
    timePeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BiologicallyDerivedProduct_Processing} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BiologicallyDerivedProduct_Processing} = (:id,:extension,:modifierExtension,:description,:_description,:procedure,:additive,:timeDateTime,:_timeDateTime,:timePeriod,)



mutable struct RequestGroup_Condition <: AbstractFHIRType
    _kind::Union{Element, Nothing}
    expression::Union{Expression, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    kind::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RequestGroup_Condition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RequestGroup_Condition} = (:id,:extension,:modifierExtension,:kind,:_kind,:expression,)



mutable struct MedicationKnowledge_PatientCharacteristics <: AbstractFHIRType
    _value::Union{Vector{Element}, Nothing}
    characteristicCodeableConcept::Union{CodeableConcept, Nothing}
    characteristicQuantity::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_PatientCharacteristics} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_PatientCharacteristics} = (:id,:extension,:modifierExtension,:characteristicCodeableConcept,:characteristicQuantity,:value,:_value,)



mutable struct PaymentReconciliation_ProcessNote <: AbstractFHIRType
    _text::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PaymentReconciliation_ProcessNote} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PaymentReconciliation_ProcessNote} = (:id,:extension,:modifierExtension,:type,:_type,:text,:_text,)



mutable struct MessageHeader_Destination <: AbstractFHIRType
    _endpoint::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    endpoint::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    receiver::Union{Reference, Nothing}
    target::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageHeader_Destination} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageHeader_Destination} = (:id,:extension,:modifierExtension,:name,:_name,:target,:endpoint,:_endpoint,:receiver,)



mutable struct ExplanationOfBenefit_Procedure <: AbstractFHIRType
    _date::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    procedureCodeableConcept::Union{CodeableConcept, Nothing}
    procedureReference::Union{Reference, Nothing}
    sequence::Union{SafeInt32, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Procedure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Procedure} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:type,:date,:_date,:procedureCodeableConcept,:procedureReference,:udi,)



mutable struct Task_Restriction <: AbstractFHIRType
    _repetitions::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    recipient::Union{Vector{Reference}, Nothing}
    repetitions::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Task_Restriction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Task_Restriction} = (:id,:extension,:modifierExtension,:repetitions,:_repetitions,:period,:recipient,)



mutable struct MolecularSequence_Repository <: AbstractFHIRType
    _datasetId::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _readsetId::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _variantsetId::Union{Element, Nothing}
    datasetId::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    readsetId::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
    variantsetId::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Repository} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Repository} = (:id,:extension,:modifierExtension,:type,:_type,:url,:_url,:name,:_name,:datasetId,:_datasetId,:variantsetId,:_variantsetId,:readsetId,:_readsetId,)



mutable struct Encounter_Diagnosis <: AbstractFHIRType
    _rank::Union{Element, Nothing}
    condition::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    rank::Union{SafeInt32, Nothing}
    use::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_Diagnosis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_Diagnosis} = (:id,:extension,:modifierExtension,:condition,:use,:rank,:_rank,)



mutable struct Task_Output <: AbstractFHIRType
    _valueBase64Binary::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCanonical::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInstant::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueMarkdown::Union{Element, Nothing}
    _valueOid::Union{Element, Nothing}
    _valuePositiveInt::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUnsignedInt::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    _valueUrl::Union{Element, Nothing}
    _valueUuid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueAddress::Union{Address, Nothing}
    valueAge::Union{Age, Nothing}
    valueAnnotation::Union{Annotation, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCanonical::Union{string_fhir, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueContactDetail::Union{ContactDetail, Nothing}
    valueContactPoint::Union{ContactPoint, Nothing}
    valueContributor::Union{Contributor, Nothing}
    valueCount::Union{Count, Nothing}
    valueDataRequirement::Union{DataRequirement, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueDistance::Union{Distance, Nothing}
    valueDosage::Union{Dosage, Nothing}
    valueDuration::Union{Duration, Nothing}
    valueExpression::Union{Expression, Nothing}
    valueHumanName::Union{HumanName, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueIdentifier::Union{Identifier, Nothing}
    valueInstant::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueMarkdown::Union{string_fhir, Nothing}
    valueMeta::Union{Meta, Nothing}
    valueMoney::Union{Money, Nothing}
    valueOid::Union{string_fhir, Nothing}
    valueParameterDefinition::Union{ParameterDefinition, Nothing}
    valuePeriod::Union{Period, Nothing}
    valuePositiveInt::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueReference::Union{Reference, Nothing}
    valueRelatedArtifact::Union{RelatedArtifact, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueSignature::Union{Signature, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueTiming::Union{Timing, Nothing}
    valueTriggerDefinition::Union{TriggerDefinition, Nothing}
    valueUnsignedInt::Union{FHIRInt32, Nothing}
    valueUri::Union{string_fhir, Nothing}
    valueUrl::Union{string_fhir, Nothing}
    valueUsageContext::Union{UsageContext, Nothing}
    valueUuid::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Task_Output} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Task_Output} = (:id,:extension,:modifierExtension,:type,:valueBase64Binary,:_valueBase64Binary,:valueBoolean,:_valueBoolean,:valueCanonical,:_valueCanonical,:valueCode,:_valueCode,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,:valueId,:_valueId,:valueInstant,:_valueInstant,:valueInteger,:_valueInteger,:valueMarkdown,:_valueMarkdown,:valueOid,:_valueOid,:valuePositiveInt,:_valuePositiveInt,:valueString,:_valueString,:valueTime,:_valueTime,:valueUnsignedInt,:_valueUnsignedInt,:valueUri,:_valueUri,:valueUrl,:_valueUrl,:valueUuid,:_valueUuid,:valueAddress,:valueAge,:valueAnnotation,:valueAttachment,:valueCodeableConcept,:valueCoding,:valueContactPoint,:valueCount,:valueDistance,:valueDuration,:valueHumanName,:valueIdentifier,:valueMoney,:valuePeriod,:valueQuantity,:valueRange,:valueRatio,:valueReference,:valueSampledData,:valueSignature,:valueTiming,:valueContactDetail,:valueContributor,:valueDataRequirement,:valueExpression,:valueParameterDefinition,:valueRelatedArtifact,:valueTriggerDefinition,:valueUsageContext,:valueDosage,:valueMeta,)



mutable struct ImplementationGuide_Template <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _scope::Union{Element, Nothing}
    _source::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    scope::Union{string_fhir, Nothing}
    source::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Template} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Template} = (:id,:extension,:modifierExtension,:code,:_code,:source,:_source,:scope,:_scope,)



mutable struct Account_Coverage <: AbstractFHIRType
    _priority::Union{Element, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    priority::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Account_Coverage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Account_Coverage} = (:id,:extension,:modifierExtension,:coverage,:priority,:_priority,)



mutable struct ImmunizationEvaluation <: AbstractResource
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _doseNumberPositiveInt::Union{Element, Nothing}
    _doseNumberString::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _series::Union{Element, Nothing}
    _seriesDosesPositiveInt::Union{Element, Nothing}
    _seriesDosesString::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authority::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    doseNumberPositiveInt::Union{FHIRInt32, Nothing}
    doseNumberString::Union{string_fhir, Nothing}
    doseStatus::Union{CodeableConcept, Nothing}
    doseStatusReason::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    immunizationEvent::Union{Reference, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    series::Union{string_fhir, Nothing}
    seriesDosesPositiveInt::Union{FHIRInt32, Nothing}
    seriesDosesString::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    targetDisease::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImmunizationEvaluation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImmunizationEvaluation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:patient,:date,:_date,:authority,:targetDisease,:immunizationEvent,:doseStatus,:doseStatusReason,:description,:_description,:series,:_series,:doseNumberPositiveInt,:_doseNumberPositiveInt,:doseNumberString,:_doseNumberString,:seriesDosesPositiveInt,:_seriesDosesPositiveInt,:seriesDosesString,:_seriesDosesString,)



mutable struct ClinicalImpression_Finding <: AbstractFHIRType
    _basis::Union{Element, Nothing}
    basis::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClinicalImpression_Finding} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClinicalImpression_Finding} = (:id,:extension,:modifierExtension,:itemCodeableConcept,:itemReference,:basis,:_basis,)



mutable struct MeasureReport_Population1 <: AbstractFHIRType
    _count::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    count::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    subjectResults::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Population1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Population1} = (:id,:extension,:modifierExtension,:code,:count,:_count,:subjectResults,)



mutable struct ElementDefinition_Discriminator <: AbstractFHIRType
    _path::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Discriminator} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Discriminator} = (:id,:extension,:modifierExtension,:type,:_type,:path,:_path,)



mutable struct InsurancePlan_GeneralCost <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _groupSize::Union{Element, Nothing}
    comment::Union{string_fhir, Nothing}
    cost::Union{Money, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupSize::Union{SafeInt32, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_GeneralCost} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_GeneralCost} = (:id,:extension,:modifierExtension,:type,:groupSize,:_groupSize,:cost,:comment,:_comment,)



mutable struct Substance_Instance <: AbstractFHIRType
    _expiry::Union{Element, Nothing}
    expiry::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    quantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Substance_Instance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Substance_Instance} = (:id,:extension,:modifierExtension,:identifier,:expiry,:_expiry,:quantity,)



mutable struct OrganizationAffiliation <: AbstractResource
    _active::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    healthcareService::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    network::Union{Vector{Reference}, Nothing}
    organization::Union{Reference, Nothing}
    participatingOrganization::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    resourceType::Union{String, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OrganizationAffiliation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OrganizationAffiliation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:period,:organization,:participatingOrganization,:network,:code,:specialty,:location,:healthcareService,:telecom,:endpoint,)



mutable struct HealthcareService_AvailableTime <: AbstractFHIRType
    _allDay::Union{Element, Nothing}
    _availableEndTime::Union{Element, Nothing}
    _availableStartTime::Union{Element, Nothing}
    _daysOfWeek::Union{Vector{Element}, Nothing}
    allDay::Union{Bool, Nothing}
    availableEndTime::Union{Time, Nothing}
    availableStartTime::Union{Time, Nothing}
    daysOfWeek::Union{Vector{String}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: HealthcareService_AvailableTime} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: HealthcareService_AvailableTime} = (:id,:extension,:modifierExtension,:daysOfWeek,:_daysOfWeek,:allDay,:_allDay,:availableStartTime,:_availableStartTime,:availableEndTime,:_availableEndTime,)



mutable struct Consent_Verification <: AbstractFHIRType
    _verificationDate::Union{Element, Nothing}
    _verified::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    verificationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    verified::Union{Bool, Nothing}
    verifiedWith::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent_Verification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent_Verification} = (:id,:extension,:modifierExtension,:verified,:_verified,:verifiedWith,:verificationDate,:_verificationDate,)



mutable struct ClaimResponse_Insurance <: AbstractFHIRType
    _businessArrangement::Union{Element, Nothing}
    _focal::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    businessArrangement::Union{string_fhir, Nothing}
    claimResponse::Union{Reference, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focal::Union{Bool, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Insurance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Insurance} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:focal,:_focal,:coverage,:businessArrangement,:_businessArrangement,:claimResponse,)



mutable struct ConceptMap_Unmapped <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    code::Union{String, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap_Unmapped} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap_Unmapped} = (:id,:extension,:modifierExtension,:mode,:_mode,:code,:_code,:display,:_display,:url,)



mutable struct ClaimResponse_ProcessNote <: AbstractFHIRType
    _number::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    number::Union{SafeInt32, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_ProcessNote} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_ProcessNote} = (:id,:extension,:modifierExtension,:number,:_number,:type,:_type,:text,:_text,:language,)



mutable struct BiologicallyDerivedProduct_Collection <: AbstractFHIRType
    _collectedDateTime::Union{Element, Nothing}
    collectedDateTime::Union{string_fhir, Nothing}
    collectedPeriod::Union{Period, Nothing}
    collector::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BiologicallyDerivedProduct_Collection} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BiologicallyDerivedProduct_Collection} = (:id,:extension,:modifierExtension,:collector,:source,:collectedDateTime,:_collectedDateTime,:collectedPeriod,)



mutable struct Endpoint <: AbstractResource
    _address::Union{Element, Nothing}
    _header::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _payloadMimeType::Union{Vector{Element}, Nothing}
    _status::Union{Element, Nothing}
    address::Union{String, Nothing}
    connectionType::Union{Coding, Nothing}
    contact::Union{Vector{ContactPoint}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    header::Union{Vector{string_fhir}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    managingOrganization::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    payloadMimeType::Union{Vector{String}, Nothing}
    payloadType::Union{Vector{CodeableConcept}, Nothing}
    period::Union{Period, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Endpoint} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Endpoint} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:connectionType,:name,:_name,:managingOrganization,:contact,:period,:payloadType,:payloadMimeType,:_payloadMimeType,:address,:_address,:header,:_header,)



mutable struct RelatedPerson_Communication <: AbstractFHIRType
    _preferred::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preferred::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RelatedPerson_Communication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RelatedPerson_Communication} = (:id,:extension,:modifierExtension,:language,:preferred,:_preferred,)



mutable struct ImagingStudy_Instance <: AbstractFHIRType
    _number::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _uid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    number::Union{SafeInt32, Nothing}
    sopClass::Union{Coding, Nothing}
    title::Union{string_fhir, Nothing}
    uid::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImagingStudy_Instance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImagingStudy_Instance} = (:id,:extension,:modifierExtension,:uid,:_uid,:sopClass,:number,:_number,:title,:_title,)



mutable struct PlanDefinition_DynamicValue <: AbstractFHIRType
    _path::Union{Element, Nothing}
    expression::Union{Expression, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_DynamicValue} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_DynamicValue} = (:id,:extension,:modifierExtension,:path,:_path,:expression,)



mutable struct VisionPrescription_Prism <: AbstractFHIRType
    _amount::Union{Element, Nothing}
    _base::Union{Element, Nothing}
    amount::Union{FHIRNumber, Nothing}
    base::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VisionPrescription_Prism} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VisionPrescription_Prism} = (:id,:extension,:modifierExtension,:amount,:_amount,:base,:_base,)



mutable struct SubstanceSpecification_Moiety <: AbstractFHIRType
    _amountString::Union{Element, Nothing}
    _molecularFormula::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    amountQuantity::Union{Quantity, Nothing}
    amountString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    molecularFormula::Union{string_fhir, Nothing}
    name::Union{string_fhir, Nothing}
    opticalActivity::Union{CodeableConcept, Nothing}
    role::Union{CodeableConcept, Nothing}
    stereochemistry::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Moiety} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Moiety} = (:id,:extension,:modifierExtension,:role,:identifier,:name,:_name,:stereochemistry,:opticalActivity,:molecularFormula,:_molecularFormula,:amountQuantity,:amountString,:_amountString,)



mutable struct SubstanceSourceMaterial_Hybrid <: AbstractFHIRType
    _maternalOrganismId::Union{Element, Nothing}
    _maternalOrganismName::Union{Element, Nothing}
    _paternalOrganismId::Union{Element, Nothing}
    _paternalOrganismName::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    hybridType::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    maternalOrganismId::Union{string_fhir, Nothing}
    maternalOrganismName::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    paternalOrganismId::Union{string_fhir, Nothing}
    paternalOrganismName::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_Hybrid} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_Hybrid} = (:id,:extension,:modifierExtension,:maternalOrganismId,:_maternalOrganismId,:maternalOrganismName,:_maternalOrganismName,:paternalOrganismId,:_paternalOrganismId,:paternalOrganismName,:_paternalOrganismName,:hybridType,)



mutable struct CommunicationRequest_Payload <: AbstractFHIRType
    _contentString::Union{Element, Nothing}
    contentAttachment::Union{Attachment, Nothing}
    contentReference::Union{Reference, Nothing}
    contentString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CommunicationRequest_Payload} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CommunicationRequest_Payload} = (:id,:extension,:modifierExtension,:contentString,:_contentString,:contentAttachment,:contentReference,)



mutable struct Questionnaire_AnswerOption <: AbstractFHIRType
    _initialSelected::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    initialSelected::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Questionnaire_AnswerOption} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Questionnaire_AnswerOption} = (:id,:extension,:modifierExtension,:valueInteger,:_valueInteger,:valueDate,:_valueDate,:valueTime,:_valueTime,:valueString,:_valueString,:valueCoding,:valueReference,:initialSelected,:_initialSelected,)



mutable struct Contract_Context <: AbstractFHIRType
    _text::Union{Element, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Reference, Nothing}
    text::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Context} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Context} = (:id,:extension,:modifierExtension,:reference,:code,:text,:_text,)



mutable struct DiagnosticReport_Media <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    link::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DiagnosticReport_Media} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DiagnosticReport_Media} = (:id,:extension,:modifierExtension,:comment,:_comment,:link,)



mutable struct Schedule <: AbstractResource
    _active::Union{Element, Nothing}
    _comment::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    actor::Union{Vector{Reference}, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    planningHorizon::Union{Period, Nothing}
    resourceType::Union{String, Nothing}
    serviceCategory::Union{Vector{CodeableConcept}, Nothing}
    serviceType::Union{Vector{CodeableConcept}, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Schedule} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Schedule} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:serviceCategory,:serviceType,:specialty,:actor,:planningHorizon,:comment,:_comment,)



mutable struct MedicinalProductIngredient_ReferenceStrength <: AbstractFHIRType
    _measurementPoint::Union{Element, Nothing}
    country::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measurementPoint::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{Ratio, Nothing}
    strengthLowLimit::Union{Ratio, Nothing}
    substance::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIngredient_ReferenceStrength} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIngredient_ReferenceStrength} = (:id,:extension,:modifierExtension,:substance,:strength,:strengthLowLimit,:measurementPoint,:_measurementPoint,:country,)



mutable struct ObservationDefinition_QuantitativeDetails <: AbstractFHIRType
    _conversionFactor::Union{Element, Nothing}
    _decimalPrecision::Union{Element, Nothing}
    conversionFactor::Union{FHIRNumber, Nothing}
    customaryUnit::Union{CodeableConcept, Nothing}
    decimalPrecision::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    unit::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ObservationDefinition_QuantitativeDetails} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ObservationDefinition_QuantitativeDetails} = (:id,:extension,:modifierExtension,:customaryUnit,:unit,:conversionFactor,:_conversionFactor,:decimalPrecision,:_decimalPrecision,)



mutable struct DeviceDefinition_DeviceName <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_DeviceName} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_DeviceName} = (:id,:extension,:modifierExtension,:name,:_name,:type,:_type,)



mutable struct OperationDefinition_Binding <: AbstractFHIRType
    _strength::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{String, Nothing}
    valueSet::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationDefinition_Binding} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationDefinition_Binding} = (:id,:extension,:modifierExtension,:strength,:_strength,:valueSet,)



mutable struct Medication_Batch <: AbstractFHIRType
    _expirationDate::Union{Element, Nothing}
    _lotNumber::Union{Element, Nothing}
    expirationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    lotNumber::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Medication_Batch} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Medication_Batch} = (:id,:extension,:modifierExtension,:lotNumber,:_lotNumber,:expirationDate,:_expirationDate,)



mutable struct VerificationResult_Attestation <: AbstractFHIRType
    _date::Union{Element, Nothing}
    _proxyIdentityCertificate::Union{Element, Nothing}
    _sourceIdentityCertificate::Union{Element, Nothing}
    communicationMethod::Union{CodeableConcept, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onBehalfOf::Union{Reference, Nothing}
    proxyIdentityCertificate::Union{string_fhir, Nothing}
    proxySignature::Union{Signature, Nothing}
    sourceIdentityCertificate::Union{string_fhir, Nothing}
    sourceSignature::Union{Signature, Nothing}
    who::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VerificationResult_Attestation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VerificationResult_Attestation} = (:id,:extension,:modifierExtension,:who,:onBehalfOf,:communicationMethod,:date,:_date,:sourceIdentityCertificate,:_sourceIdentityCertificate,:proxyIdentityCertificate,:_proxyIdentityCertificate,:proxySignature,:sourceSignature,)



mutable struct Subscription_Channel <: AbstractFHIRType
    _endpoint::Union{Element, Nothing}
    _header::Union{Vector{Element}, Nothing}
    _payload::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    endpoint::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    header::Union{Vector{string_fhir}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    payload::Union{String, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Subscription_Channel} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Subscription_Channel} = (:id,:extension,:modifierExtension,:type,:_type,:endpoint,:_endpoint,:payload,:_payload,:header,:_header,)



mutable struct TestReport_Participant <: AbstractFHIRType
    _display::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _uri::Union{Element, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
    uri::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Participant} = (:id,:extension,:modifierExtension,:type,:_type,:uri,:_uri,:display,:_display,)



mutable struct SubstanceSpecification_Relationship <: AbstractFHIRType
    _amountString::Union{Element, Nothing}
    _isDefining::Union{Element, Nothing}
    amountQuantity::Union{Quantity, Nothing}
    amountRange::Union{Range, Nothing}
    amountRatio::Union{Ratio, Nothing}
    amountRatioLowLimit::Union{Ratio, Nothing}
    amountString::Union{string_fhir, Nothing}
    amountType::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    isDefining::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    relationship::Union{CodeableConcept, Nothing}
    source::Union{Vector{Reference}, Nothing}
    substanceCodeableConcept::Union{CodeableConcept, Nothing}
    substanceReference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Relationship} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Relationship} = (:id,:extension,:modifierExtension,:substanceReference,:substanceCodeableConcept,:relationship,:isDefining,:_isDefining,:amountQuantity,:amountRange,:amountRatio,:amountString,:_amountString,:amountRatioLowLimit,:amountType,:source,)



mutable struct NamingSystem_UniqueId <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _preferred::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    preferred::Union{Bool, Nothing}
    type::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NamingSystem_UniqueId} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NamingSystem_UniqueId} = (:id,:extension,:modifierExtension,:type,:_type,:value,:_value,:preferred,:_preferred,:comment,:_comment,:period,)



mutable struct ExplanationOfBenefit_Payment <: AbstractFHIRType
    _date::Union{Element, Nothing}
    adjustment::Union{Money, Nothing}
    adjustmentReason::Union{CodeableConcept, Nothing}
    amount::Union{Money, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Payment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Payment} = (:id,:extension,:modifierExtension,:type,:adjustment,:adjustmentReason,:date,:_date,:amount,:identifier,)



mutable struct Procedure <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _language::Union{Element, Nothing}
    _performedDateTime::Union{Element, Nothing}
    _performedString::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    asserter::Union{Reference, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    bodySite::Union{Vector{CodeableConcept}, Nothing}
    category::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    complication::Union{Vector{CodeableConcept}, Nothing}
    complicationDetail::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focalDevice::Union{Vector{Procedure_FocalDevice}, Nothing}
    followUp::Union{Vector{CodeableConcept}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    outcome::Union{CodeableConcept, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performedAge::Union{Age, Nothing}
    performedDateTime::Union{string_fhir, Nothing}
    performedPeriod::Union{Period, Nothing}
    performedRange::Union{Range, Nothing}
    performedString::Union{string_fhir, Nothing}
    performer::Union{Vector{Procedure_Performer}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    recorder::Union{Reference, Nothing}
    report::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    usedCode::Union{Vector{CodeableConcept}, Nothing}
    usedReference::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Procedure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Procedure} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:partOf,:status,:_status,:statusReason,:category,:code,:subject,:encounter,:performedDateTime,:_performedDateTime,:performedPeriod,:performedString,:_performedString,:performedAge,:performedRange,:recorder,:asserter,:performer,:location,:reasonCode,:reasonReference,:bodySite,:outcome,:report,:complication,:complicationDetail,:followUp,:note,:focalDevice,:usedReference,:usedCode,)



mutable struct Coverage_CostToBeneficiary <: AbstractFHIRType
    exception::Union{Vector{Coverage_Exception}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueMoney::Union{Money, Nothing}
    valueQuantity::Union{Quantity, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Coverage_CostToBeneficiary} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Coverage_CostToBeneficiary} = (:id,:extension,:modifierExtension,:type,:valueQuantity,:valueMoney,:exception,)



mutable struct MarketingStatus <: AbstractFHIRType
    _restoreDate::Union{Element, Nothing}
    country::Union{CodeableConcept, Nothing}
    dateRange::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    jurisdiction::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    restoreDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MarketingStatus} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MarketingStatus} = (:id,:extension,:modifierExtension,:country,:jurisdiction,:status,:dateRange,:restoreDate,:_restoreDate,)



mutable struct CodeSystem_Filter <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _operator::Union{Vector{Element}, Nothing}
    _value::Union{Element, Nothing}
    code::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operator::Union{Vector{String}, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem_Filter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem_Filter} = (:id,:extension,:modifierExtension,:code,:_code,:description,:_description,:operator,:_operator,:value,:_value,)



mutable struct ElementDefinition_Constraint <: AbstractFHIRType
    _expression::Union{Element, Nothing}
    _human::Union{Element, Nothing}
    _key::Union{Element, Nothing}
    _requirements::Union{Element, Nothing}
    _severity::Union{Element, Nothing}
    _xpath::Union{Element, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    human::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    key::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    requirements::Union{string_fhir, Nothing}
    severity::Union{String, Nothing}
    source::Union{String, Nothing}
    xpath::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Constraint} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Constraint} = (:id,:extension,:modifierExtension,:key,:_key,:requirements,:_requirements,:severity,:_severity,:human,:_human,:expression,:_expression,:xpath,:_xpath,:source,)



mutable struct Provenance_Entity <: AbstractFHIRType
    _role::Union{Element, Nothing}
    agent::Union{Vector{Provenance_Agent}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    role::Union{String, Nothing}
    what::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Provenance_Entity} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Provenance_Entity} = (:id,:extension,:modifierExtension,:role,:_role,:what,:agent,)



mutable struct MedicinalProductContraindication <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    comorbidity::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    disease::Union{CodeableConcept, Nothing}
    diseaseStatus::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    otherTherapy::Union{Vector{MedicinalProductContraindication_OtherTherapy}, Nothing}
    population::Union{Vector{Population}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    therapeuticIndication::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductContraindication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductContraindication} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:subject,:disease,:diseaseStatus,:comorbidity,:therapeuticIndication,:otherTherapy,:population,)



mutable struct Device_DeviceName <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device_DeviceName} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device_DeviceName} = (:id,:extension,:modifierExtension,:name,:_name,:type,:_type,)



mutable struct PlanDefinition_RelatedAction <: AbstractFHIRType
    _actionId::Union{Element, Nothing}
    _relationship::Union{Element, Nothing}
    actionId::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    offsetDuration::Union{Duration, Nothing}
    offsetRange::Union{Range, Nothing}
    relationship::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_RelatedAction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_RelatedAction} = (:id,:extension,:modifierExtension,:actionId,:_actionId,:relationship,:_relationship,:offsetDuration,:offsetRange,)



mutable struct CapabilityStatement_Interaction1 <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _documentation::Union{Element, Nothing}
    code::Union{String, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Interaction1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Interaction1} = (:id,:extension,:modifierExtension,:code,:_code,:documentation,:_documentation,)



mutable struct ClaimResponse_Payment <: AbstractFHIRType
    _date::Union{Element, Nothing}
    adjustment::Union{Money, Nothing}
    adjustmentReason::Union{CodeableConcept, Nothing}
    amount::Union{Money, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Payment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Payment} = (:id,:extension,:modifierExtension,:type,:adjustment,:adjustmentReason,:date,:_date,:amount,:identifier,)



mutable struct Device_UdiCarrier <: AbstractFHIRType
    _carrierAIDC::Union{Element, Nothing}
    _carrierHRF::Union{Element, Nothing}
    _deviceIdentifier::Union{Element, Nothing}
    _entryType::Union{Element, Nothing}
    _issuer::Union{Element, Nothing}
    _jurisdiction::Union{Element, Nothing}
    carrierAIDC::Union{String, Nothing}
    carrierHRF::Union{string_fhir, Nothing}
    deviceIdentifier::Union{string_fhir, Nothing}
    entryType::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    issuer::Union{String, Nothing}
    jurisdiction::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device_UdiCarrier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device_UdiCarrier} = (:id,:extension,:modifierExtension,:deviceIdentifier,:_deviceIdentifier,:issuer,:_issuer,:jurisdiction,:_jurisdiction,:carrierAIDC,:_carrierAIDC,:carrierHRF,:_carrierHRF,:entryType,:_entryType,)



mutable struct Consent_Data <: AbstractFHIRType
    _meaning::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    meaning::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent_Data} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent_Data} = (:id,:extension,:modifierExtension,:meaning,:_meaning,:reference,)



mutable struct SubstanceSpecification_Representation <: AbstractFHIRType
    _representation::Union{Element, Nothing}
    attachment::Union{Attachment, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    representation::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Representation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Representation} = (:id,:extension,:modifierExtension,:type,:representation,:_representation,:attachment,)



mutable struct Claim_Procedure <: AbstractFHIRType
    _date::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    procedureCodeableConcept::Union{CodeableConcept, Nothing}
    procedureReference::Union{Reference, Nothing}
    sequence::Union{SafeInt32, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Procedure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Procedure} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:type,:date,:_date,:procedureCodeableConcept,:procedureReference,:udi,)



mutable struct CodeSystem_Designation <: AbstractFHIRType
    _language::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    use::Union{Coding, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem_Designation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem_Designation} = (:id,:extension,:modifierExtension,:language,:_language,:use,:value,:_value,)



mutable struct Patient_Link <: AbstractFHIRType
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    other::Union{Reference, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Patient_Link} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Patient_Link} = (:id,:extension,:modifierExtension,:other,:type,:_type,)



mutable struct MedicationKnowledge_Cost <: AbstractFHIRType
    _source::Union{Element, Nothing}
    cost::Union{Money, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Cost} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Cost} = (:id,:extension,:modifierExtension,:type,:source,:_source,:cost,)



mutable struct AuditEvent_Detail <: AbstractFHIRType
    _type::Union{Element, Nothing}
    _valueBase64Binary::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{string_fhir, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent_Detail} = (:id,:extension,:modifierExtension,:type,:_type,:valueString,:_valueString,:valueBase64Binary,:_valueBase64Binary,)



mutable struct PlanDefinition_Condition <: AbstractFHIRType
    _kind::Union{Element, Nothing}
    expression::Union{Expression, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    kind::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_Condition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_Condition} = (:id,:extension,:modifierExtension,:kind,:_kind,:expression,)



mutable struct Claim_CareTeam <: AbstractFHIRType
    _responsible::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    provider::Union{Reference, Nothing}
    qualification::Union{CodeableConcept, Nothing}
    responsible::Union{Bool, Nothing}
    role::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_CareTeam} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_CareTeam} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:provider,:responsible,:_responsible,:role,:qualification,)



mutable struct StructureMap_Dependent <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _variable::Union{Vector{Element}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
    variable::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Dependent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Dependent} = (:id,:extension,:modifierExtension,:name,:_name,:variable,:_variable,)



mutable struct EpisodeOfCare_StatusHistory <: AbstractFHIRType
    _status::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    status::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EpisodeOfCare_StatusHistory} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EpisodeOfCare_StatusHistory} = (:id,:extension,:modifierExtension,:status,:_status,:period,)



mutable struct ResearchStudy_Objective <: AbstractFHIRType
    _name::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchStudy_Objective} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchStudy_Objective} = (:id,:extension,:modifierExtension,:name,:_name,:type,)



mutable struct SubstanceAmount <: AbstractFHIRType
    _amountString::Union{Element, Nothing}
    _amountText::Union{Element, Nothing}
    amountQuantity::Union{Quantity, Nothing}
    amountRange::Union{Range, Nothing}
    amountString::Union{string_fhir, Nothing}
    amountText::Union{string_fhir, Nothing}
    amountType::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    referenceRange::Union{SubstanceAmount_ReferenceRange, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceAmount} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceAmount} = (:id,:extension,:modifierExtension,:amountQuantity,:amountRange,:amountString,:_amountString,:amountType,:amountText,:_amountText,:referenceRange,)



mutable struct EnrollmentResponse <: AbstractResource
    _created::Union{Element, Nothing}
    _disposition::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    disposition::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organization::Union{Reference, Nothing}
    outcome::Union{String, Nothing}
    request::Union{Reference, Nothing}
    requestProvider::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EnrollmentResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EnrollmentResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:request,:outcome,:_outcome,:disposition,:_disposition,:created,:_created,:organization,:requestProvider,)



mutable struct SupplyRequest_Parameter <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SupplyRequest_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SupplyRequest_Parameter} = (:id,:extension,:modifierExtension,:code,:valueCodeableConcept,:valueQuantity,:valueRange,:valueBoolean,:_valueBoolean,)



mutable struct ImmunizationRecommendation_DateCriterion <: AbstractFHIRType
    _value::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    value::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImmunizationRecommendation_DateCriterion} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImmunizationRecommendation_DateCriterion} = (:id,:extension,:modifierExtension,:code,:value,:_value,)



mutable struct MessageHeader_Response <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _identifier::Union{Element, Nothing}
    code::Union{String, Nothing}
    details::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageHeader_Response} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageHeader_Response} = (:id,:extension,:modifierExtension,:identifier,:_identifier,:code,:_code,:details,)



mutable struct ExplanationOfBenefit_Adjudication <: AbstractFHIRType
    _value::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{CodeableConcept, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Adjudication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Adjudication} = (:id,:extension,:modifierExtension,:category,:reason,:amount,:value,:_value,)



mutable struct TerminologyCapabilities_Software <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Software} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Software} = (:id,:extension,:modifierExtension,:name,:_name,:version,:_version,)



mutable struct SubstanceSourceMaterial_FractionDescription <: AbstractFHIRType
    _fraction::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fraction::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    materialType::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_FractionDescription} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_FractionDescription} = (:id,:extension,:modifierExtension,:fraction,:_fraction,:materialType,)



mutable struct ExampleScenario_ContainedInstance <: AbstractFHIRType
    _resourceId::Union{Element, Nothing}
    _versionId::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceId::Union{string_fhir, Nothing}
    versionId::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_ContainedInstance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_ContainedInstance} = (:id,:extension,:modifierExtension,:resourceId,:_resourceId,:versionId,:_versionId,)



mutable struct MedicationKnowledge_DrugCharacteristic <: AbstractFHIRType
    _valueBase64Binary::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_DrugCharacteristic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_DrugCharacteristic} = (:id,:extension,:modifierExtension,:type,:valueCodeableConcept,:valueString,:_valueString,:valueQuantity,:valueBase64Binary,:_valueBase64Binary,)



mutable struct DeviceDefinition_Material <: AbstractFHIRType
    _allergenicIndicator::Union{Element, Nothing}
    _alternate::Union{Element, Nothing}
    allergenicIndicator::Union{Bool, Nothing}
    alternate::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    substance::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_Material} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_Material} = (:id,:extension,:modifierExtension,:substance,:alternate,:_alternate,:allergenicIndicator,:_allergenicIndicator,)



mutable struct Specimen_Container <: AbstractFHIRType
    _description::Union{Element, Nothing}
    additiveCodeableConcept::Union{CodeableConcept, Nothing}
    additiveReference::Union{Reference, Nothing}
    capacity::Union{Quantity, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    specimenQuantity::Union{Quantity, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Specimen_Container} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Specimen_Container} = (:id,:extension,:modifierExtension,:identifier,:description,:_description,:type,:capacity,:specimenQuantity,:additiveCodeableConcept,:additiveReference,)



mutable struct MedicinalProduct_SpecialDesignation <: AbstractFHIRType
    _date::Union{Element, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    indicationCodeableConcept::Union{CodeableConcept, Nothing}
    indicationReference::Union{Reference, Nothing}
    intendedUse::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    species::Union{CodeableConcept, Nothing}
    status::Union{CodeableConcept, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct_SpecialDesignation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct_SpecialDesignation} = (:id,:extension,:modifierExtension,:identifier,:type,:intendedUse,:indicationCodeableConcept,:indicationReference,:status,:date,:_date,:species,)



mutable struct Coverage_Class <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Coverage_Class} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Coverage_Class} = (:id,:extension,:modifierExtension,:type,:value,:_value,:name,:_name,)



mutable struct SubstanceSpecification_Isotope <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    halfLife::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    molecularWeight::Union{SubstanceSpecification_MolecularWeight, Nothing}
    name::Union{CodeableConcept, Nothing}
    substitution::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Isotope} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Isotope} = (:id,:extension,:modifierExtension,:identifier,:name,:substitution,:halfLife,:molecularWeight,)



mutable struct EffectEvidenceSynthesis_PrecisionEstimate <: AbstractFHIRType
    _from::Union{Element, Nothing}
    _level::Union{Element, Nothing}
    _to::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    from::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    level::Union{FHIRNumber, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    to::Union{FHIRNumber, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_PrecisionEstimate} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_PrecisionEstimate} = (:id,:extension,:modifierExtension,:type,:level,:_level,:from,:_from,:to,:_to,)



mutable struct ValueSet_Parameter <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueUri::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Parameter} = (:id,:extension,:modifierExtension,:name,:_name,:valueString,:_valueString,:valueBoolean,:_valueBoolean,:valueInteger,:_valueInteger,:valueDecimal,:_valueDecimal,:valueUri,:_valueUri,:valueCode,:_valueCode,:valueDateTime,:_valueDateTime,)



mutable struct Account_Guarantor <: AbstractFHIRType
    _onHold::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onHold::Union{Bool, Nothing}
    party::Union{Reference, Nothing}
    period::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Account_Guarantor} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Account_Guarantor} = (:id,:extension,:modifierExtension,:party,:onHold,:_onHold,:period,)



mutable struct List_Entry <: AbstractFHIRType
    _date::Union{Element, Nothing}
    _deleted::Union{Element, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    deleted::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    flag::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    item::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: List_Entry} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: List_Entry} = (:id,:extension,:modifierExtension,:flag,:deleted,:_deleted,:date,:_date,:item,)



mutable struct ExplanationOfBenefit_Insurance <: AbstractFHIRType
    _focal::Union{Element, Nothing}
    _preAuthRef::Union{Vector{Element}, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focal::Union{Bool, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preAuthRef::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Insurance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Insurance} = (:id,:extension,:modifierExtension,:focal,:_focal,:coverage,:preAuthRef,:_preAuthRef,)



mutable struct GraphDefinition_Compartment <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _rule::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    code::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    rule::Union{String, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: GraphDefinition_Compartment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: GraphDefinition_Compartment} = (:id,:extension,:modifierExtension,:use,:_use,:code,:_code,:rule,:_rule,:expression,:_expression,:description,:_description,)



mutable struct Basic <: AbstractResource
    _created::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    author::Union{Reference, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Basic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Basic} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:code,:subject,:created,:_created,:author,)



mutable struct RiskEvidenceSynthesis_SampleSize <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _numberOfParticipants::Union{Element, Nothing}
    _numberOfStudies::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfParticipants::Union{SafeInt32, Nothing}
    numberOfStudies::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis_SampleSize} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis_SampleSize} = (:id,:extension,:modifierExtension,:description,:_description,:numberOfStudies,:_numberOfStudies,:numberOfParticipants,:_numberOfParticipants,)



mutable struct ElementDefinition_Base <: AbstractFHIRType
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Base} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Base} = (:id,:extension,:modifierExtension,:path,:_path,:min,:_min,:max,:_max,)



mutable struct SubstanceNucleicAcid_Linkage <: AbstractFHIRType
    _connectivity::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _residueSite::Union{Element, Nothing}
    connectivity::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    residueSite::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceNucleicAcid_Linkage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceNucleicAcid_Linkage} = (:id,:extension,:modifierExtension,:connectivity,:_connectivity,:identifier,:name,:_name,:residueSite,:_residueSite,)



mutable struct ElementDefinition_Binding <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _strength::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{String, Nothing}
    valueSet::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Binding} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Binding} = (:id,:extension,:modifierExtension,:strength,:_strength,:description,:_description,:valueSet,)



mutable struct ClaimResponse_Error <: AbstractFHIRType
    _detailSequence::Union{Element, Nothing}
    _itemSequence::Union{Element, Nothing}
    _subDetailSequence::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    detailSequence::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    itemSequence::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    subDetailSequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Error} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Error} = (:id,:extension,:modifierExtension,:itemSequence,:_itemSequence,:detailSequence,:_detailSequence,:subDetailSequence,:_subDetailSequence,:code,)



mutable struct PaymentReconciliation_Detail <: AbstractFHIRType
    _date::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    payee::Union{Reference, Nothing}
    predecessor::Union{Identifier, Nothing}
    request::Union{Reference, Nothing}
    response::Union{Reference, Nothing}
    responsible::Union{Reference, Nothing}
    submitter::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PaymentReconciliation_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PaymentReconciliation_Detail} = (:id,:extension,:modifierExtension,:identifier,:predecessor,:type,:request,:submitter,:response,:date,:_date,:responsible,:payee,:amount,)



mutable struct StructureMap_Parameter <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Parameter} = (:id,:extension,:modifierExtension,:valueId,:_valueId,:valueString,:_valueString,:valueBoolean,:_valueBoolean,:valueInteger,:_valueInteger,:valueDecimal,:_valueDecimal,)



mutable struct CatalogEntry_RelatedEntry <: AbstractFHIRType
    _relationtype::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    item::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    relationtype::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CatalogEntry_RelatedEntry} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CatalogEntry_RelatedEntry} = (:id,:extension,:modifierExtension,:relationtype,:_relationtype,:item,)



mutable struct OperationDefinition_Overload <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _parameterName::Union{Vector{Element}, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    parameterName::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationDefinition_Overload} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationDefinition_Overload} = (:id,:extension,:modifierExtension,:parameterName,:_parameterName,:comment,:_comment,)



mutable struct StructureDefinition_Context <: AbstractFHIRType
    _expression::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureDefinition_Context} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureDefinition_Context} = (:id,:extension,:modifierExtension,:type,:_type,:expression,:_expression,)



mutable struct DetectedIssue_Mitigation <: AbstractFHIRType
    _date::Union{Element, Nothing}
    action::Union{CodeableConcept, Nothing}
    author::Union{Reference, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DetectedIssue_Mitigation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DetectedIssue_Mitigation} = (:id,:extension,:modifierExtension,:action,:date,:_date,:author,)



mutable struct DeviceDefinition_UdiDeviceIdentifier <: AbstractFHIRType
    _deviceIdentifier::Union{Element, Nothing}
    _issuer::Union{Element, Nothing}
    _jurisdiction::Union{Element, Nothing}
    deviceIdentifier::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    issuer::Union{String, Nothing}
    jurisdiction::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_UdiDeviceIdentifier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_UdiDeviceIdentifier} = (:id,:extension,:modifierExtension,:deviceIdentifier,:_deviceIdentifier,:issuer,:_issuer,:jurisdiction,:_jurisdiction,)



mutable struct Media <: AbstractResource
    _createdDateTime::Union{Element, Nothing}
    _deviceName::Union{Element, Nothing}
    _duration::Union{Element, Nothing}
    _frames::Union{Element, Nothing}
    _height::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _issued::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _width::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    content::Union{Attachment, Nothing}
    createdDateTime::Union{string_fhir, Nothing}
    createdPeriod::Union{Period, Nothing}
    device::Union{Reference, Nothing}
    deviceName::Union{string_fhir, Nothing}
    duration::Union{FHIRNumber, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    frames::Union{SafeInt32, Nothing}
    height::Union{SafeInt32, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modality::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    operator::Union{Reference, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    view::Union{CodeableConcept, Nothing}
    width::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Media} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Media} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:partOf,:status,:_status,:type,:modality,:view,:subject,:encounter,:createdDateTime,:_createdDateTime,:createdPeriod,:issued,:_issued,:operator,:reasonCode,:bodySite,:deviceName,:_deviceName,:device,:height,:_height,:width,:_width,:frames,:_frames,:duration,:_duration,:content,:note,)



mutable struct MedicinalProductAuthorization_Procedure <: AbstractFHIRType
    _dateDateTime::Union{Element, Nothing}
    application::Union{Vector{MedicinalProductAuthorization_Procedure}, Nothing}
    dateDateTime::Union{string_fhir, Nothing}
    datePeriod::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductAuthorization_Procedure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductAuthorization_Procedure} = (:id,:extension,:modifierExtension,:identifier,:type,:datePeriod,:dateDateTime,:_dateDateTime,:application,)



mutable struct Claim_SupportingInfo <: AbstractFHIRType
    _sequence::Union{Element, Nothing}
    _timingDate::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    timingDate::Union{string_fhir, Nothing}
    timingPeriod::Union{Period, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_SupportingInfo} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_SupportingInfo} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:category,:code,:timingDate,:_timingDate,:timingPeriod,:valueBoolean,:_valueBoolean,:valueString,:_valueString,:valueQuantity,:valueAttachment,:valueReference,:reason,)



mutable struct TerminologyCapabilities_Filter <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _op::Union{Vector{Element}, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    op::Union{Vector{String}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Filter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Filter} = (:id,:extension,:modifierExtension,:code,:_code,:op,:_op,)



mutable struct TestReport_Operation <: AbstractFHIRType
    _detail::Union{Element, Nothing}
    _message::Union{Element, Nothing}
    _result::Union{Element, Nothing}
    detail::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    message::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    result::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Operation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Operation} = (:id,:extension,:modifierExtension,:result,:_result,:message,:_message,:detail,:_detail,)



mutable struct NutritionOrder_OralDiet <: AbstractFHIRType
    _instruction::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fluidConsistencyType::Union{Vector{CodeableConcept}, Nothing}
    id::Union{string_fhir, Nothing}
    instruction::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    nutrient::Union{Vector{NutritionOrder_Nutrient}, Nothing}
    schedule::Union{Vector{Timing}, Nothing}
    texture::Union{Vector{NutritionOrder_Texture}, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_OralDiet} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_OralDiet} = (:id,:extension,:modifierExtension,:type,:schedule,:nutrient,:texture,:fluidConsistencyType,:instruction,:_instruction,)



mutable struct HealthcareService_NotAvailable <: AbstractFHIRType
    _description::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    during::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: HealthcareService_NotAvailable} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: HealthcareService_NotAvailable} = (:id,:extension,:modifierExtension,:description,:_description,:during,)



mutable struct Contract_Answer <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueUri::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Answer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Answer} = (:id,:extension,:modifierExtension,:valueBoolean,:_valueBoolean,:valueDecimal,:_valueDecimal,:valueInteger,:_valueInteger,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueTime,:_valueTime,:valueString,:_valueString,:valueUri,:_valueUri,:valueAttachment,:valueCoding,:valueQuantity,:valueReference,)



mutable struct ClaimResponse_Adjudication <: AbstractFHIRType
    _value::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{CodeableConcept, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Adjudication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Adjudication} = (:id,:extension,:modifierExtension,:category,:reason,:amount,:value,:_value,)



mutable struct MedicationKnowledge_Ingredient <: AbstractFHIRType
    _isActive::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    isActive::Union{Bool, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{Ratio, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Ingredient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Ingredient} = (:id,:extension,:modifierExtension,:itemCodeableConcept,:itemReference,:isActive,:_isActive,:strength,)



mutable struct SubstanceProtein_Subunit <: AbstractFHIRType
    _cTerminalModification::Union{Element, Nothing}
    _length::Union{Element, Nothing}
    _nTerminalModification::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    _subunit::Union{Element, Nothing}
    cTerminalModification::Union{string_fhir, Nothing}
    cTerminalModificationId::Union{Identifier, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    length::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    nTerminalModification::Union{string_fhir, Nothing}
    nTerminalModificationId::Union{Identifier, Nothing}
    sequence::Union{string_fhir, Nothing}
    sequenceAttachment::Union{Attachment, Nothing}
    subunit::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceProtein_Subunit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceProtein_Subunit} = (:id,:extension,:modifierExtension,:subunit,:_subunit,:sequence,:_sequence,:length,:_length,:sequenceAttachment,:nTerminalModificationId,:nTerminalModification,:_nTerminalModification,:cTerminalModificationId,:cTerminalModification,:_cTerminalModification,)



mutable struct ObservationDefinition_QualifiedInterval <: AbstractFHIRType
    _category::Union{Element, Nothing}
    _condition::Union{Element, Nothing}
    _gender::Union{Element, Nothing}
    age::Union{Range, Nothing}
    appliesTo::Union{Vector{CodeableConcept}, Nothing}
    category::Union{String, Nothing}
    condition::Union{string_fhir, Nothing}
    context::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    gestationalAge::Union{Range, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    range::Union{Range, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ObservationDefinition_QualifiedInterval} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ObservationDefinition_QualifiedInterval} = (:id,:extension,:modifierExtension,:category,:_category,:range,:context,:appliesTo,:gender,:_gender,:age,:gestationalAge,:condition,:_condition,)



mutable struct SpecimenDefinition_Container <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _minimumVolumeString::Union{Element, Nothing}
    _preparation::Union{Element, Nothing}
    additive::Union{Vector{SpecimenDefinition_Additive}, Nothing}
    cap::Union{CodeableConcept, Nothing}
    capacity::Union{Quantity, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    material::Union{CodeableConcept, Nothing}
    minimumVolumeQuantity::Union{Quantity, Nothing}
    minimumVolumeString::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preparation::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SpecimenDefinition_Container} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SpecimenDefinition_Container} = (:id,:extension,:modifierExtension,:material,:type,:cap,:description,:_description,:capacity,:minimumVolumeQuantity,:minimumVolumeString,:_minimumVolumeString,:additive,:preparation,:_preparation,)



mutable struct MedicinalProduct_NamePart <: AbstractFHIRType
    _part::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    part::Union{string_fhir, Nothing}
    type::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct_NamePart} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct_NamePart} = (:id,:extension,:modifierExtension,:part,:_part,:type,)



mutable struct Claim_Diagnosis <: AbstractFHIRType
    _sequence::Union{Element, Nothing}
    diagnosisCodeableConcept::Union{CodeableConcept, Nothing}
    diagnosisReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onAdmission::Union{CodeableConcept, Nothing}
    packageCode::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Diagnosis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Diagnosis} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:diagnosisCodeableConcept,:diagnosisReference,:type,:onAdmission,:packageCode,)



mutable struct MedicinalProductUndesirableEffect <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    classification::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    frequencyOfOccurrence::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    population::Union{Vector{Population}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    symptomConditionEffect::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductUndesirableEffect} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductUndesirableEffect} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:subject,:symptomConditionEffect,:classification,:frequencyOfOccurrence,:population,)



mutable struct ImplementationGuide_Resource1 <: AbstractFHIRType
    _exampleBoolean::Union{Element, Nothing}
    _exampleCanonical::Union{Element, Nothing}
    _relativePath::Union{Element, Nothing}
    exampleBoolean::Union{Bool, Nothing}
    exampleCanonical::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reference::Union{Reference, Nothing}
    relativePath::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Resource1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Resource1} = (:id,:extension,:modifierExtension,:reference,:exampleBoolean,:_exampleBoolean,:exampleCanonical,:_exampleCanonical,:relativePath,:_relativePath,)



mutable struct Linkage_Item <: AbstractFHIRType
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resource::Union{Reference, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Linkage_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Linkage_Item} = (:id,:extension,:modifierExtension,:type,:_type,:resource,)



mutable struct SearchParameter_Component <: AbstractFHIRType
    _expression::Union{Element, Nothing}
    definition::Union{String, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SearchParameter_Component} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SearchParameter_Component} = (:id,:extension,:modifierExtension,:definition,:expression,:_expression,)



mutable struct CoverageEligibilityRequest_SupportingInfo <: AbstractFHIRType
    _appliesToAll::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    appliesToAll::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    information::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityRequest_SupportingInfo} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityRequest_SupportingInfo} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:information,:appliesToAll,:_appliesToAll,)



mutable struct TestScript_Destination <: AbstractFHIRType
    _index::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    index::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Destination} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Destination} = (:id,:extension,:modifierExtension,:index,:_index,:profile,)



mutable struct QuestionnaireResponse_Answer <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    item::Union{Vector{QuestionnaireResponse_Item}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueReference::Union{Reference, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueUri::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: QuestionnaireResponse_Answer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: QuestionnaireResponse_Answer} = (:id,:extension,:modifierExtension,:valueBoolean,:_valueBoolean,:valueDecimal,:_valueDecimal,:valueInteger,:_valueInteger,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueTime,:_valueTime,:valueString,:_valueString,:valueUri,:_valueUri,:valueAttachment,:valueCoding,:valueQuantity,:valueReference,:item,)



mutable struct StructureMap_Input <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
    type::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Input} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Input} = (:id,:extension,:modifierExtension,:name,:_name,:type,:_type,:mode,:_mode,:documentation,:_documentation,)



mutable struct Condition <: AbstractResource
    _abatementDateTime::Union{Element, Nothing}
    _abatementString::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _onsetDateTime::Union{Element, Nothing}
    _onsetString::Union{Element, Nothing}
    _recordedDate::Union{Element, Nothing}
    abatementAge::Union{Age, Nothing}
    abatementDateTime::Union{string_fhir, Nothing}
    abatementPeriod::Union{Period, Nothing}
    abatementRange::Union{Range, Nothing}
    abatementString::Union{string_fhir, Nothing}
    asserter::Union{Reference, Nothing}
    bodySite::Union{Vector{CodeableConcept}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    clinicalStatus::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    evidence::Union{Vector{Condition_Evidence}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    onsetAge::Union{Age, Nothing}
    onsetDateTime::Union{string_fhir, Nothing}
    onsetPeriod::Union{Period, Nothing}
    onsetRange::Union{Range, Nothing}
    onsetString::Union{string_fhir, Nothing}
    recordedDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    recorder::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    severity::Union{CodeableConcept, Nothing}
    stage::Union{Vector{Condition_Stage}, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    verificationStatus::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Condition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Condition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:clinicalStatus,:verificationStatus,:category,:severity,:code,:bodySite,:subject,:encounter,:onsetDateTime,:_onsetDateTime,:onsetAge,:onsetPeriod,:onsetRange,:onsetString,:_onsetString,:abatementDateTime,:_abatementDateTime,:abatementAge,:abatementPeriod,:abatementRange,:abatementString,:_abatementString,:recordedDate,:_recordedDate,:recorder,:asserter,:stage,:evidence,:note,)



mutable struct ExampleScenario_Actor <: AbstractFHIRType
    _actorId::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    actorId::Union{string_fhir, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Actor} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Actor} = (:id,:extension,:modifierExtension,:actorId,:_actorId,:type,:_type,:name,:_name,:description,:_description,)



mutable struct MedicationRequest_Substitution <: AbstractFHIRType
    _allowedBoolean::Union{Element, Nothing}
    allowedBoolean::Union{Bool, Nothing}
    allowedCodeableConcept::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationRequest_Substitution} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationRequest_Substitution} = (:id,:extension,:modifierExtension,:allowedBoolean,:_allowedBoolean,:allowedCodeableConcept,:reason,)



mutable struct PlanDefinition_Participant <: AbstractFHIRType
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    role::Union{CodeableConcept, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_Participant} = (:id,:extension,:modifierExtension,:type,:_type,:role,)



mutable struct TestReport_Assert <: AbstractFHIRType
    _detail::Union{Element, Nothing}
    _message::Union{Element, Nothing}
    _result::Union{Element, Nothing}
    detail::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    message::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    result::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Assert} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Assert} = (:id,:extension,:modifierExtension,:result,:_result,:message,:_message,:detail,:_detail,)



mutable struct Contract_ContentDefinition <: AbstractFHIRType
    _copyright::Union{Element, Nothing}
    _publicationDate::Union{Element, Nothing}
    _publicationStatus::Union{Element, Nothing}
    copyright::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    publicationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    publicationStatus::Union{String, Nothing}
    publisher::Union{Reference, Nothing}
    subType::Union{CodeableConcept, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_ContentDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_ContentDefinition} = (:id,:extension,:modifierExtension,:type,:subType,:publisher,:publicationDate,:_publicationDate,:publicationStatus,:_publicationStatus,:copyright,:_copyright,)



mutable struct MedicationRequest_DispenseRequest <: AbstractFHIRType
    _numberOfRepeatsAllowed::Union{Element, Nothing}
    dispenseInterval::Union{Duration, Nothing}
    expectedSupplyDuration::Union{Duration, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    initialFill::Union{MedicationRequest_InitialFill, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfRepeatsAllowed::Union{SafeInt32, Nothing}
    performer::Union{Reference, Nothing}
    quantity::Union{Quantity, Nothing}
    validityPeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationRequest_DispenseRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationRequest_DispenseRequest} = (:id,:extension,:modifierExtension,:initialFill,:dispenseInterval,:validityPeriod,:numberOfRepeatsAllowed,:_numberOfRepeatsAllowed,:quantity,:expectedSupplyDuration,:performer,)



mutable struct Measure_Component <: AbstractFHIRType
    _description::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    criteria::Union{Expression, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure_Component} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure_Component} = (:id,:extension,:modifierExtension,:code,:description,:_description,:criteria,)



mutable struct RiskAssessment_Prediction <: AbstractFHIRType
    _probabilityDecimal::Union{Element, Nothing}
    _rationale::Union{Element, Nothing}
    _relativeRisk::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{CodeableConcept, Nothing}
    probabilityDecimal::Union{FHIRNumber, Nothing}
    probabilityRange::Union{Range, Nothing}
    qualitativeRisk::Union{CodeableConcept, Nothing}
    rationale::Union{string_fhir, Nothing}
    relativeRisk::Union{FHIRNumber, Nothing}
    whenPeriod::Union{Period, Nothing}
    whenRange::Union{Range, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskAssessment_Prediction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskAssessment_Prediction} = (:id,:extension,:modifierExtension,:outcome,:probabilityDecimal,:_probabilityDecimal,:probabilityRange,:qualitativeRisk,:relativeRisk,:_relativeRisk,:whenPeriod,:whenRange,:rationale,:_rationale,)



mutable struct DocumentReference_RelatesTo <: AbstractFHIRType
    _code::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    target::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentReference_RelatesTo} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentReference_RelatesTo} = (:id,:extension,:modifierExtension,:code,:_code,:target,)



mutable struct ConceptMap_DependsOn <: AbstractFHIRType
    _display::Union{Element, Nothing}
    _property::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    property::Union{String, Nothing}
    system::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap_DependsOn} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap_DependsOn} = (:id,:extension,:modifierExtension,:property,:_property,:system,:value,:_value,:display,:_display,)



mutable struct SubstanceReferenceInformation_Target <: AbstractFHIRType
    _amountString::Union{Element, Nothing}
    amountQuantity::Union{Quantity, Nothing}
    amountRange::Union{Range, Nothing}
    amountString::Union{string_fhir, Nothing}
    amountType::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    interaction::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organism::Union{CodeableConcept, Nothing}
    organismType::Union{CodeableConcept, Nothing}
    source::Union{Vector{Reference}, Nothing}
    target::Union{Identifier, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceReferenceInformation_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceReferenceInformation_Target} = (:id,:extension,:modifierExtension,:target,:type,:interaction,:organism,:organismType,:amountQuantity,:amountRange,:amountString,:_amountString,:amountType,:source,)



mutable struct Device_Version <: AbstractFHIRType
    _value::Union{Element, Nothing}
    component::Union{Identifier, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device_Version} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device_Version} = (:id,:extension,:modifierExtension,:type,:component,:value,:_value,)



mutable struct Observation_ReferenceRange <: AbstractFHIRType
    _text::Union{Element, Nothing}
    age::Union{Range, Nothing}
    appliesTo::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    high::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    low::Union{Quantity, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Observation_ReferenceRange} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Observation_ReferenceRange} = (:id,:extension,:modifierExtension,:low,:high,:type,:appliesTo,:age,:text,:_text,)



mutable struct DeviceDefinition_Specialization <: AbstractFHIRType
    _systemType::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    systemType::Union{string_fhir, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition_Specialization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition_Specialization} = (:id,:extension,:modifierExtension,:systemType,:_systemType,:version,:_version,)



mutable struct Patient_Contact <: AbstractFHIRType
    _gender::Union{Element, Nothing}
    address::Union{Address, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{HumanName, Nothing}
    organization::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    relationship::Union{Vector{CodeableConcept}, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Patient_Contact} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Patient_Contact} = (:id,:extension,:modifierExtension,:relationship,:name,:telecom,:address,:gender,:_gender,:organization,:period,)



mutable struct FamilyMemberHistory_Condition <: AbstractFHIRType
    _contributedToDeath::Union{Element, Nothing}
    _onsetString::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    contributedToDeath::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    onsetAge::Union{Age, Nothing}
    onsetPeriod::Union{Period, Nothing}
    onsetRange::Union{Range, Nothing}
    onsetString::Union{string_fhir, Nothing}
    outcome::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: FamilyMemberHistory_Condition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: FamilyMemberHistory_Condition} = (:id,:extension,:modifierExtension,:code,:outcome,:contributedToDeath,:_contributedToDeath,:onsetAge,:onsetRange,:onsetPeriod,:onsetString,:_onsetString,:note,)



mutable struct Binary <: AbstractResource
    _contentType::Union{Element, Nothing}
    _data::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    contentType::Union{String, Nothing}
    data::Union{String, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    resourceType::Union{String, Nothing}
    securityContext::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Binary} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Binary} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:contentType,:_contentType,:securityContext,:data,:_data,)



mutable struct ActivityDefinition_Participant <: AbstractFHIRType
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    role::Union{CodeableConcept, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ActivityDefinition_Participant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ActivityDefinition_Participant} = (:id,:extension,:modifierExtension,:type,:_type,:role,)



mutable struct AuditEvent_Source <: AbstractFHIRType
    _site::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    observer::Union{Reference, Nothing}
    site::Union{string_fhir, Nothing}
    type::Union{Vector{Coding}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent_Source} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent_Source} = (:id,:extension,:modifierExtension,:site,:_site,:observer,:type,)



mutable struct CompartmentDefinition_Resource <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _documentation::Union{Element, Nothing}
    _param::Union{Vector{Element}, Nothing}
    code::Union{String, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    param::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CompartmentDefinition_Resource} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CompartmentDefinition_Resource} = (:id,:extension,:modifierExtension,:code,:_code,:param,:_param,:documentation,:_documentation,)



mutable struct ResearchStudy_Arm <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchStudy_Arm} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchStudy_Arm} = (:id,:extension,:modifierExtension,:name,:_name,:type,:description,:_description,)



mutable struct CoverageEligibilityRequest_Insurance <: AbstractFHIRType
    _businessArrangement::Union{Element, Nothing}
    _focal::Union{Element, Nothing}
    businessArrangement::Union{string_fhir, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focal::Union{Bool, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityRequest_Insurance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityRequest_Insurance} = (:id,:extension,:modifierExtension,:focal,:_focal,:coverage,:businessArrangement,:_businessArrangement,)



mutable struct EventDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    trigger::Union{Vector{TriggerDefinition}, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EventDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EventDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:trigger,)



mutable struct ImplementationGuide_Global <: AbstractFHIRType
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    profile::Union{String, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Global} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Global} = (:id,:extension,:modifierExtension,:type,:_type,:profile,)



mutable struct Claim_SubDetail <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_SubDetail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_SubDetail} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:revenue,:category,:productOrService,:modifier,:programCode,:quantity,:unitPrice,:factor,:_factor,:net,:udi,)



mutable struct CarePlan_Detail <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _kind::Union{Element, Nothing}
    _scheduledString::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    dailyAmount::Union{Quantity, Nothing}
    description::Union{string_fhir, Nothing}
    doNotPerform::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    goal::Union{Vector{Reference}, Nothing}
    id::Union{string_fhir, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    kind::Union{String, Nothing}
    location::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    performer::Union{Vector{Reference}, Nothing}
    productCodeableConcept::Union{CodeableConcept, Nothing}
    productReference::Union{Reference, Nothing}
    quantity::Union{Quantity, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    scheduledPeriod::Union{Period, Nothing}
    scheduledString::Union{string_fhir, Nothing}
    scheduledTiming::Union{Timing, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CarePlan_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CarePlan_Detail} = (:id,:extension,:modifierExtension,:kind,:_kind,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:code,:reasonCode,:reasonReference,:goal,:status,:_status,:statusReason,:doNotPerform,:_doNotPerform,:scheduledTiming,:scheduledPeriod,:scheduledString,:_scheduledString,:location,:performer,:productCodeableConcept,:productReference,:dailyAmount,:quantity,:description,:_description,)



mutable struct CapabilityStatement_Endpoint <: AbstractFHIRType
    _address::Union{Element, Nothing}
    address::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    protocol::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Endpoint} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Endpoint} = (:id,:extension,:modifierExtension,:protocol,:address,:_address,)



mutable struct Evidence <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _shortTitle::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    exposureBackground::Union{Reference, Nothing}
    exposureVariant::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    outcome::Union{Vector{Reference}, Nothing}
    publisher::Union{string_fhir, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    shortTitle::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Evidence} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Evidence} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:shortTitle,:_shortTitle,:subtitle,:_subtitle,:status,:_status,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:note,:useContext,:jurisdiction,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:exposureBackground,:exposureVariant,:outcome,)



mutable struct Invoice_PriceComponent <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Invoice_PriceComponent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Invoice_PriceComponent} = (:id,:extension,:modifierExtension,:type,:_type,:code,:factor,:_factor,:amount,)



mutable struct CapabilityStatement_SearchParam <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    definition::Union{String, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_SearchParam} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_SearchParam} = (:id,:extension,:modifierExtension,:name,:_name,:definition,:type,:_type,:documentation,:_documentation,)



mutable struct Bundle_Response <: AbstractFHIRType
    _etag::Union{Element, Nothing}
    _lastModified::Union{Element, Nothing}
    _location::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    etag::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    lastModified::Union{Union{DateTime, ZonedDateTime}, Nothing}
    location::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{ResourceList, Nothing}
    status::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle_Response} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle_Response} = (:id,:extension,:modifierExtension,:status,:_status,:location,:_location,:etag,:_etag,:lastModified,:_lastModified,:outcome,)



mutable struct AllergyIntolerance_Reaction <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _onset::Union{Element, Nothing}
    _severity::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    exposureRoute::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    manifestation::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    onset::Union{Union{DateTime, ZonedDateTime}, Nothing}
    severity::Union{String, Nothing}
    substance::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AllergyIntolerance_Reaction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AllergyIntolerance_Reaction} = (:id,:extension,:modifierExtension,:substance,:manifestation,:description,:_description,:onset,:_onset,:severity,:_severity,:exposureRoute,:note,)



mutable struct MedicationKnowledge_MonitoringProgram <: AbstractFHIRType
    _name::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_MonitoringProgram} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_MonitoringProgram} = (:id,:extension,:modifierExtension,:type,:name,:_name,)



mutable struct Immunization_Reaction <: AbstractFHIRType
    _date::Union{Element, Nothing}
    _reported::Union{Element, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    detail::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reported::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Immunization_Reaction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Immunization_Reaction} = (:id,:extension,:modifierExtension,:date,:_date,:detail,:reported,:_reported,)



mutable struct TestScript_Variable <: AbstractFHIRType
    _defaultValue::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _headerField::Union{Element, Nothing}
    _hint::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    _sourceId::Union{Element, Nothing}
    defaultValue::Union{string_fhir, Nothing}
    description::Union{string_fhir, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    headerField::Union{string_fhir, Nothing}
    hint::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    path::Union{string_fhir, Nothing}
    sourceId::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Variable} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Variable} = (:id,:extension,:modifierExtension,:name,:_name,:defaultValue,:_defaultValue,:description,:_description,:expression,:_expression,:headerField,:_headerField,:hint,:_hint,:path,:_path,:sourceId,:_sourceId,)



mutable struct Immunization_ProtocolApplied <: AbstractFHIRType
    _doseNumberPositiveInt::Union{Element, Nothing}
    _doseNumberString::Union{Element, Nothing}
    _series::Union{Element, Nothing}
    _seriesDosesPositiveInt::Union{Element, Nothing}
    _seriesDosesString::Union{Element, Nothing}
    authority::Union{Reference, Nothing}
    doseNumberPositiveInt::Union{FHIRInt32, Nothing}
    doseNumberString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    series::Union{string_fhir, Nothing}
    seriesDosesPositiveInt::Union{FHIRInt32, Nothing}
    seriesDosesString::Union{string_fhir, Nothing}
    targetDisease::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Immunization_ProtocolApplied} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Immunization_ProtocolApplied} = (:id,:extension,:modifierExtension,:series,:_series,:authority,:targetDisease,:doseNumberPositiveInt,:_doseNumberPositiveInt,:doseNumberString,:_doseNumberString,:seriesDosesPositiveInt,:_seriesDosesPositiveInt,:seriesDosesString,:_seriesDosesString,)



mutable struct ResearchSubject <: AbstractResource
    _actualArm::Union{Element, Nothing}
    _assignedArm::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    actualArm::Union{string_fhir, Nothing}
    assignedArm::Union{string_fhir, Nothing}
    consent::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    individual::Union{Reference, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    study::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchSubject} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchSubject} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:period,:study,:individual,:assignedArm,:_assignedArm,:actualArm,:_actualArm,:consent,)



mutable struct Narrative <: AbstractFHIRType
    _status::Union{Element, Nothing}
    div::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Narrative} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Narrative} = (:id,:extension,:status,:_status,:div,)



mutable struct Library <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    content::Union{Vector{Attachment}, Nothing}
    copyright::Union{String, Nothing}
    dataRequirement::Union{Vector{DataRequirement}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    parameter::Union{Vector{ParameterDefinition}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Library} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Library} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:type,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:parameter,:dataRequirement,:content,)



mutable struct TestScript_Capability <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _destination::Union{Element, Nothing}
    _link::Union{Vector{Element}, Nothing}
    _origin::Union{Vector{Element}, Nothing}
    _required::Union{Element, Nothing}
    _validated::Union{Element, Nothing}
    capabilities::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    destination::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    link::Union{Vector{String}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    origin::Union{Vector{SafeInt32}, Nothing}
    required::Union{Bool, Nothing}
    validated::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Capability} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Capability} = (:id,:extension,:modifierExtension,:required,:_required,:validated,:_validated,:description,:_description,:origin,:_origin,:destination,:_destination,:link,:_link,:capabilities,)



mutable struct SubstanceSpecification_Code <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _statusDate::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{Vector{Reference}, Nothing}
    status::Union{CodeableConcept, Nothing}
    statusDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Code} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Code} = (:id,:extension,:modifierExtension,:code,:status,:statusDate,:_statusDate,:comment,:_comment,:source,)



mutable struct ValueSet_Designation <: AbstractFHIRType
    _language::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    use::Union{Coding, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Designation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Designation} = (:id,:extension,:modifierExtension,:language,:_language,:use,:value,:_value,)



mutable struct StructureMap_Source <: AbstractFHIRType
    _check::Union{Element, Nothing}
    _condition::Union{Element, Nothing}
    _context::Union{Element, Nothing}
    _defaultValueBase64Binary::Union{Element, Nothing}
    _defaultValueBoolean::Union{Element, Nothing}
    _defaultValueCanonical::Union{Element, Nothing}
    _defaultValueCode::Union{Element, Nothing}
    _defaultValueDate::Union{Element, Nothing}
    _defaultValueDateTime::Union{Element, Nothing}
    _defaultValueDecimal::Union{Element, Nothing}
    _defaultValueId::Union{Element, Nothing}
    _defaultValueInstant::Union{Element, Nothing}
    _defaultValueInteger::Union{Element, Nothing}
    _defaultValueMarkdown::Union{Element, Nothing}
    _defaultValueOid::Union{Element, Nothing}
    _defaultValuePositiveInt::Union{Element, Nothing}
    _defaultValueString::Union{Element, Nothing}
    _defaultValueTime::Union{Element, Nothing}
    _defaultValueUnsignedInt::Union{Element, Nothing}
    _defaultValueUri::Union{Element, Nothing}
    _defaultValueUrl::Union{Element, Nothing}
    _defaultValueUuid::Union{Element, Nothing}
    _element::Union{Element, Nothing}
    _listMode::Union{Element, Nothing}
    _logMessage::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _variable::Union{Element, Nothing}
    check::Union{string_fhir, Nothing}
    condition::Union{string_fhir, Nothing}
    context::Union{String, Nothing}
    defaultValueAddress::Union{Address, Nothing}
    defaultValueAge::Union{Age, Nothing}
    defaultValueAnnotation::Union{Annotation, Nothing}
    defaultValueAttachment::Union{Attachment, Nothing}
    defaultValueBase64Binary::Union{string_fhir, Nothing}
    defaultValueBoolean::Union{Bool, Nothing}
    defaultValueCanonical::Union{string_fhir, Nothing}
    defaultValueCode::Union{string_fhir, Nothing}
    defaultValueCodeableConcept::Union{CodeableConcept, Nothing}
    defaultValueCoding::Union{Coding, Nothing}
    defaultValueContactDetail::Union{ContactDetail, Nothing}
    defaultValueContactPoint::Union{ContactPoint, Nothing}
    defaultValueContributor::Union{Contributor, Nothing}
    defaultValueCount::Union{Count, Nothing}
    defaultValueDataRequirement::Union{DataRequirement, Nothing}
    defaultValueDate::Union{string_fhir, Nothing}
    defaultValueDateTime::Union{string_fhir, Nothing}
    defaultValueDecimal::Union{FHIRNumber, Nothing}
    defaultValueDistance::Union{Distance, Nothing}
    defaultValueDosage::Union{Dosage, Nothing}
    defaultValueDuration::Union{Duration, Nothing}
    defaultValueExpression::Union{Expression, Nothing}
    defaultValueHumanName::Union{HumanName, Nothing}
    defaultValueId::Union{string_fhir, Nothing}
    defaultValueIdentifier::Union{Identifier, Nothing}
    defaultValueInstant::Union{string_fhir, Nothing}
    defaultValueInteger::Union{FHIRInt32, Nothing}
    defaultValueMarkdown::Union{string_fhir, Nothing}
    defaultValueMeta::Union{Meta, Nothing}
    defaultValueMoney::Union{Money, Nothing}
    defaultValueOid::Union{string_fhir, Nothing}
    defaultValueParameterDefinition::Union{ParameterDefinition, Nothing}
    defaultValuePeriod::Union{Period, Nothing}
    defaultValuePositiveInt::Union{FHIRInt32, Nothing}
    defaultValueQuantity::Union{Quantity, Nothing}
    defaultValueRange::Union{Range, Nothing}
    defaultValueRatio::Union{Ratio, Nothing}
    defaultValueReference::Union{Reference, Nothing}
    defaultValueRelatedArtifact::Union{RelatedArtifact, Nothing}
    defaultValueSampledData::Union{SampledData, Nothing}
    defaultValueSignature::Union{Signature, Nothing}
    defaultValueString::Union{string_fhir, Nothing}
    defaultValueTime::Union{string_fhir, Nothing}
    defaultValueTiming::Union{Timing, Nothing}
    defaultValueTriggerDefinition::Union{TriggerDefinition, Nothing}
    defaultValueUnsignedInt::Union{FHIRInt32, Nothing}
    defaultValueUri::Union{string_fhir, Nothing}
    defaultValueUrl::Union{string_fhir, Nothing}
    defaultValueUsageContext::Union{UsageContext, Nothing}
    defaultValueUuid::Union{string_fhir, Nothing}
    element::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    listMode::Union{String, Nothing}
    logMessage::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{string_fhir, Nothing}
    variable::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Source} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Source} = (:id,:extension,:modifierExtension,:context,:_context,:min,:_min,:max,:_max,:type,:_type,:defaultValueBase64Binary,:_defaultValueBase64Binary,:defaultValueBoolean,:_defaultValueBoolean,:defaultValueCanonical,:_defaultValueCanonical,:defaultValueCode,:_defaultValueCode,:defaultValueDate,:_defaultValueDate,:defaultValueDateTime,:_defaultValueDateTime,:defaultValueDecimal,:_defaultValueDecimal,:defaultValueId,:_defaultValueId,:defaultValueInstant,:_defaultValueInstant,:defaultValueInteger,:_defaultValueInteger,:defaultValueMarkdown,:_defaultValueMarkdown,:defaultValueOid,:_defaultValueOid,:defaultValuePositiveInt,:_defaultValuePositiveInt,:defaultValueString,:_defaultValueString,:defaultValueTime,:_defaultValueTime,:defaultValueUnsignedInt,:_defaultValueUnsignedInt,:defaultValueUri,:_defaultValueUri,:defaultValueUrl,:_defaultValueUrl,:defaultValueUuid,:_defaultValueUuid,:defaultValueAddress,:defaultValueAge,:defaultValueAnnotation,:defaultValueAttachment,:defaultValueCodeableConcept,:defaultValueCoding,:defaultValueContactPoint,:defaultValueCount,:defaultValueDistance,:defaultValueDuration,:defaultValueHumanName,:defaultValueIdentifier,:defaultValueMoney,:defaultValuePeriod,:defaultValueQuantity,:defaultValueRange,:defaultValueRatio,:defaultValueReference,:defaultValueSampledData,:defaultValueSignature,:defaultValueTiming,:defaultValueContactDetail,:defaultValueContributor,:defaultValueDataRequirement,:defaultValueExpression,:defaultValueParameterDefinition,:defaultValueRelatedArtifact,:defaultValueTriggerDefinition,:defaultValueUsageContext,:defaultValueDosage,:defaultValueMeta,:element,:_element,:listMode,:_listMode,:variable,:_variable,:condition,:_condition,:check,:_check,:logMessage,:_logMessage,)



mutable struct TestScript_Assert <: AbstractFHIRType
    _compareToSourceExpression::Union{Element, Nothing}
    _compareToSourceId::Union{Element, Nothing}
    _compareToSourcePath::Union{Element, Nothing}
    _contentType::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _direction::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _headerField::Union{Element, Nothing}
    _label::Union{Element, Nothing}
    _minimumId::Union{Element, Nothing}
    _navigationLinks::Union{Element, Nothing}
    _operator::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    _requestMethod::Union{Element, Nothing}
    _requestURL::Union{Element, Nothing}
    _resource::Union{Element, Nothing}
    _response::Union{Element, Nothing}
    _responseCode::Union{Element, Nothing}
    _sourceId::Union{Element, Nothing}
    _validateProfileId::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    _warningOnly::Union{Element, Nothing}
    compareToSourceExpression::Union{string_fhir, Nothing}
    compareToSourceId::Union{string_fhir, Nothing}
    compareToSourcePath::Union{string_fhir, Nothing}
    contentType::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    direction::Union{String, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    headerField::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    label::Union{string_fhir, Nothing}
    minimumId::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    navigationLinks::Union{Bool, Nothing}
    operator::Union{String, Nothing}
    path::Union{string_fhir, Nothing}
    requestMethod::Union{String, Nothing}
    requestURL::Union{string_fhir, Nothing}
    resource::Union{String, Nothing}
    response::Union{String, Nothing}
    responseCode::Union{string_fhir, Nothing}
    sourceId::Union{String, Nothing}
    validateProfileId::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
    warningOnly::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Assert} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Assert} = (:id,:extension,:modifierExtension,:label,:_label,:description,:_description,:direction,:_direction,:compareToSourceId,:_compareToSourceId,:compareToSourceExpression,:_compareToSourceExpression,:compareToSourcePath,:_compareToSourcePath,:contentType,:_contentType,:expression,:_expression,:headerField,:_headerField,:minimumId,:_minimumId,:navigationLinks,:_navigationLinks,:operator,:_operator,:path,:_path,:requestMethod,:_requestMethod,:requestURL,:_requestURL,:resource,:_resource,:response,:_response,:responseCode,:_responseCode,:sourceId,:_sourceId,:validateProfileId,:_validateProfileId,:value,:_value,:warningOnly,:_warningOnly,)



mutable struct Group_Member <: AbstractFHIRType
    _inactive::Union{Element, Nothing}
    entity::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    inactive::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Group_Member} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Group_Member} = (:id,:extension,:modifierExtension,:entity,:period,:inactive,:_inactive,)



mutable struct ValueSet_Filter <: AbstractFHIRType
    _op::Union{Element, Nothing}
    _property::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    op::Union{String, Nothing}
    property::Union{String, Nothing}
    value::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Filter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Filter} = (:id,:extension,:modifierExtension,:property,:_property,:op,:_op,:value,:_value,)



mutable struct Composition_RelatesTo <: AbstractFHIRType
    _code::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    targetIdentifier::Union{Identifier, Nothing}
    targetReference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Composition_RelatesTo} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Composition_RelatesTo} = (:id,:extension,:modifierExtension,:code,:_code,:targetIdentifier,:targetReference,)



mutable struct Specimen_Processing <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _timeDateTime::Union{Element, Nothing}
    additive::Union{Vector{Reference}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    procedure::Union{CodeableConcept, Nothing}
    timeDateTime::Union{string_fhir, Nothing}
    timePeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Specimen_Processing} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Specimen_Processing} = (:id,:extension,:modifierExtension,:description,:_description,:procedure,:additive,:timeDateTime,:_timeDateTime,:timePeriod,)



mutable struct MedicinalProductIndication <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    comorbidity::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    diseaseStatus::Union{CodeableConcept, Nothing}
    diseaseSymptomProcedure::Union{CodeableConcept, Nothing}
    duration::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    intendedEffect::Union{CodeableConcept, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    otherTherapy::Union{Vector{MedicinalProductIndication_OtherTherapy}, Nothing}
    population::Union{Vector{Population}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    undesirableEffect::Union{Vector{Reference}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIndication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIndication} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:subject,:diseaseSymptomProcedure,:diseaseStatus,:comorbidity,:intendedEffect,:duration,:otherTherapy,:undesirableEffect,:population,)



mutable struct ResearchDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _comment::Union{Vector{Element}, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _shortTitle::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    comment::Union{Vector{string_fhir}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    exposure::Union{Reference, Nothing}
    exposureAlternative::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    library::Union{Vector{String}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    outcome::Union{Reference, Nothing}
    population::Union{Reference, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    shortTitle::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:shortTitle,:_shortTitle,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:comment,:_comment,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:library,:population,:exposure,:exposureAlternative,:outcome,)



mutable struct OperationDefinition_ReferencedFrom <: AbstractFHIRType
    _source::Union{Element, Nothing}
    _sourceId::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{string_fhir, Nothing}
    sourceId::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationDefinition_ReferencedFrom} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationDefinition_ReferencedFrom} = (:id,:extension,:modifierExtension,:source,:_source,:sourceId,:_sourceId,)



mutable struct MolecularSequence_Outer <: AbstractFHIRType
    _end::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    end::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    start::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Outer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Outer} = (:id,:extension,:modifierExtension,:start,:_start,:end,:_end,)



mutable struct MolecularSequence_Roc <: AbstractFHIRType
    _fMeasure::Union{Vector{Element}, Nothing}
    _numFN::Union{Vector{Element}, Nothing}
    _numFP::Union{Vector{Element}, Nothing}
    _numTP::Union{Vector{Element}, Nothing}
    _precision::Union{Vector{Element}, Nothing}
    _score::Union{Vector{Element}, Nothing}
    _sensitivity::Union{Vector{Element}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fMeasure::Union{Vector{BigFloat}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numFN::Union{Vector{SafeInt32}, Nothing}
    numFP::Union{Vector{SafeInt32}, Nothing}
    numTP::Union{Vector{SafeInt32}, Nothing}
    precision::Union{Vector{BigFloat}, Nothing}
    score::Union{Vector{SafeInt32}, Nothing}
    sensitivity::Union{Vector{BigFloat}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Roc} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Roc} = (:id,:extension,:modifierExtension,:score,:_score,:numTP,:_numTP,:numFP,:_numFP,:numFN,:_numFN,:precision,:_precision,:sensitivity,:_sensitivity,:fMeasure,:_fMeasure,)



mutable struct ResearchElementDefinition_Characteristic <: AbstractFHIRType
    _definitionCanonical::Union{Element, Nothing}
    _exclude::Union{Element, Nothing}
    _participantEffectiveDateTime::Union{Element, Nothing}
    _participantEffectiveDescription::Union{Element, Nothing}
    _participantEffectiveGroupMeasure::Union{Element, Nothing}
    _studyEffectiveDateTime::Union{Element, Nothing}
    _studyEffectiveDescription::Union{Element, Nothing}
    _studyEffectiveGroupMeasure::Union{Element, Nothing}
    definitionCanonical::Union{string_fhir, Nothing}
    definitionCodeableConcept::Union{CodeableConcept, Nothing}
    definitionDataRequirement::Union{DataRequirement, Nothing}
    definitionExpression::Union{Expression, Nothing}
    exclude::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    participantEffectiveDateTime::Union{string_fhir, Nothing}
    participantEffectiveDescription::Union{string_fhir, Nothing}
    participantEffectiveDuration::Union{Duration, Nothing}
    participantEffectiveGroupMeasure::Union{String, Nothing}
    participantEffectivePeriod::Union{Period, Nothing}
    participantEffectiveTimeFromStart::Union{Duration, Nothing}
    participantEffectiveTiming::Union{Timing, Nothing}
    studyEffectiveDateTime::Union{string_fhir, Nothing}
    studyEffectiveDescription::Union{string_fhir, Nothing}
    studyEffectiveDuration::Union{Duration, Nothing}
    studyEffectiveGroupMeasure::Union{String, Nothing}
    studyEffectivePeriod::Union{Period, Nothing}
    studyEffectiveTimeFromStart::Union{Duration, Nothing}
    studyEffectiveTiming::Union{Timing, Nothing}
    unitOfMeasure::Union{CodeableConcept, Nothing}
    usageContext::Union{Vector{UsageContext}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchElementDefinition_Characteristic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchElementDefinition_Characteristic} = (:id,:extension,:modifierExtension,:definitionCodeableConcept,:definitionCanonical,:_definitionCanonical,:definitionExpression,:definitionDataRequirement,:usageContext,:exclude,:_exclude,:unitOfMeasure,:studyEffectiveDescription,:_studyEffectiveDescription,:studyEffectiveDateTime,:_studyEffectiveDateTime,:studyEffectivePeriod,:studyEffectiveDuration,:studyEffectiveTiming,:studyEffectiveTimeFromStart,:studyEffectiveGroupMeasure,:_studyEffectiveGroupMeasure,:participantEffectiveDescription,:_participantEffectiveDescription,:participantEffectiveDateTime,:_participantEffectiveDateTime,:participantEffectivePeriod,:participantEffectiveDuration,:participantEffectiveTiming,:participantEffectiveTimeFromStart,:participantEffectiveGroupMeasure,:_participantEffectiveGroupMeasure,)



mutable struct SupplyDelivery <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    destination::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    patient::Union{Reference, Nothing}
    receiver::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    suppliedItem::Union{SupplyDelivery_SuppliedItem, Nothing}
    supplier::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SupplyDelivery} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SupplyDelivery} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:partOf,:status,:_status,:patient,:type,:suppliedItem,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:supplier,:destination,:receiver,)



mutable struct EnrollmentRequest <: AbstractResource
    _created::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    candidate::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    coverage::Union{Reference, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurer::Union{Reference, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    provider::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EnrollmentRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EnrollmentRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:created,:_created,:insurer,:provider,:candidate,:coverage,)



mutable struct EvidenceVariable_Characteristic <: AbstractFHIRType
    _definitionCanonical::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _exclude::Union{Element, Nothing}
    _groupMeasure::Union{Element, Nothing}
    _participantEffectiveDateTime::Union{Element, Nothing}
    definitionCanonical::Union{string_fhir, Nothing}
    definitionCodeableConcept::Union{CodeableConcept, Nothing}
    definitionDataRequirement::Union{DataRequirement, Nothing}
    definitionExpression::Union{Expression, Nothing}
    definitionReference::Union{Reference, Nothing}
    definitionTriggerDefinition::Union{TriggerDefinition, Nothing}
    description::Union{string_fhir, Nothing}
    exclude::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupMeasure::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    participantEffectiveDateTime::Union{string_fhir, Nothing}
    participantEffectiveDuration::Union{Duration, Nothing}
    participantEffectivePeriod::Union{Period, Nothing}
    participantEffectiveTiming::Union{Timing, Nothing}
    timeFromStart::Union{Duration, Nothing}
    usageContext::Union{Vector{UsageContext}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EvidenceVariable_Characteristic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EvidenceVariable_Characteristic} = (:id,:extension,:modifierExtension,:description,:_description,:definitionReference,:definitionCanonical,:_definitionCanonical,:definitionCodeableConcept,:definitionExpression,:definitionDataRequirement,:definitionTriggerDefinition,:usageContext,:exclude,:_exclude,:participantEffectiveDateTime,:_participantEffectiveDateTime,:participantEffectivePeriod,:participantEffectiveDuration,:participantEffectiveTiming,:timeFromStart,:groupMeasure,:_groupMeasure,)



mutable struct PaymentNotice <: AbstractResource
    _created::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _paymentDate::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    payee::Union{Reference, Nothing}
    payment::Union{Reference, Nothing}
    paymentDate::Union{Date, Nothing}
    paymentStatus::Union{CodeableConcept, Nothing}
    provider::Union{Reference, Nothing}
    recipient::Union{Reference, Nothing}
    request::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    response::Union{Reference, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PaymentNotice} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PaymentNotice} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:request,:response,:created,:_created,:provider,:payment,:paymentDate,:_paymentDate,:payee,:recipient,:amount,:paymentStatus,)



mutable struct TestScript_Link <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Link} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Link} = (:id,:extension,:modifierExtension,:url,:_url,:description,:_description,)



mutable struct OperationOutcome_Issue <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _diagnostics::Union{Element, Nothing}
    _expression::Union{Vector{Element}, Nothing}
    _location::Union{Vector{Element}, Nothing}
    _severity::Union{Element, Nothing}
    code::Union{String, Nothing}
    details::Union{CodeableConcept, Nothing}
    diagnostics::Union{string_fhir, Nothing}
    expression::Union{Vector{string_fhir}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    location::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    severity::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationOutcome_Issue} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationOutcome_Issue} = (:id,:extension,:modifierExtension,:severity,:_severity,:code,:_code,:details,:diagnostics,:_diagnostics,:location,:_location,:expression,:_expression,)



mutable struct Goal_Target <: AbstractFHIRType
    _detailBoolean::Union{Element, Nothing}
    _detailInteger::Union{Element, Nothing}
    _detailString::Union{Element, Nothing}
    _dueDate::Union{Element, Nothing}
    detailBoolean::Union{Bool, Nothing}
    detailCodeableConcept::Union{CodeableConcept, Nothing}
    detailInteger::Union{FHIRInt32, Nothing}
    detailQuantity::Union{Quantity, Nothing}
    detailRange::Union{Range, Nothing}
    detailRatio::Union{Ratio, Nothing}
    detailString::Union{string_fhir, Nothing}
    dueDate::Union{string_fhir, Nothing}
    dueDuration::Union{Duration, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measure::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Goal_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Goal_Target} = (:id,:extension,:modifierExtension,:measure,:detailQuantity,:detailRange,:detailCodeableConcept,:detailString,:_detailString,:detailBoolean,:_detailBoolean,:detailInteger,:_detailInteger,:detailRatio,:dueDate,:_dueDate,:dueDuration,)



mutable struct CodeSystem_Property <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _uri::Union{Element, Nothing}
    code::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
    uri::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem_Property} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem_Property} = (:id,:extension,:modifierExtension,:code,:_code,:uri,:_uri,:description,:_description,:type,:_type,)



mutable struct ExampleScenario_Alternative <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    step::Union{Vector{ExampleScenario_Step}, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Alternative} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Alternative} = (:id,:extension,:modifierExtension,:title,:_title,:description,:_description,:step,)



mutable struct Location_Position <: AbstractFHIRType
    _altitude::Union{Element, Nothing}
    _latitude::Union{Element, Nothing}
    _longitude::Union{Element, Nothing}
    altitude::Union{FHIRNumber, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    latitude::Union{FHIRNumber, Nothing}
    longitude::Union{FHIRNumber, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Location_Position} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Location_Position} = (:id,:extension,:modifierExtension,:longitude,:_longitude,:latitude,:_latitude,:altitude,:_altitude,)



mutable struct Contract_ValuedItem <: AbstractFHIRType
    _effectiveTime::Union{Element, Nothing}
    _factor::Union{Element, Nothing}
    _linkId::Union{Vector{Element}, Nothing}
    _payment::Union{Element, Nothing}
    _paymentDate::Union{Element, Nothing}
    _points::Union{Element, Nothing}
    _securityLabelNumber::Union{Vector{Element}, Nothing}
    effectiveTime::Union{Union{DateTime, ZonedDateTime}, Nothing}
    entityCodeableConcept::Union{CodeableConcept, Nothing}
    entityReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    linkId::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    payment::Union{string_fhir, Nothing}
    paymentDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    points::Union{FHIRNumber, Nothing}
    quantity::Union{Quantity, Nothing}
    recipient::Union{Reference, Nothing}
    responsible::Union{Reference, Nothing}
    securityLabelNumber::Union{Vector{SafeInt32}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_ValuedItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_ValuedItem} = (:id,:extension,:modifierExtension,:entityCodeableConcept,:entityReference,:identifier,:effectiveTime,:_effectiveTime,:quantity,:unitPrice,:factor,:_factor,:points,:_points,:net,:payment,:_payment,:paymentDate,:_paymentDate,:responsible,:recipient,:linkId,:_linkId,:securityLabelNumber,:_securityLabelNumber,)



mutable struct CodeSystem_Property1 <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    code::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueString::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem_Property1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem_Property1} = (:id,:extension,:modifierExtension,:code,:_code,:valueCode,:_valueCode,:valueCoding,:valueString,:_valueString,:valueInteger,:_valueInteger,:valueBoolean,:_valueBoolean,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,)



mutable struct EffectEvidenceSynthesis_Certainty <: AbstractFHIRType
    certaintySubcomponent::Union{Vector{EffectEvidenceSynthesis_CertaintySubcomponent}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    rating::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_Certainty} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_Certainty} = (:id,:extension,:modifierExtension,:rating,:note,:certaintySubcomponent,)



mutable struct SpecimenDefinition_Handling <: AbstractFHIRType
    _instruction::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    instruction::Union{string_fhir, Nothing}
    maxDuration::Union{Duration, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    temperatureQualifier::Union{CodeableConcept, Nothing}
    temperatureRange::Union{Range, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SpecimenDefinition_Handling} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SpecimenDefinition_Handling} = (:id,:extension,:modifierExtension,:temperatureQualifier,:temperatureRange,:maxDuration,:instruction,:_instruction,)



mutable struct CapabilityStatement_Interaction <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _documentation::Union{Element, Nothing}
    code::Union{String, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Interaction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Interaction} = (:id,:extension,:modifierExtension,:code,:_code,:documentation,:_documentation,)



mutable struct ElementDefinition_Example <: AbstractFHIRType
    _label::Union{Element, Nothing}
    _valueBase64Binary::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCanonical::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInstant::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueMarkdown::Union{Element, Nothing}
    _valueOid::Union{Element, Nothing}
    _valuePositiveInt::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUnsignedInt::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    _valueUrl::Union{Element, Nothing}
    _valueUuid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    label::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    valueAddress::Union{Address, Nothing}
    valueAge::Union{Age, Nothing}
    valueAnnotation::Union{Annotation, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCanonical::Union{string_fhir, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueContactDetail::Union{ContactDetail, Nothing}
    valueContactPoint::Union{ContactPoint, Nothing}
    valueContributor::Union{Contributor, Nothing}
    valueCount::Union{Count, Nothing}
    valueDataRequirement::Union{DataRequirement, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueDistance::Union{Distance, Nothing}
    valueDosage::Union{Dosage, Nothing}
    valueDuration::Union{Duration, Nothing}
    valueExpression::Union{Expression, Nothing}
    valueHumanName::Union{HumanName, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueIdentifier::Union{Identifier, Nothing}
    valueInstant::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueMarkdown::Union{string_fhir, Nothing}
    valueMeta::Union{Meta, Nothing}
    valueMoney::Union{Money, Nothing}
    valueOid::Union{string_fhir, Nothing}
    valueParameterDefinition::Union{ParameterDefinition, Nothing}
    valuePeriod::Union{Period, Nothing}
    valuePositiveInt::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueReference::Union{Reference, Nothing}
    valueRelatedArtifact::Union{RelatedArtifact, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueSignature::Union{Signature, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueTiming::Union{Timing, Nothing}
    valueTriggerDefinition::Union{TriggerDefinition, Nothing}
    valueUnsignedInt::Union{FHIRInt32, Nothing}
    valueUri::Union{string_fhir, Nothing}
    valueUrl::Union{string_fhir, Nothing}
    valueUsageContext::Union{UsageContext, Nothing}
    valueUuid::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Example} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Example} = (:id,:extension,:modifierExtension,:label,:_label,:valueBase64Binary,:_valueBase64Binary,:valueBoolean,:_valueBoolean,:valueCanonical,:_valueCanonical,:valueCode,:_valueCode,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,:valueId,:_valueId,:valueInstant,:_valueInstant,:valueInteger,:_valueInteger,:valueMarkdown,:_valueMarkdown,:valueOid,:_valueOid,:valuePositiveInt,:_valuePositiveInt,:valueString,:_valueString,:valueTime,:_valueTime,:valueUnsignedInt,:_valueUnsignedInt,:valueUri,:_valueUri,:valueUrl,:_valueUrl,:valueUuid,:_valueUuid,:valueAddress,:valueAge,:valueAnnotation,:valueAttachment,:valueCodeableConcept,:valueCoding,:valueContactPoint,:valueCount,:valueDistance,:valueDuration,:valueHumanName,:valueIdentifier,:valueMoney,:valuePeriod,:valueQuantity,:valueRange,:valueRatio,:valueReference,:valueSampledData,:valueSignature,:valueTiming,:valueContactDetail,:valueContributor,:valueDataRequirement,:valueExpression,:valueParameterDefinition,:valueRelatedArtifact,:valueTriggerDefinition,:valueUsageContext,:valueDosage,:valueMeta,)



mutable struct RequestGroup_RelatedAction <: AbstractFHIRType
    _actionId::Union{Element, Nothing}
    _relationship::Union{Element, Nothing}
    actionId::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    offsetDuration::Union{Duration, Nothing}
    offsetRange::Union{Range, Nothing}
    relationship::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RequestGroup_RelatedAction} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RequestGroup_RelatedAction} = (:id,:extension,:modifierExtension,:actionId,:_actionId,:relationship,:_relationship,:offsetDuration,:offsetRange,)



mutable struct Patient_Communication <: AbstractFHIRType
    _preferred::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preferred::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Patient_Communication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Patient_Communication} = (:id,:extension,:modifierExtension,:language,:preferred,:_preferred,)



mutable struct VerificationResult_PrimarySource <: AbstractFHIRType
    _validationDate::Union{Element, Nothing}
    canPushUpdates::Union{CodeableConcept, Nothing}
    communicationMethod::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    pushTypeAvailable::Union{Vector{CodeableConcept}, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
    validationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    validationStatus::Union{CodeableConcept, Nothing}
    who::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VerificationResult_PrimarySource} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VerificationResult_PrimarySource} = (:id,:extension,:modifierExtension,:who,:type,:communicationMethod,:validationStatus,:validationDate,:_validationDate,:canPushUpdates,:pushTypeAvailable,)



mutable struct NutritionOrder_Supplement <: AbstractFHIRType
    _instruction::Union{Element, Nothing}
    _productName::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    instruction::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    productName::Union{string_fhir, Nothing}
    quantity::Union{Quantity, Nothing}
    schedule::Union{Vector{Timing}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_Supplement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_Supplement} = (:id,:extension,:modifierExtension,:type,:productName,:_productName,:schedule,:quantity,:instruction,:_instruction,)



mutable struct Medication_Ingredient <: AbstractFHIRType
    _isActive::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    isActive::Union{Bool, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{Ratio, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Medication_Ingredient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Medication_Ingredient} = (:id,:extension,:modifierExtension,:itemCodeableConcept,:itemReference,:isActive,:_isActive,:strength,)



mutable struct Group_Characteristic <: AbstractFHIRType
    _exclude::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    exclude::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueReference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Group_Characteristic} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Group_Characteristic} = (:id,:extension,:modifierExtension,:code,:valueCodeableConcept,:valueBoolean,:_valueBoolean,:valueQuantity,:valueRange,:valueReference,:exclude,:_exclude,:period,)



mutable struct PractitionerRole_AvailableTime <: AbstractFHIRType
    _allDay::Union{Element, Nothing}
    _availableEndTime::Union{Element, Nothing}
    _availableStartTime::Union{Element, Nothing}
    _daysOfWeek::Union{Vector{Element}, Nothing}
    allDay::Union{Bool, Nothing}
    availableEndTime::Union{Time, Nothing}
    availableStartTime::Union{Time, Nothing}
    daysOfWeek::Union{Vector{String}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PractitionerRole_AvailableTime} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PractitionerRole_AvailableTime} = (:id,:extension,:modifierExtension,:daysOfWeek,:_daysOfWeek,:allDay,:_allDay,:availableStartTime,:_availableStartTime,:availableEndTime,:_availableEndTime,)



mutable struct CoverageEligibilityRequest_Item <: AbstractFHIRType
    _supportingInfoSequence::Union{Vector{Element}, Nothing}
    category::Union{CodeableConcept, Nothing}
    detail::Union{Vector{Reference}, Nothing}
    diagnosis::Union{Vector{CoverageEligibilityRequest_Diagnosis}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    facility::Union{Reference, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    provider::Union{Reference, Nothing}
    quantity::Union{Quantity, Nothing}
    supportingInfoSequence::Union{Vector{SafeInt32}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityRequest_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityRequest_Item} = (:id,:extension,:modifierExtension,:supportingInfoSequence,:_supportingInfoSequence,:category,:productOrService,:modifier,:provider,:quantity,:unitPrice,:facility,:diagnosis,:detail,)



mutable struct MolecularSequence_Variant <: AbstractFHIRType
    _cigar::Union{Element, Nothing}
    _end::Union{Element, Nothing}
    _observedAllele::Union{Element, Nothing}
    _referenceAllele::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    cigar::Union{string_fhir, Nothing}
    end::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    observedAllele::Union{string_fhir, Nothing}
    referenceAllele::Union{string_fhir, Nothing}
    start::Union{SafeInt32, Nothing}
    variantPointer::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Variant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Variant} = (:id,:extension,:modifierExtension,:start,:_start,:end,:_end,:observedAllele,:_observedAllele,:referenceAllele,:_referenceAllele,:cigar,:_cigar,:variantPointer,)



mutable struct SubstancePolymer_StructuralRepresentation <: AbstractFHIRType
    _representation::Union{Element, Nothing}
    attachment::Union{Attachment, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    representation::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_StructuralRepresentation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_StructuralRepresentation} = (:id,:extension,:modifierExtension,:type,:representation,:_representation,:attachment,)



mutable struct CapabilityStatement_Security <: AbstractFHIRType
    _cors::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    cors::Union{Bool, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    service::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Security} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Security} = (:id,:extension,:modifierExtension,:cors,:_cors,:service,:description,:_description,)



mutable struct MessageDefinition_AllowedResponse <: AbstractFHIRType
    _situation::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    message::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    situation::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageDefinition_AllowedResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageDefinition_AllowedResponse} = (:id,:extension,:modifierExtension,:message,:situation,:_situation,)



mutable struct ChargeItem <: AbstractResource
    _definitionUri::Union{Vector{Element}, Nothing}
    _enteredDate::Union{Element, Nothing}
    _factorOverride::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _overrideReason::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    account::Union{Vector{Reference}, Nothing}
    bodysite::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    context::Union{Reference, Nothing}
    costCenter::Union{Reference, Nothing}
    definitionCanonical::Union{Vector{String}, Nothing}
    definitionUri::Union{Vector{String}, Nothing}
    enteredDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    enterer::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factorOverride::Union{FHIRNumber, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    overrideReason::Union{string_fhir, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performer::Union{Vector{ChargeItem_Performer}, Nothing}
    performingOrganization::Union{Reference, Nothing}
    priceOverride::Union{Money, Nothing}
    productCodeableConcept::Union{CodeableConcept, Nothing}
    productReference::Union{Reference, Nothing}
    quantity::Union{Quantity, Nothing}
    reason::Union{Vector{CodeableConcept}, Nothing}
    requestingOrganization::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    service::Union{Vector{Reference}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    supportingInformation::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItem} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:definitionUri,:_definitionUri,:definitionCanonical,:status,:_status,:partOf,:code,:subject,:context,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:performer,:performingOrganization,:requestingOrganization,:costCenter,:quantity,:bodysite,:factorOverride,:_factorOverride,:priceOverride,:overrideReason,:_overrideReason,:enterer,:enteredDate,:_enteredDate,:reason,:service,:productReference,:productCodeableConcept,:account,:note,:supportingInformation,)



mutable struct Parameters_Parameter <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _valueBase64Binary::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueCanonical::Union{Element, Nothing}
    _valueCode::Union{Element, Nothing}
    _valueDate::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueDecimal::Union{Element, Nothing}
    _valueId::Union{Element, Nothing}
    _valueInstant::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueMarkdown::Union{Element, Nothing}
    _valueOid::Union{Element, Nothing}
    _valuePositiveInt::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    _valueUnsignedInt::Union{Element, Nothing}
    _valueUri::Union{Element, Nothing}
    _valueUrl::Union{Element, Nothing}
    _valueUuid::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    part::Union{Vector{Parameters_Parameter}, Nothing}
    resource::Union{ResourceList, Nothing}
    valueAddress::Union{Address, Nothing}
    valueAge::Union{Age, Nothing}
    valueAnnotation::Union{Annotation, Nothing}
    valueAttachment::Union{Attachment, Nothing}
    valueBase64Binary::Union{string_fhir, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCanonical::Union{string_fhir, Nothing}
    valueCode::Union{string_fhir, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueCoding::Union{Coding, Nothing}
    valueContactDetail::Union{ContactDetail, Nothing}
    valueContactPoint::Union{ContactPoint, Nothing}
    valueContributor::Union{Contributor, Nothing}
    valueCount::Union{Count, Nothing}
    valueDataRequirement::Union{DataRequirement, Nothing}
    valueDate::Union{string_fhir, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueDecimal::Union{FHIRNumber, Nothing}
    valueDistance::Union{Distance, Nothing}
    valueDosage::Union{Dosage, Nothing}
    valueDuration::Union{Duration, Nothing}
    valueExpression::Union{Expression, Nothing}
    valueHumanName::Union{HumanName, Nothing}
    valueId::Union{string_fhir, Nothing}
    valueIdentifier::Union{Identifier, Nothing}
    valueInstant::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valueMarkdown::Union{string_fhir, Nothing}
    valueMeta::Union{Meta, Nothing}
    valueMoney::Union{Money, Nothing}
    valueOid::Union{string_fhir, Nothing}
    valueParameterDefinition::Union{ParameterDefinition, Nothing}
    valuePeriod::Union{Period, Nothing}
    valuePositiveInt::Union{FHIRInt32, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueReference::Union{Reference, Nothing}
    valueRelatedArtifact::Union{RelatedArtifact, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueSignature::Union{Signature, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
    valueTiming::Union{Timing, Nothing}
    valueTriggerDefinition::Union{TriggerDefinition, Nothing}
    valueUnsignedInt::Union{FHIRInt32, Nothing}
    valueUri::Union{string_fhir, Nothing}
    valueUrl::Union{string_fhir, Nothing}
    valueUsageContext::Union{UsageContext, Nothing}
    valueUuid::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Parameters_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Parameters_Parameter} = (:id,:extension,:modifierExtension,:name,:_name,:valueBase64Binary,:_valueBase64Binary,:valueBoolean,:_valueBoolean,:valueCanonical,:_valueCanonical,:valueCode,:_valueCode,:valueDate,:_valueDate,:valueDateTime,:_valueDateTime,:valueDecimal,:_valueDecimal,:valueId,:_valueId,:valueInstant,:_valueInstant,:valueInteger,:_valueInteger,:valueMarkdown,:_valueMarkdown,:valueOid,:_valueOid,:valuePositiveInt,:_valuePositiveInt,:valueString,:_valueString,:valueTime,:_valueTime,:valueUnsignedInt,:_valueUnsignedInt,:valueUri,:_valueUri,:valueUrl,:_valueUrl,:valueUuid,:_valueUuid,:valueAddress,:valueAge,:valueAnnotation,:valueAttachment,:valueCodeableConcept,:valueCoding,:valueContactPoint,:valueCount,:valueDistance,:valueDuration,:valueHumanName,:valueIdentifier,:valueMoney,:valuePeriod,:valueQuantity,:valueRange,:valueRatio,:valueReference,:valueSampledData,:valueSignature,:valueTiming,:valueContactDetail,:valueContributor,:valueDataRequirement,:valueExpression,:valueParameterDefinition,:valueRelatedArtifact,:valueTriggerDefinition,:valueUsageContext,:valueDosage,:valueMeta,:resource,:part,)



mutable struct ChargeItemDefinition_PriceComponent <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    amount::Union{Money, Nothing}
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItemDefinition_PriceComponent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItemDefinition_PriceComponent} = (:id,:extension,:modifierExtension,:type,:_type,:code,:factor,:_factor,:amount,)



mutable struct SubstanceSpecification_Property <: AbstractFHIRType
    _amountString::Union{Element, Nothing}
    _parameters::Union{Element, Nothing}
    amountQuantity::Union{Quantity, Nothing}
    amountString::Union{string_fhir, Nothing}
    category::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    definingSubstanceCodeableConcept::Union{CodeableConcept, Nothing}
    definingSubstanceReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    parameters::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Property} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Property} = (:id,:extension,:modifierExtension,:category,:code,:parameters,:_parameters,:definingSubstanceReference,:definingSubstanceCodeableConcept,:amountQuantity,:amountString,:_amountString,)



mutable struct ExplanationOfBenefit_ProcessNote <: AbstractFHIRType
    _number::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    number::Union{SafeInt32, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_ProcessNote} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_ProcessNote} = (:id,:extension,:modifierExtension,:number,:_number,:type,:_type,:text,:_text,:language,)



mutable struct ImplementationGuide_Page1 <: AbstractFHIRType
    _anchor::Union{Vector{Element}, Nothing}
    _name::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    anchor::Union{Vector{string_fhir}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Page1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Page1} = (:id,:extension,:modifierExtension,:name,:_name,:title,:_title,:anchor,:_anchor,)



mutable struct TerminologyCapabilities_ValidateCode <: AbstractFHIRType
    _translations::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    translations::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_ValidateCode} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_ValidateCode} = (:id,:extension,:modifierExtension,:translations,:_translations,)



mutable struct ExplanationOfBenefit_Diagnosis <: AbstractFHIRType
    _sequence::Union{Element, Nothing}
    diagnosisCodeableConcept::Union{CodeableConcept, Nothing}
    diagnosisReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    onAdmission::Union{CodeableConcept, Nothing}
    packageCode::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Diagnosis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Diagnosis} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:diagnosisCodeableConcept,:diagnosisReference,:type,:onAdmission,:packageCode,)



mutable struct MessageHeader_Source <: AbstractFHIRType
    _endpoint::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _software::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{ContactPoint, Nothing}
    endpoint::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    software::Union{string_fhir, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageHeader_Source} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageHeader_Source} = (:id,:extension,:modifierExtension,:name,:_name,:software,:_software,:version,:_version,:contact,:endpoint,:_endpoint,)



mutable struct ServiceRequest <: AbstractResource
    _asNeededBoolean::Union{Element, Nothing}
    _authoredOn::Union{Element, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _patientInstruction::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    asNeededBoolean::Union{Bool, Nothing}
    asNeededCodeableConcept::Union{CodeableConcept, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    bodySite::Union{Vector{CodeableConcept}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    doNotPerform::Union{Bool, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    insurance::Union{Vector{Reference}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    locationCode::Union{Vector{CodeableConcept}, Nothing}
    locationReference::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    orderDetail::Union{Vector{CodeableConcept}, Nothing}
    patientInstruction::Union{string_fhir, Nothing}
    performer::Union{Vector{Reference}, Nothing}
    performerType::Union{CodeableConcept, Nothing}
    priority::Union{String, Nothing}
    quantityQuantity::Union{Quantity, Nothing}
    quantityRange::Union{Range, Nothing}
    quantityRatio::Union{Ratio, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    relevantHistory::Union{Vector{Reference}, Nothing}
    replaces::Union{Vector{Reference}, Nothing}
    requester::Union{Reference, Nothing}
    requisition::Union{Identifier, Nothing}
    resourceType::Union{String, Nothing}
    specimen::Union{Vector{Reference}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    supportingInfo::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ServiceRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ServiceRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:replaces,:requisition,:status,:_status,:intent,:_intent,:category,:priority,:_priority,:doNotPerform,:_doNotPerform,:code,:orderDetail,:quantityQuantity,:quantityRatio,:quantityRange,:subject,:encounter,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:asNeededBoolean,:_asNeededBoolean,:asNeededCodeableConcept,:authoredOn,:_authoredOn,:requester,:performerType,:performer,:locationCode,:locationReference,:reasonCode,:reasonReference,:insurance,:supportingInfo,:specimen,:bodySite,:note,:patientInstruction,:_patientInstruction,:relevantHistory,)



mutable struct BodyStructure <: AbstractResource
    _active::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    image::Union{Vector{Attachment}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{CodeableConcept, Nothing}
    locationQualifier::Union{Vector{CodeableConcept}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    morphology::Union{CodeableConcept, Nothing}
    patient::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BodyStructure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BodyStructure} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:morphology,:location,:locationQualifier,:description,:_description,:image,:patient,)



mutable struct DeviceMetric_Calibration <: AbstractFHIRType
    _state::Union{Element, Nothing}
    _time::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    state::Union{String, Nothing}
    time::Union{Union{DateTime, ZonedDateTime}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceMetric_Calibration} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceMetric_Calibration} = (:id,:extension,:modifierExtension,:type,:_type,:state,:_state,:time,:_time,)



mutable struct Device_Specialization <: AbstractFHIRType
    _version::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    systemType::Union{CodeableConcept, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device_Specialization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device_Specialization} = (:id,:extension,:modifierExtension,:systemType,:version,:_version,)



mutable struct Encounter_StatusHistory <: AbstractFHIRType
    _status::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    status::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter_StatusHistory} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter_StatusHistory} = (:id,:extension,:modifierExtension,:status,:_status,:period,)



mutable struct DeviceUseStatement <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _recordedOn::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _timingDateTime::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    derivedFrom::Union{Vector{Reference}, Nothing}
    device::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    recordedOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{Reference, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    timingDateTime::Union{string_fhir, Nothing}
    timingPeriod::Union{Period, Nothing}
    timingTiming::Union{Timing, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceUseStatement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceUseStatement} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:status,:_status,:subject,:derivedFrom,:timingTiming,:timingPeriod,:timingDateTime,:_timingDateTime,:recordedOn,:_recordedOn,:source,:device,:reasonCode,:reasonReference,:bodySite,:note,)



mutable struct ChargeItemDefinition_Applicability <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    language::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItemDefinition_Applicability} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItemDefinition_Applicability} = (:id,:extension,:modifierExtension,:description,:_description,:language,:_language,:expression,:_expression,)



mutable struct Contract_SecurityLabel <: AbstractFHIRType
    _number::Union{Vector{Element}, Nothing}
    category::Union{Vector{Coding}, Nothing}
    classification::Union{Coding, Nothing}
    control::Union{Vector{Coding}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    number::Union{Vector{SafeInt32}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_SecurityLabel} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_SecurityLabel} = (:id,:extension,:modifierExtension,:number,:_number,:classification,:category,:control,)



mutable struct NutritionOrder_EnteralFormula <: AbstractFHIRType
    _additiveProductName::Union{Element, Nothing}
    _administrationInstruction::Union{Element, Nothing}
    _baseFormulaProductName::Union{Element, Nothing}
    additiveProductName::Union{string_fhir, Nothing}
    additiveType::Union{CodeableConcept, Nothing}
    administration::Union{Vector{NutritionOrder_Administration}, Nothing}
    administrationInstruction::Union{string_fhir, Nothing}
    baseFormulaProductName::Union{string_fhir, Nothing}
    baseFormulaType::Union{CodeableConcept, Nothing}
    caloricDensity::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    maxVolumeToDeliver::Union{Quantity, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    routeofAdministration::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder_EnteralFormula} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder_EnteralFormula} = (:id,:extension,:modifierExtension,:baseFormulaType,:baseFormulaProductName,:_baseFormulaProductName,:additiveType,:additiveProductName,:_additiveProductName,:caloricDensity,:routeofAdministration,:administration,:maxVolumeToDeliver,:administrationInstruction,:_administrationInstruction,)



mutable struct ImplementationGuide_Resource <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _exampleBoolean::Union{Element, Nothing}
    _exampleCanonical::Union{Element, Nothing}
    _fhirVersion::Union{Vector{Element}, Nothing}
    _groupingId::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    exampleBoolean::Union{Bool, Nothing}
    exampleCanonical::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fhirVersion::Union{Vector{String}, Nothing}
    groupingId::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    reference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Resource} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Resource} = (:id,:extension,:modifierExtension,:reference,:fhirVersion,:_fhirVersion,:name,:_name,:description,:_description,:exampleBoolean,:_exampleBoolean,:exampleCanonical,:_exampleCanonical,:groupingId,:_groupingId,)



mutable struct ElementDefinition_Mapping <: AbstractFHIRType
    _comment::Union{Element, Nothing}
    _identity::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _map::Union{Element, Nothing}
    comment::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identity::Union{String, Nothing}
    language::Union{String, Nothing}
    map::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Mapping} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Mapping} = (:id,:extension,:modifierExtension,:identity,:_identity,:language,:_language,:map,:_map,:comment,:_comment,)



mutable struct Composition_Attester <: AbstractFHIRType
    _mode::Union{Element, Nothing}
    _time::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    party::Union{Reference, Nothing}
    time::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Composition_Attester} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Composition_Attester} = (:id,:extension,:modifierExtension,:mode,:_mode,:time,:_time,:party,)



mutable struct MedicationAdministration_Dosage <: AbstractFHIRType
    _text::Union{Element, Nothing}
    dose::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    rateQuantity::Union{Quantity, Nothing}
    rateRatio::Union{Ratio, Nothing}
    route::Union{CodeableConcept, Nothing}
    site::Union{CodeableConcept, Nothing}
    text::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationAdministration_Dosage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationAdministration_Dosage} = (:id,:extension,:modifierExtension,:text,:_text,:site,:route,:method,:dose,:rateRatio,:rateQuantity,)



mutable struct Practitioner <: AbstractResource
    _active::Union{Element, Nothing}
    _birthDate::Union{Element, Nothing}
    _gender::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    address::Union{Vector{Address}, Nothing}
    birthDate::Union{Date, Nothing}
    communication::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{Vector{HumanName}, Nothing}
    photo::Union{Vector{Attachment}, Nothing}
    qualification::Union{Vector{Practitioner_Qualification}, Nothing}
    resourceType::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Practitioner} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Practitioner} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:name,:telecom,:address,:gender,:_gender,:birthDate,:_birthDate,:photo,:qualification,:communication,)



mutable struct Bundle_Link <: AbstractFHIRType
    _relation::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    relation::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle_Link} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle_Link} = (:id,:extension,:modifierExtension,:relation,:_relation,:url,:_url,)



mutable struct VerificationResult_Validator <: AbstractFHIRType
    _identityCertificate::Union{Element, Nothing}
    attestationSignature::Union{Signature, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identityCertificate::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organization::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VerificationResult_Validator} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VerificationResult_Validator} = (:id,:extension,:modifierExtension,:organization,:identityCertificate,:_identityCertificate,:attestationSignature,)



mutable struct SubstanceNucleicAcid_Sugar <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _residueSite::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    residueSite::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceNucleicAcid_Sugar} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceNucleicAcid_Sugar} = (:id,:extension,:modifierExtension,:identifier,:name,:_name,:residueSite,:_residueSite,)



mutable struct ActivityDefinition_DynamicValue <: AbstractFHIRType
    _path::Union{Element, Nothing}
    expression::Union{Expression, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ActivityDefinition_DynamicValue} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ActivityDefinition_DynamicValue} = (:id,:extension,:modifierExtension,:path,:_path,:expression,)



mutable struct TerminologyCapabilities_Parameter <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Parameter} = (:id,:extension,:modifierExtension,:name,:_name,:documentation,:_documentation,)



mutable struct Claim_Insurance <: AbstractFHIRType
    _businessArrangement::Union{Element, Nothing}
    _focal::Union{Element, Nothing}
    _preAuthRef::Union{Vector{Element}, Nothing}
    _sequence::Union{Element, Nothing}
    businessArrangement::Union{string_fhir, Nothing}
    claimResponse::Union{Reference, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focal::Union{Bool, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preAuthRef::Union{Vector{string_fhir}, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Insurance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Insurance} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:focal,:_focal,:identifier,:coverage,:businessArrangement,:_businessArrangement,:preAuthRef,:_preAuthRef,:claimResponse,)



mutable struct Claim_Accident <: AbstractFHIRType
    _date::Union{Element, Nothing}
    date::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    locationAddress::Union{Address, Nothing}
    locationReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Accident} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Accident} = (:id,:extension,:modifierExtension,:date,:_date,:type,:locationAddress,:locationReference,)



mutable struct SubstanceSpecification_Official <: AbstractFHIRType
    _date::Union{Element, Nothing}
    authority::Union{CodeableConcept, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    status::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Official} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Official} = (:id,:extension,:modifierExtension,:authority,:status,:date,:_date,)



mutable struct MedicinalProductIngredient_Strength <: AbstractFHIRType
    _measurementPoint::Union{Element, Nothing}
    concentration::Union{Ratio, Nothing}
    concentrationLowLimit::Union{Ratio, Nothing}
    country::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measurementPoint::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    presentation::Union{Ratio, Nothing}
    presentationLowLimit::Union{Ratio, Nothing}
    referenceStrength::Union{Vector{MedicinalProductIngredient_ReferenceStrength}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIngredient_Strength} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIngredient_Strength} = (:id,:extension,:modifierExtension,:presentation,:presentationLowLimit,:concentration,:concentrationLowLimit,:measurementPoint,:_measurementPoint,:country,:referenceStrength,)



mutable struct Person <: AbstractResource
    _active::Union{Element, Nothing}
    _birthDate::Union{Element, Nothing}
    _gender::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    address::Union{Vector{Address}, Nothing}
    birthDate::Union{Date, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    link::Union{Vector{Person_Link}, Nothing}
    managingOrganization::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{Vector{HumanName}, Nothing}
    photo::Union{Attachment, Nothing}
    resourceType::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Person} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Person} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:name,:telecom,:gender,:_gender,:birthDate,:_birthDate,:address,:photo,:managingOrganization,:active,:_active,:link,)



mutable struct Group <: AbstractResource
    _active::Union{Element, Nothing}
    _actual::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _quantity::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    actual::Union{Bool, Nothing}
    characteristic::Union{Vector{Group_Characteristic}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    managingEntity::Union{Reference, Nothing}
    member::Union{Vector{Group_Member}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    quantity::Union{SafeInt32, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Group} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Group} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:type,:_type,:actual,:_actual,:code,:name,:_name,:quantity,:_quantity,:managingEntity,:characteristic,:member,)



mutable struct ExplanationOfBenefit_BenefitBalance <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _excluded::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    description::Union{string_fhir, Nothing}
    excluded::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    financial::Union{Vector{ExplanationOfBenefit_Financial}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    network::Union{CodeableConcept, Nothing}
    term::Union{CodeableConcept, Nothing}
    unit::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_BenefitBalance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_BenefitBalance} = (:id,:extension,:modifierExtension,:category,:excluded,:_excluded,:name,:_name,:description,:_description,:network,:unit,:term,:financial,)



mutable struct PaymentReconciliation <: AbstractResource
    _created::Union{Element, Nothing}
    _disposition::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _paymentDate::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    detail::Union{Vector{PaymentReconciliation_Detail}, Nothing}
    disposition::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    formCode::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{String, Nothing}
    paymentAmount::Union{Money, Nothing}
    paymentDate::Union{Date, Nothing}
    paymentIdentifier::Union{Identifier, Nothing}
    paymentIssuer::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    processNote::Union{Vector{PaymentReconciliation_ProcessNote}, Nothing}
    request::Union{Reference, Nothing}
    requestor::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PaymentReconciliation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PaymentReconciliation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:period,:created,:_created,:paymentIssuer,:request,:requestor,:outcome,:_outcome,:disposition,:_disposition,:paymentDate,:_paymentDate,:paymentAmount,:paymentIdentifier,:detail,:formCode,:processNote,)



mutable struct MolecularSequence_Quality <: AbstractFHIRType
    _end::Union{Element, Nothing}
    _fScore::Union{Element, Nothing}
    _gtFP::Union{Element, Nothing}
    _precision::Union{Element, Nothing}
    _queryFP::Union{Element, Nothing}
    _queryTP::Union{Element, Nothing}
    _recall::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    _truthFN::Union{Element, Nothing}
    _truthTP::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    end::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fScore::Union{FHIRNumber, Nothing}
    gtFP::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    precision::Union{FHIRNumber, Nothing}
    queryFP::Union{FHIRNumber, Nothing}
    queryTP::Union{FHIRNumber, Nothing}
    recall::Union{FHIRNumber, Nothing}
    roc::Union{MolecularSequence_Roc, Nothing}
    score::Union{Quantity, Nothing}
    standardSequence::Union{CodeableConcept, Nothing}
    start::Union{SafeInt32, Nothing}
    truthFN::Union{FHIRNumber, Nothing}
    truthTP::Union{FHIRNumber, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_Quality} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_Quality} = (:id,:extension,:modifierExtension,:type,:_type,:standardSequence,:start,:_start,:end,:_end,:score,:method,:truthTP,:_truthTP,:queryTP,:_queryTP,:truthFN,:_truthFN,:queryFP,:_queryFP,:gtFP,:_gtFP,:precision,:_precision,:recall,:_recall,:fScore,:_fScore,:roc,)



mutable struct Parameters <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    parameter::Union{Vector{Parameters_Parameter}, Nothing}
    resourceType::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Parameters} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Parameters} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:parameter,)



mutable struct QuestionnaireResponse_Item <: AbstractFHIRType
    _definition::Union{Element, Nothing}
    _linkId::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    answer::Union{Vector{QuestionnaireResponse_Answer}, Nothing}
    definition::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    item::Union{Vector{QuestionnaireResponse_Item}, Nothing}
    linkId::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    text::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: QuestionnaireResponse_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: QuestionnaireResponse_Item} = (:id,:extension,:modifierExtension,:linkId,:_linkId,:definition,:_definition,:text,:_text,:answer,:item,)



mutable struct RelatedPerson <: AbstractResource
    _active::Union{Element, Nothing}
    _birthDate::Union{Element, Nothing}
    _gender::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    address::Union{Vector{Address}, Nothing}
    birthDate::Union{Date, Nothing}
    communication::Union{Vector{RelatedPerson_Communication}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{Vector{HumanName}, Nothing}
    patient::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    photo::Union{Vector{Attachment}, Nothing}
    relationship::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RelatedPerson} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RelatedPerson} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:patient,:relationship,:name,:telecom,:gender,:_gender,:birthDate,:_birthDate,:address,:photo,:period,:communication,)



mutable struct MedicationAdministration <: AbstractResource
    _effectiveDateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiates::Union{Vector{Element}, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    context::Union{Reference, Nothing}
    device::Union{Vector{Reference}, Nothing}
    dosage::Union{MedicationAdministration_Dosage, Nothing}
    effectiveDateTime::Union{string_fhir, Nothing}
    effectivePeriod::Union{Period, Nothing}
    eventHistory::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiates::Union{Vector{String}, Nothing}
    language::Union{String, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performer::Union{Vector{MedicationAdministration_Performer}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    request::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{Vector{CodeableConcept}, Nothing}
    subject::Union{Reference, Nothing}
    supportingInformation::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationAdministration} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationAdministration} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiates,:_instantiates,:partOf,:status,:_status,:statusReason,:category,:medicationCodeableConcept,:medicationReference,:subject,:context,:supportingInformation,:effectiveDateTime,:_effectiveDateTime,:effectivePeriod,:performer,:reasonCode,:reasonReference,:request,:device,:note,:dosage,:eventHistory,)



mutable struct SubstanceReferenceInformation <: AbstractResource
    _comment::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    classification::Union{Vector{SubstanceReferenceInformation_Classification}, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gene::Union{Vector{SubstanceReferenceInformation_Gene}, Nothing}
    geneElement::Union{Vector{SubstanceReferenceInformation_GeneElement}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    target::Union{Vector{SubstanceReferenceInformation_Target}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceReferenceInformation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceReferenceInformation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:comment,:_comment,:gene,:geneElement,:classification,:target,)



mutable struct SubstancePolymer_StartingMaterial <: AbstractFHIRType
    _isDefining::Union{Element, Nothing}
    amount::Union{SubstanceAmount, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    isDefining::Union{Bool, Nothing}
    material::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_StartingMaterial} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_StartingMaterial} = (:id,:extension,:modifierExtension,:material,:type,:isDefining,:_isDefining,:amount,)



mutable struct ClinicalImpression <: AbstractResource
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _effectiveDateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _protocol::Union{Vector{Element}, Nothing}
    _status::Union{Element, Nothing}
    _summary::Union{Element, Nothing}
    assessor::Union{Reference, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    effectiveDateTime::Union{string_fhir, Nothing}
    effectivePeriod::Union{Period, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    finding::Union{Vector{ClinicalImpression_Finding}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    investigation::Union{Vector{ClinicalImpression_Investigation}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    previous::Union{Reference, Nothing}
    problem::Union{Vector{Reference}, Nothing}
    prognosisCodeableConcept::Union{Vector{CodeableConcept}, Nothing}
    prognosisReference::Union{Vector{Reference}, Nothing}
    protocol::Union{Vector{String}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subject::Union{Reference, Nothing}
    summary::Union{string_fhir, Nothing}
    supportingInfo::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClinicalImpression} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClinicalImpression} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:statusReason,:code,:description,:_description,:subject,:encounter,:effectiveDateTime,:_effectiveDateTime,:effectivePeriod,:date,:_date,:assessor,:previous,:problem,:investigation,:protocol,:_protocol,:summary,:_summary,:finding,:prognosisCodeableConcept,:prognosisReference,:supportingInfo,:note,)



mutable struct Appointment <: AbstractResource
    _comment::Union{Element, Nothing}
    _created::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _end::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _minutesDuration::Union{Element, Nothing}
    _patientInstruction::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    appointmentType::Union{CodeableConcept, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    cancelationReason::Union{CodeableConcept, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    end::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    minutesDuration::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    participant::Union{Vector{Appointment_Participant}, Nothing}
    patientInstruction::Union{string_fhir, Nothing}
    priority::Union{SafeInt32, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    requestedPeriod::Union{Vector{Period}, Nothing}
    resourceType::Union{String, Nothing}
    serviceCategory::Union{Vector{CodeableConcept}, Nothing}
    serviceType::Union{Vector{CodeableConcept}, Nothing}
    slot::Union{Vector{Reference}, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    start::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{String, Nothing}
    supportingInformation::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Appointment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Appointment} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:cancelationReason,:serviceCategory,:serviceType,:specialty,:appointmentType,:reasonCode,:reasonReference,:priority,:_priority,:description,:_description,:supportingInformation,:start,:_start,:end,:_end,:minutesDuration,:_minutesDuration,:slot,:created,:_created,:comment,:_comment,:patientInstruction,:_patientInstruction,:basedOn,:participant,:requestedPeriod,)



mutable struct CatalogEntry <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastUpdated::Union{Element, Nothing}
    _orderable::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _validTo::Union{Element, Nothing}
    additionalCharacteristic::Union{Vector{CodeableConcept}, Nothing}
    additionalClassification::Union{Vector{CodeableConcept}, Nothing}
    additionalIdentifier::Union{Vector{Identifier}, Nothing}
    classification::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    lastUpdated::Union{Union{DateTime, ZonedDateTime}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    orderable::Union{Bool, Nothing}
    referencedItem::Union{Reference, Nothing}
    relatedEntry::Union{Vector{CatalogEntry_RelatedEntry}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    validTo::Union{Union{DateTime, ZonedDateTime}, Nothing}
    validityPeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CatalogEntry} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CatalogEntry} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:type,:orderable,:_orderable,:referencedItem,:additionalIdentifier,:classification,:status,:_status,:validityPeriod,:validTo,:_validTo,:lastUpdated,:_lastUpdated,:additionalCharacteristic,:additionalClassification,:relatedEntry,)



mutable struct TestReport_Action1 <: AbstractFHIRType
    assert::Union{TestReport_Assert, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestReport_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Action1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Action1} = (:id,:extension,:modifierExtension,:operation,:assert,)



mutable struct VisionPrescription_LensSpecification <: AbstractFHIRType
    _add::Union{Element, Nothing}
    _axis::Union{Element, Nothing}
    _backCurve::Union{Element, Nothing}
    _brand::Union{Element, Nothing}
    _color::Union{Element, Nothing}
    _cylinder::Union{Element, Nothing}
    _diameter::Union{Element, Nothing}
    _eye::Union{Element, Nothing}
    _power::Union{Element, Nothing}
    _sphere::Union{Element, Nothing}
    add::Union{FHIRNumber, Nothing}
    axis::Union{SafeInt32, Nothing}
    backCurve::Union{FHIRNumber, Nothing}
    brand::Union{string_fhir, Nothing}
    color::Union{string_fhir, Nothing}
    cylinder::Union{FHIRNumber, Nothing}
    diameter::Union{FHIRNumber, Nothing}
    duration::Union{Quantity, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    eye::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    power::Union{FHIRNumber, Nothing}
    prism::Union{Vector{VisionPrescription_Prism}, Nothing}
    product::Union{CodeableConcept, Nothing}
    sphere::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VisionPrescription_LensSpecification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VisionPrescription_LensSpecification} = (:id,:extension,:modifierExtension,:product,:eye,:_eye,:sphere,:_sphere,:cylinder,:_cylinder,:axis,:_axis,:prism,:add,:_add,:power,:_power,:backCurve,:_backCurve,:diameter,:_diameter,:duration,:color,:_color,:brand,:_brand,:note,)



mutable struct CodeSystem_Concept <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _definition::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    code::Union{String, Nothing}
    concept::Union{Vector{CodeSystem_Concept}, Nothing}
    definition::Union{string_fhir, Nothing}
    designation::Union{Vector{CodeSystem_Designation}, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    property::Union{Vector{CodeSystem_Property1}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem_Concept} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem_Concept} = (:id,:extension,:modifierExtension,:code,:_code,:display,:_display,:definition,:_definition,:designation,:property,:concept,)



mutable struct SpecimenDefinition_TypeTested <: AbstractFHIRType
    _isDerived::Union{Element, Nothing}
    _preference::Union{Element, Nothing}
    _requirement::Union{Element, Nothing}
    container::Union{SpecimenDefinition_Container, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    handling::Union{Vector{SpecimenDefinition_Handling}, Nothing}
    id::Union{string_fhir, Nothing}
    isDerived::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    preference::Union{String, Nothing}
    rejectionCriterion::Union{Vector{CodeableConcept}, Nothing}
    requirement::Union{string_fhir, Nothing}
    retentionTime::Union{Duration, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SpecimenDefinition_TypeTested} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SpecimenDefinition_TypeTested} = (:id,:extension,:modifierExtension,:isDerived,:_isDerived,:type,:preference,:_preference,:container,:requirement,:_requirement,:retentionTime,:rejectionCriterion,:handling,)



mutable struct MedicationKnowledge_Regulatory <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    maxDispense::Union{MedicationKnowledge_MaxDispense, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    regulatoryAuthority::Union{Reference, Nothing}
    schedule::Union{Vector{MedicationKnowledge_Schedule}, Nothing}
    substitution::Union{Vector{MedicationKnowledge_Substitution}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_Regulatory} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_Regulatory} = (:id,:extension,:modifierExtension,:regulatoryAuthority,:substitution,:schedule,:maxDispense,)



mutable struct OperationDefinition_Parameter <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _searchType::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    binding::Union{OperationDefinition_Binding, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
    part::Union{Vector{OperationDefinition_Parameter}, Nothing}
    referencedFrom::Union{Vector{OperationDefinition_ReferencedFrom}, Nothing}
    searchType::Union{String, Nothing}
    targetProfile::Union{Vector{String}, Nothing}
    type::Union{String, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationDefinition_Parameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationDefinition_Parameter} = (:id,:extension,:modifierExtension,:name,:_name,:use,:_use,:min,:_min,:max,:_max,:documentation,:_documentation,:type,:_type,:targetProfile,:searchType,:_searchType,:binding,:referencedFrom,:part,)



mutable struct ChargeItemDefinition_PropertyGroup <: AbstractFHIRType
    applicability::Union{Vector{ChargeItemDefinition_Applicability}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    priceComponent::Union{Vector{ChargeItemDefinition_PriceComponent}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItemDefinition_PropertyGroup} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItemDefinition_PropertyGroup} = (:id,:extension,:modifierExtension,:applicability,:priceComponent,)



mutable struct SearchParameter <: AbstractResource
    _base::Union{Vector{Element}, Nothing}
    _chain::Union{Vector{Element}, Nothing}
    _code::Union{Element, Nothing}
    _comparator::Union{Vector{Element}, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _expression::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _modifier::Union{Vector{Element}, Nothing}
    _multipleAnd::Union{Element, Nothing}
    _multipleOr::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _target::Union{Vector{Element}, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    _xpath::Union{Element, Nothing}
    _xpathUsage::Union{Element, Nothing}
    base::Union{Vector{String}, Nothing}
    chain::Union{Vector{string_fhir}, Nothing}
    code::Union{String, Nothing}
    comparator::Union{Vector{String}, Nothing}
    component::Union{Vector{SearchParameter_Component}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    derivedFrom::Union{String, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    expression::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifier::Union{Vector{String}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    multipleAnd::Union{Bool, Nothing}
    multipleOr::Union{Bool, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    target::Union{Vector{String}, Nothing}
    text::Union{String, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
    xpath::Union{string_fhir, Nothing}
    xpathUsage::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SearchParameter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SearchParameter} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:derivedFrom,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:code,:_code,:base,:_base,:type,:_type,:expression,:_expression,:xpath,:_xpath,:xpathUsage,:_xpathUsage,:target,:_target,:multipleOr,:_multipleOr,:multipleAnd,:_multipleAnd,:comparator,:_comparator,:modifier,:_modifier,:chain,:_chain,:component,)



mutable struct SubstanceSpecification_Structure <: AbstractFHIRType
    _molecularFormula::Union{Element, Nothing}
    _molecularFormulaByMoiety::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    isotope::Union{Vector{SubstanceSpecification_Isotope}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    molecularFormula::Union{string_fhir, Nothing}
    molecularFormulaByMoiety::Union{string_fhir, Nothing}
    molecularWeight::Union{SubstanceSpecification_MolecularWeight, Nothing}
    opticalActivity::Union{CodeableConcept, Nothing}
    representation::Union{Vector{SubstanceSpecification_Representation}, Nothing}
    source::Union{Vector{Reference}, Nothing}
    stereochemistry::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Structure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Structure} = (:id,:extension,:modifierExtension,:stereochemistry,:opticalActivity,:molecularFormula,:_molecularFormula,:molecularFormulaByMoiety,:_molecularFormulaByMoiety,:isotope,:molecularWeight,:source,:representation,)



mutable struct AllergyIntolerance <: AbstractResource
    _category::Union{Vector{Element}, Nothing}
    _criticality::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastOccurrence::Union{Element, Nothing}
    _onsetDateTime::Union{Element, Nothing}
    _onsetString::Union{Element, Nothing}
    _recordedDate::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    asserter::Union{Reference, Nothing}
    category::Union{Vector{String}, Nothing}
    clinicalStatus::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    criticality::Union{String, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    lastOccurrence::Union{Union{DateTime, ZonedDateTime}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    onsetAge::Union{Age, Nothing}
    onsetDateTime::Union{string_fhir, Nothing}
    onsetPeriod::Union{Period, Nothing}
    onsetRange::Union{Range, Nothing}
    onsetString::Union{string_fhir, Nothing}
    patient::Union{Reference, Nothing}
    reaction::Union{Vector{AllergyIntolerance_Reaction}, Nothing}
    recordedDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    recorder::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
    type::Union{String, Nothing}
    verificationStatus::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AllergyIntolerance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AllergyIntolerance} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:clinicalStatus,:verificationStatus,:type,:_type,:category,:_category,:criticality,:_criticality,:code,:patient,:encounter,:onsetDateTime,:_onsetDateTime,:onsetAge,:onsetPeriod,:onsetRange,:onsetString,:_onsetString,:recordedDate,:_recordedDate,:recorder,:asserter,:lastOccurrence,:_lastOccurrence,:note,:reaction,)



mutable struct TestReport_Action <: AbstractFHIRType
    assert::Union{TestReport_Assert, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestReport_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Action} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Action} = (:id,:extension,:modifierExtension,:operation,:assert,)



mutable struct BiologicallyDerivedProduct <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _productCategory::Union{Element, Nothing}
    _quantity::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    collection::Union{BiologicallyDerivedProduct_Collection, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    manipulation::Union{BiologicallyDerivedProduct_Manipulation, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    parent::Union{Vector{Reference}, Nothing}
    processing::Union{Vector{BiologicallyDerivedProduct_Processing}, Nothing}
    productCategory::Union{String, Nothing}
    productCode::Union{CodeableConcept, Nothing}
    quantity::Union{SafeInt32, Nothing}
    request::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    storage::Union{Vector{BiologicallyDerivedProduct_Storage}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: BiologicallyDerivedProduct} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: BiologicallyDerivedProduct} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:productCategory,:_productCategory,:productCode,:status,:_status,:request,:quantity,:_quantity,:parent,:collection,:processing,:manipulation,:storage,)



mutable struct MedicinalProductPackaged_PackageItem <: AbstractFHIRType
    alternateMaterial::Union{Vector{CodeableConcept}, Nothing}
    device::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    manufacturedItem::Union{Vector{Reference}, Nothing}
    manufacturer::Union{Vector{Reference}, Nothing}
    material::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    otherCharacteristics::Union{Vector{CodeableConcept}, Nothing}
    packageItem::Union{Vector{MedicinalProductPackaged_PackageItem}, Nothing}
    physicalCharacteristics::Union{ProdCharacteristic, Nothing}
    quantity::Union{Quantity, Nothing}
    shelfLifeStorage::Union{Vector{ProductShelfLife}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPackaged_PackageItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPackaged_PackageItem} = (:id,:extension,:modifierExtension,:identifier,:type,:quantity,:material,:alternateMaterial,:device,:manufacturedItem,:packageItem,:physicalCharacteristics,:otherCharacteristics,:shelfLifeStorage,:manufacturer,)



mutable struct ActivityDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _intent::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _timingDateTime::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    bodySite::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    doNotPerform::Union{Bool, Nothing}
    dosage::Union{Vector{Dosage}, Nothing}
    dynamicValue::Union{Vector{ActivityDefinition_DynamicValue}, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    intent::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    library::Union{Vector{String}, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    observationRequirement::Union{Vector{Reference}, Nothing}
    observationResultRequirement::Union{Vector{Reference}, Nothing}
    participant::Union{Vector{ActivityDefinition_Participant}, Nothing}
    priority::Union{String, Nothing}
    productCodeableConcept::Union{CodeableConcept, Nothing}
    productReference::Union{Reference, Nothing}
    profile::Union{String, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    quantity::Union{Quantity, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    specimenRequirement::Union{Vector{Reference}, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    timingAge::Union{Age, Nothing}
    timingDateTime::Union{string_fhir, Nothing}
    timingDuration::Union{Duration, Nothing}
    timingPeriod::Union{Period, Nothing}
    timingRange::Union{Range, Nothing}
    timingTiming::Union{Timing, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    transform::Union{String, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ActivityDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ActivityDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:library,:kind,:_kind,:profile,:code,:intent,:_intent,:priority,:_priority,:doNotPerform,:_doNotPerform,:timingTiming,:timingDateTime,:_timingDateTime,:timingAge,:timingPeriod,:timingRange,:timingDuration,:location,:participant,:productReference,:productCodeableConcept,:quantity,:dosage,:bodySite,:specimenRequirement,:observationRequirement,:observationResultRequirement,:transform,:dynamicValue,)



mutable struct RiskAssessment <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _mitigation::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    basedOn::Union{Reference, Nothing}
    basis::Union{Vector{Reference}, Nothing}
    code::Union{CodeableConcept, Nothing}
    condition::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    method::Union{CodeableConcept, Nothing}
    mitigation::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    parent::Union{Reference, Nothing}
    performer::Union{Reference, Nothing}
    prediction::Union{Vector{RiskAssessment_Prediction}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskAssessment} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskAssessment} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:parent,:status,:_status,:method,:code,:subject,:encounter,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:condition,:performer,:reasonCode,:reasonReference,:basis,:prediction,:mitigation,:_mitigation,:note,)



mutable struct Subscription <: AbstractResource
    _criteria::Union{Element, Nothing}
    _end::Union{Element, Nothing}
    _error::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _reason::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    channel::Union{Subscription_Channel, Nothing}
    contact::Union{Vector{ContactPoint}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    criteria::Union{string_fhir, Nothing}
    end::Union{Union{DateTime, ZonedDateTime}, Nothing}
    error::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{string_fhir, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Subscription} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Subscription} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:status,:_status,:contact,:end,:_end,:reason,:_reason,:criteria,:_criteria,:error,:_error,:channel,)



mutable struct MolecularSequence_StructureVariant <: AbstractFHIRType
    _exact::Union{Element, Nothing}
    _length::Union{Element, Nothing}
    exact::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    inner::Union{MolecularSequence_Inner, Nothing}
    length::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outer::Union{MolecularSequence_Outer, Nothing}
    variantType::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence_StructureVariant} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence_StructureVariant} = (:id,:extension,:modifierExtension,:variantType,:exact,:_exact,:length,:_length,:outer,:inner,)



mutable struct ExplanationOfBenefit_SubDetail <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    _sequence::Union{Element, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_SubDetail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_SubDetail} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:revenue,:category,:productOrService,:modifier,:programCode,:quantity,:unitPrice,:factor,:_factor,:net,:udi,:noteNumber,:_noteNumber,:adjudication,)



mutable struct CarePlan_Activity <: AbstractFHIRType
    detail::Union{CarePlan_Detail, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcomeCodeableConcept::Union{Vector{CodeableConcept}, Nothing}
    outcomeReference::Union{Vector{Reference}, Nothing}
    progress::Union{Vector{Annotation}, Nothing}
    reference::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CarePlan_Activity} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CarePlan_Activity} = (:id,:extension,:modifierExtension,:outcomeCodeableConcept,:outcomeReference,:progress,:reference,:detail,)



mutable struct TerminologyCapabilities_Version <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _compositional::Union{Element, Nothing}
    _isDefault::Union{Element, Nothing}
    _language::Union{Vector{Element}, Nothing}
    _property::Union{Vector{Element}, Nothing}
    code::Union{string_fhir, Nothing}
    compositional::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    filter::Union{Vector{TerminologyCapabilities_Filter}, Nothing}
    id::Union{string_fhir, Nothing}
    isDefault::Union{Bool, Nothing}
    language::Union{Vector{String}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    property::Union{Vector{String}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Version} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Version} = (:id,:extension,:modifierExtension,:code,:_code,:isDefault,:_isDefault,:compositional,:_compositional,:language,:_language,:filter,:property,:_property,)



mutable struct ValueSet_Concept <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    code::Union{String, Nothing}
    designation::Union{Vector{ValueSet_Designation}, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Concept} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Concept} = (:id,:extension,:modifierExtension,:code,:_code,:display,:_display,:designation,)



mutable struct InsurancePlan_Coverage <: AbstractFHIRType
    benefit::Union{Vector{InsurancePlan_Benefit}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    network::Union{Vector{Reference}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Coverage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Coverage} = (:id,:extension,:modifierExtension,:type,:network,:benefit,)



mutable struct Medication <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    amount::Union{Ratio, Nothing}
    batch::Union{Medication_Batch, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    form::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    ingredient::Union{Vector{Medication_Ingredient}, Nothing}
    language::Union{String, Nothing}
    manufacturer::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Medication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Medication} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:code,:status,:_status,:manufacturer,:form,:amount,:ingredient,:batch,)



mutable struct ImagingStudy_Series <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _number::Union{Element, Nothing}
    _numberOfInstances::Union{Element, Nothing}
    _started::Union{Element, Nothing}
    _uid::Union{Element, Nothing}
    bodySite::Union{Coding, Nothing}
    description::Union{string_fhir, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    instance::Union{Vector{ImagingStudy_Instance}, Nothing}
    laterality::Union{Coding, Nothing}
    modality::Union{Coding, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    number::Union{SafeInt32, Nothing}
    numberOfInstances::Union{SafeInt32, Nothing}
    performer::Union{Vector{ImagingStudy_Performer}, Nothing}
    specimen::Union{Vector{Reference}, Nothing}
    started::Union{Union{DateTime, ZonedDateTime}, Nothing}
    uid::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImagingStudy_Series} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImagingStudy_Series} = (:id,:extension,:modifierExtension,:uid,:_uid,:number,:_number,:modality,:description,:_description,:numberOfInstances,:_numberOfInstances,:endpoint,:bodySite,:laterality,:specimen,:started,:_started,:performer,:instance,)



mutable struct ExampleScenario_Operation <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _initiator::Union{Element, Nothing}
    _initiatorActive::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _number::Union{Element, Nothing}
    _receiver::Union{Element, Nothing}
    _receiverActive::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    initiator::Union{string_fhir, Nothing}
    initiatorActive::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    number::Union{string_fhir, Nothing}
    receiver::Union{string_fhir, Nothing}
    receiverActive::Union{Bool, Nothing}
    request::Union{ExampleScenario_ContainedInstance, Nothing}
    response::Union{ExampleScenario_ContainedInstance, Nothing}
    type::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Operation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Operation} = (:id,:extension,:modifierExtension,:number,:_number,:type,:_type,:name,:_name,:initiator,:_initiator,:receiver,:_receiver,:description,:_description,:initiatorActive,:_initiatorActive,:receiverActive,:_receiverActive,:request,:response,)



mutable struct TestReport_Action2 <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestReport_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Action2} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Action2} = (:id,:extension,:modifierExtension,:operation,)



mutable struct Task <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Element, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastModified::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    businessStatus::Union{CodeableConcept, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    encounter::Union{Reference, Nothing}
    executionPeriod::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Reference, Nothing}
    for::Union{Reference, Nothing}
    groupIdentifier::Union{Identifier, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    input::Union{Vector{Task_Input}, Nothing}
    instantiatesCanonical::Union{String, Nothing}
    instantiatesUri::Union{String, Nothing}
    insurance::Union{Vector{Reference}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    lastModified::Union{Union{DateTime, ZonedDateTime}, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    output::Union{Vector{Task_Output}, Nothing}
    owner::Union{Reference, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performerType::Union{Vector{CodeableConcept}, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{CodeableConcept, Nothing}
    reasonReference::Union{Reference, Nothing}
    relevantHistory::Union{Vector{Reference}, Nothing}
    requester::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    restriction::Union{Task_Restriction, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Task} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Task} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:groupIdentifier,:partOf,:status,:_status,:statusReason,:businessStatus,:intent,:_intent,:priority,:_priority,:code,:description,:_description,:focus,:for,:encounter,:executionPeriod,:authoredOn,:_authoredOn,:lastModified,:_lastModified,:requester,:performerType,:owner,:location,:reasonCode,:reasonReference,:insurance,:note,:relevantHistory,:restriction,:input,:output,)



mutable struct Provenance <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurredDateTime::Union{Element, Nothing}
    _policy::Union{Vector{Element}, Nothing}
    _recorded::Union{Element, Nothing}
    activity::Union{CodeableConcept, Nothing}
    agent::Union{Vector{Provenance_Agent}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    entity::Union{Vector{Provenance_Entity}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    occurredDateTime::Union{string_fhir, Nothing}
    occurredPeriod::Union{Period, Nothing}
    policy::Union{Vector{String}, Nothing}
    reason::Union{Vector{CodeableConcept}, Nothing}
    recorded::Union{Union{DateTime, ZonedDateTime}, Nothing}
    resourceType::Union{String, Nothing}
    signature::Union{Vector{Signature}, Nothing}
    target::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Provenance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Provenance} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:target,:occurredPeriod,:occurredDateTime,:_occurredDateTime,:recorded,:_recorded,:policy,:_policy,:location,:reason,:activity,:agent,:entity,:signature,)



mutable struct FamilyMemberHistory <: AbstractResource
    _ageString::Union{Element, Nothing}
    _bornDate::Union{Element, Nothing}
    _bornString::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _deceasedBoolean::Union{Element, Nothing}
    _deceasedDate::Union{Element, Nothing}
    _deceasedString::Union{Element, Nothing}
    _estimatedAge::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    ageAge::Union{Age, Nothing}
    ageRange::Union{Range, Nothing}
    ageString::Union{string_fhir, Nothing}
    bornDate::Union{string_fhir, Nothing}
    bornPeriod::Union{Period, Nothing}
    bornString::Union{string_fhir, Nothing}
    condition::Union{Vector{FamilyMemberHistory_Condition}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    dataAbsentReason::Union{CodeableConcept, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    deceasedAge::Union{Age, Nothing}
    deceasedBoolean::Union{Bool, Nothing}
    deceasedDate::Union{string_fhir, Nothing}
    deceasedRange::Union{Range, Nothing}
    deceasedString::Union{string_fhir, Nothing}
    estimatedAge::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    patient::Union{Reference, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    relationship::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    sex::Union{CodeableConcept, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: FamilyMemberHistory} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: FamilyMemberHistory} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:status,:_status,:dataAbsentReason,:patient,:date,:_date,:name,:_name,:relationship,:sex,:bornPeriod,:bornDate,:_bornDate,:bornString,:_bornString,:ageAge,:ageRange,:ageString,:_ageString,:estimatedAge,:_estimatedAge,:deceasedBoolean,:_deceasedBoolean,:deceasedAge,:deceasedRange,:deceasedDate,:_deceasedDate,:deceasedString,:_deceasedString,:reasonCode,:reasonReference,:note,:condition,)



mutable struct AdverseEvent_SuspectEntity <: AbstractFHIRType
    causality::Union{Vector{AdverseEvent_Causality}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    instance::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AdverseEvent_SuspectEntity} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AdverseEvent_SuspectEntity} = (:id,:extension,:modifierExtension,:instance,:causality,)



mutable struct ResearchStudy <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    arm::Union{Vector{ResearchStudy_Arm}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    condition::Union{Vector{CodeableConcept}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{String, Nothing}
    enrollment::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Vector{CodeableConcept}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    keyword::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    location::Union{Vector{CodeableConcept}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    objective::Union{Vector{ResearchStudy_Objective}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    period::Union{Period, Nothing}
    phase::Union{CodeableConcept, Nothing}
    primaryPurposeType::Union{CodeableConcept, Nothing}
    principalInvestigator::Union{Reference, Nothing}
    protocol::Union{Vector{Reference}, Nothing}
    reasonStopped::Union{CodeableConcept, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    site::Union{Vector{Reference}, Nothing}
    sponsor::Union{Reference, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchStudy} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchStudy} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:title,:_title,:protocol,:partOf,:status,:_status,:primaryPurposeType,:phase,:category,:focus,:condition,:contact,:relatedArtifact,:keyword,:location,:description,:_description,:enrollment,:period,:sponsor,:principalInvestigator,:site,:reasonStopped,:note,:arm,:objective,)



mutable struct PractitionerRole <: AbstractResource
    _active::Union{Element, Nothing}
    _availabilityExceptions::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    availabilityExceptions::Union{string_fhir, Nothing}
    availableTime::Union{Vector{PractitionerRole_AvailableTime}, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    healthcareService::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    notAvailable::Union{Vector{PractitionerRole_NotAvailable}, Nothing}
    organization::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    practitioner::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PractitionerRole} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PractitionerRole} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:period,:practitioner,:organization,:code,:specialty,:location,:healthcareService,:telecom,:availableTime,:notAvailable,:availabilityExceptions,:_availabilityExceptions,:endpoint,)



mutable struct ClaimResponse_SubDetail <: AbstractFHIRType
    _noteNumber::Union{Vector{Element}, Nothing}
    _subDetailSequence::Union{Element, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    subDetailSequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_SubDetail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_SubDetail} = (:id,:extension,:modifierExtension,:subDetailSequence,:_subDetailSequence,:noteNumber,:_noteNumber,:adjudication,)



mutable struct MedicationKnowledge_AdministrationGuidelines <: AbstractFHIRType
    dosage::Union{Vector{MedicationKnowledge_Dosage}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    indicationCodeableConcept::Union{CodeableConcept, Nothing}
    indicationReference::Union{Reference, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patientCharacteristics::Union{Vector{MedicationKnowledge_PatientCharacteristics}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge_AdministrationGuidelines} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge_AdministrationGuidelines} = (:id,:extension,:modifierExtension,:dosage,:indicationCodeableConcept,:indicationReference,:patientCharacteristics,)



mutable struct EffectEvidenceSynthesis_EffectEstimate <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    precisionEstimate::Union{Vector{EffectEvidenceSynthesis_PrecisionEstimate}, Nothing}
    type::Union{CodeableConcept, Nothing}
    unitOfMeasure::Union{CodeableConcept, Nothing}
    value::Union{FHIRNumber, Nothing}
    variantState::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis_EffectEstimate} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis_EffectEstimate} = (:id,:extension,:modifierExtension,:description,:_description,:type,:variantState,:value,:_value,:unitOfMeasure,:precisionEstimate,)



mutable struct ImplementationGuide_Manifest <: AbstractFHIRType
    _image::Union{Vector{Element}, Nothing}
    _other::Union{Vector{Element}, Nothing}
    _rendering::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    image::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    other::Union{Vector{string_fhir}, Nothing}
    page::Union{Vector{ImplementationGuide_Page1}, Nothing}
    rendering::Union{String, Nothing}
    resource::Union{Vector{ImplementationGuide_Resource1}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Manifest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Manifest} = (:id,:extension,:modifierExtension,:rendering,:_rendering,:resource,:page,:image,:_image,:other,:_other,)



mutable struct DeviceRequest <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    codeCodeableConcept::Union{CodeableConcept, Nothing}
    codeReference::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupIdentifier::Union{Identifier, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    insurance::Union{Vector{Reference}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    parameter::Union{Vector{DeviceRequest_Parameter}, Nothing}
    performer::Union{Reference, Nothing}
    performerType::Union{CodeableConcept, Nothing}
    priorRequest::Union{Vector{Reference}, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    relevantHistory::Union{Vector{Reference}, Nothing}
    requester::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    supportingInfo::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:priorRequest,:groupIdentifier,:status,:_status,:intent,:_intent,:priority,:_priority,:codeReference,:codeCodeableConcept,:parameter,:subject,:encounter,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:authoredOn,:_authoredOn,:requester,:performerType,:performer,:reasonCode,:reasonReference,:insurance,:supportingInfo,:note,:relevantHistory,)



mutable struct OperationOutcome <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    issue::Union{Vector{OperationOutcome_Issue}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationOutcome} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationOutcome} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:issue,)



mutable struct Composition <: AbstractResource
    _confidentiality::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    attester::Union{Vector{Composition_Attester}, Nothing}
    author::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    confidentiality::Union{String, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    custodian::Union{Reference, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    encounter::Union{Reference, Nothing}
    event::Union{Vector{Composition_Event}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    relatesTo::Union{Vector{Composition_RelatesTo}, Nothing}
    resourceType::Union{String, Nothing}
    section::Union{Vector{Composition_Section}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Composition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Composition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:category,:subject,:encounter,:date,:_date,:author,:title,:_title,:confidentiality,:_confidentiality,:attester,:custodian,:relatesTo,:event,:section,)



mutable struct SubstanceSourceMaterial_Organism <: AbstractFHIRType
    _intraspecificDescription::Union{Element, Nothing}
    author::Union{Vector{SubstanceSourceMaterial_Author}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    family::Union{CodeableConcept, Nothing}
    genus::Union{CodeableConcept, Nothing}
    hybrid::Union{SubstanceSourceMaterial_Hybrid, Nothing}
    id::Union{string_fhir, Nothing}
    intraspecificDescription::Union{string_fhir, Nothing}
    intraspecificType::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organismGeneral::Union{SubstanceSourceMaterial_OrganismGeneral, Nothing}
    species::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial_Organism} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial_Organism} = (:id,:extension,:modifierExtension,:family,:genus,:species,:intraspecificType,:intraspecificDescription,:_intraspecificDescription,:author,:hybrid,:organismGeneral,)



mutable struct Account <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    coverage::Union{Vector{Account_Coverage}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    guarantor::Union{Vector{Account_Guarantor}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    owner::Union{Reference, Nothing}
    partOf::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    servicePeriod::Union{Period, Nothing}
    status::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Account} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Account} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:name,:_name,:subject,:servicePeriod,:coverage,:owner,:description,:_description,:guarantor,:partOf,)



mutable struct VerificationResult <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastPerformed::Union{Element, Nothing}
    _nextScheduled::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _statusDate::Union{Element, Nothing}
    _targetLocation::Union{Vector{Element}, Nothing}
    attestation::Union{VerificationResult_Attestation, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    failureAction::Union{CodeableConcept, Nothing}
    frequency::Union{Timing, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    lastPerformed::Union{Union{DateTime, ZonedDateTime}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    need::Union{CodeableConcept, Nothing}
    nextScheduled::Union{Date, Nothing}
    primarySource::Union{Vector{VerificationResult_PrimarySource}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    target::Union{Vector{Reference}, Nothing}
    targetLocation::Union{Vector{string_fhir}, Nothing}
    text::Union{String, Nothing}
    validationProcess::Union{Vector{CodeableConcept}, Nothing}
    validationType::Union{CodeableConcept, Nothing}
    validator::Union{Vector{VerificationResult_Validator}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VerificationResult} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VerificationResult} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:target,:targetLocation,:_targetLocation,:need,:status,:_status,:statusDate,:_statusDate,:validationType,:validationProcess,:frequency,:lastPerformed,:_lastPerformed,:nextScheduled,:_nextScheduled,:failureAction,:primarySource,:attestation,:validator,)



mutable struct ExplanationOfBenefit_SubDetail1 <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    quantity::Union{Quantity, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_SubDetail1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_SubDetail1} = (:id,:extension,:modifierExtension,:productOrService,:modifier,:quantity,:unitPrice,:factor,:_factor,:net,:noteNumber,:_noteNumber,:adjudication,)



mutable struct RequestGroup_Action <: AbstractFHIRType
    _cardinalityBehavior::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _groupingBehavior::Union{Element, Nothing}
    _precheckBehavior::Union{Element, Nothing}
    _prefix::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _requiredBehavior::Union{Element, Nothing}
    _selectionBehavior::Union{Element, Nothing}
    _textEquivalent::Union{Element, Nothing}
    _timingDateTime::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    action::Union{Vector{RequestGroup_Action}, Nothing}
    cardinalityBehavior::Union{String, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    condition::Union{Vector{RequestGroup_Condition}, Nothing}
    description::Union{string_fhir, Nothing}
    documentation::Union{Vector{RelatedArtifact}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupingBehavior::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    participant::Union{Vector{Reference}, Nothing}
    precheckBehavior::Union{String, Nothing}
    prefix::Union{string_fhir, Nothing}
    priority::Union{String, Nothing}
    relatedAction::Union{Vector{RequestGroup_RelatedAction}, Nothing}
    requiredBehavior::Union{String, Nothing}
    resource::Union{Reference, Nothing}
    selectionBehavior::Union{String, Nothing}
    textEquivalent::Union{string_fhir, Nothing}
    timingAge::Union{Age, Nothing}
    timingDateTime::Union{string_fhir, Nothing}
    timingDuration::Union{Duration, Nothing}
    timingPeriod::Union{Period, Nothing}
    timingRange::Union{Range, Nothing}
    timingTiming::Union{Timing, Nothing}
    title::Union{string_fhir, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RequestGroup_Action} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RequestGroup_Action} = (:id,:extension,:modifierExtension,:prefix,:_prefix,:title,:_title,:description,:_description,:textEquivalent,:_textEquivalent,:priority,:_priority,:code,:documentation,:condition,:relatedAction,:timingDateTime,:_timingDateTime,:timingAge,:timingPeriod,:timingDuration,:timingRange,:timingTiming,:participant,:type,:groupingBehavior,:_groupingBehavior,:selectionBehavior,:_selectionBehavior,:requiredBehavior,:_requiredBehavior,:precheckBehavior,:_precheckBehavior,:cardinalityBehavior,:_cardinalityBehavior,:resource,:action,)



mutable struct StructureMap_Target <: AbstractFHIRType
    _context::Union{Element, Nothing}
    _contextType::Union{Element, Nothing}
    _element::Union{Element, Nothing}
    _listMode::Union{Vector{Element}, Nothing}
    _listRuleId::Union{Element, Nothing}
    _transform::Union{Element, Nothing}
    _variable::Union{Element, Nothing}
    context::Union{String, Nothing}
    contextType::Union{String, Nothing}
    element::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    listMode::Union{Vector{String}, Nothing}
    listRuleId::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    parameter::Union{Vector{StructureMap_Parameter}, Nothing}
    transform::Union{String, Nothing}
    variable::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Target} = (:id,:extension,:modifierExtension,:context,:_context,:contextType,:_contextType,:element,:_element,:variable,:_variable,:listMode,:_listMode,:listRuleId,:_listRuleId,:transform,:_transform,:parameter,)



mutable struct CoverageEligibilityRequest <: AbstractResource
    _created::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _purpose::Union{Vector{Element}, Nothing}
    _servicedDate::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    enterer::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    facility::Union{Reference, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurance::Union{Vector{CoverageEligibilityRequest_Insurance}, Nothing}
    insurer::Union{Reference, Nothing}
    item::Union{Vector{CoverageEligibilityRequest_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    priority::Union{CodeableConcept, Nothing}
    provider::Union{Reference, Nothing}
    purpose::Union{Vector{String}, Nothing}
    resourceType::Union{String, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    status::Union{String, Nothing}
    supportingInfo::Union{Vector{CoverageEligibilityRequest_SupportingInfo}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:priority,:purpose,:_purpose,:patient,:servicedDate,:_servicedDate,:servicedPeriod,:created,:_created,:enterer,:provider,:insurer,:facility,:supportingInfo,:insurance,:item,)



mutable struct NutritionOrder <: AbstractResource
    _dateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiates::Union{Vector{Element}, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    allergyIntolerance::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    dateTime::Union{Union{DateTime, ZonedDateTime}, Nothing}
    encounter::Union{Reference, Nothing}
    enteralFormula::Union{NutritionOrder_EnteralFormula, Nothing}
    excludeFoodModifier::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    foodPreferenceModifier::Union{Vector{CodeableConcept}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiates::Union{Vector{String}, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    oralDiet::Union{NutritionOrder_OralDiet, Nothing}
    orderer::Union{Reference, Nothing}
    patient::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    supplement::Union{Vector{NutritionOrder_Supplement}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NutritionOrder} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NutritionOrder} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:instantiates,:_instantiates,:status,:_status,:intent,:_intent,:patient,:encounter,:dateTime,:_dateTime,:orderer,:allergyIntolerance,:foodPreferenceModifier,:excludeFoodModifier,:oralDiet,:supplement,:enteralFormula,:note,)



mutable struct ResearchElementDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _comment::Union{Vector{Element}, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _shortTitle::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _variableType::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    characteristic::Union{Vector{ResearchElementDefinition_Characteristic}, Nothing}
    comment::Union{Vector{string_fhir}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    library::Union{Vector{String}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    shortTitle::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    variableType::Union{String, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ResearchElementDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ResearchElementDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:shortTitle,:_shortTitle,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:comment,:_comment,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:library,:type,:_type,:variableType,:_variableType,:characteristic,)



mutable struct AuditEvent_Agent <: AbstractFHIRType
    _altId::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _policy::Union{Vector{Element}, Nothing}
    _requestor::Union{Element, Nothing}
    altId::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    location::Union{Reference, Nothing}
    media::Union{Coding, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    network::Union{AuditEvent_Network, Nothing}
    policy::Union{Vector{String}, Nothing}
    purposeOfUse::Union{Vector{CodeableConcept}, Nothing}
    requestor::Union{Bool, Nothing}
    role::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
    who::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent_Agent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent_Agent} = (:id,:extension,:modifierExtension,:type,:role,:who,:altId,:_altId,:name,:_name,:requestor,:_requestor,:location,:policy,:_policy,:media,:network,:purposeOfUse,)



mutable struct Patient <: AbstractResource
    _active::Union{Element, Nothing}
    _birthDate::Union{Element, Nothing}
    _deceasedBoolean::Union{Element, Nothing}
    _deceasedDateTime::Union{Element, Nothing}
    _gender::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _multipleBirthBoolean::Union{Element, Nothing}
    _multipleBirthInteger::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    address::Union{Vector{Address}, Nothing}
    birthDate::Union{Date, Nothing}
    communication::Union{Vector{Patient_Communication}, Nothing}
    contact::Union{Vector{Patient_Contact}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    deceasedBoolean::Union{Bool, Nothing}
    deceasedDateTime::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    gender::Union{String, Nothing}
    generalPractitioner::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    link::Union{Vector{Patient_Link}, Nothing}
    managingOrganization::Union{Reference, Nothing}
    maritalStatus::Union{CodeableConcept, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    multipleBirthBoolean::Union{Bool, Nothing}
    multipleBirthInteger::Union{FHIRInt32, Nothing}
    name::Union{Vector{HumanName}, Nothing}
    photo::Union{Vector{Attachment}, Nothing}
    resourceType::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Patient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Patient} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:name,:telecom,:gender,:_gender,:birthDate,:_birthDate,:deceasedBoolean,:_deceasedBoolean,:deceasedDateTime,:_deceasedDateTime,:address,:maritalStatus,:multipleBirthBoolean,:_multipleBirthBoolean,:multipleBirthInteger,:_multipleBirthInteger,:photo,:contact,:communication,:generalPractitioner,:managingOrganization,:link,)



mutable struct SubstanceNucleicAcid_Subunit <: AbstractFHIRType
    _length::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    _subunit::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fivePrime::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    length::Union{SafeInt32, Nothing}
    linkage::Union{Vector{SubstanceNucleicAcid_Linkage}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    sequence::Union{string_fhir, Nothing}
    sequenceAttachment::Union{Attachment, Nothing}
    subunit::Union{SafeInt32, Nothing}
    sugar::Union{Vector{SubstanceNucleicAcid_Sugar}, Nothing}
    threePrime::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceNucleicAcid_Subunit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceNucleicAcid_Subunit} = (:id,:extension,:modifierExtension,:subunit,:_subunit,:sequence,:_sequence,:length,:_length,:sequenceAttachment,:fivePrime,:threePrime,:linkage,:sugar,)



mutable struct Communication <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _language::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _received::Union{Element, Nothing}
    _sent::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    about::Union{Vector{Reference}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    inResponseTo::Union{Vector{Reference}, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    language::Union{String, Nothing}
    medium::Union{Vector{CodeableConcept}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    payload::Union{Vector{Communication_Payload}, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    received::Union{Union{DateTime, ZonedDateTime}, Nothing}
    recipient::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    sender::Union{Reference, Nothing}
    sent::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    topic::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Communication} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Communication} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:partOf,:inResponseTo,:status,:_status,:statusReason,:category,:priority,:_priority,:medium,:subject,:topic,:about,:encounter,:sent,:_sent,:received,:_received,:recipient,:sender,:reasonCode,:reasonReference,:payload,:note,)



mutable struct NamingSystem <: AbstractResource
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _responsible::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    resourceType::Union{String, Nothing}
    responsible::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    uniqueId::Union{Vector{NamingSystem_UniqueId}, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: NamingSystem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: NamingSystem} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:name,:_name,:status,:_status,:kind,:_kind,:date,:_date,:publisher,:_publisher,:contact,:responsible,:_responsible,:type,:description,:_description,:useContext,:jurisdiction,:usage,:_usage,:uniqueId,)



mutable struct MedicinalProductAuthorization <: AbstractResource
    _dateOfFirstAuthorization::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _internationalBirthDate::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _restoreDate::Union{Element, Nothing}
    _statusDate::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    country::Union{Vector{CodeableConcept}, Nothing}
    dataExclusivityPeriod::Union{Period, Nothing}
    dateOfFirstAuthorization::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    holder::Union{Reference, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    internationalBirthDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    jurisdictionalAuthorization::Union{Vector{MedicinalProductAuthorization_JurisdictionalAuthorization}, Nothing}
    language::Union{String, Nothing}
    legalBasis::Union{CodeableConcept, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    procedure::Union{MedicinalProductAuthorization_Procedure, Nothing}
    regulator::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    restoreDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{CodeableConcept, Nothing}
    statusDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    validityPeriod::Union{Period, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductAuthorization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductAuthorization} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:subject,:country,:jurisdiction,:status,:statusDate,:_statusDate,:restoreDate,:_restoreDate,:validityPeriod,:dataExclusivityPeriod,:dateOfFirstAuthorization,:_dateOfFirstAuthorization,:internationalBirthDate,:_internationalBirthDate,:legalBasis,:jurisdictionalAuthorization,:holder,:regulator,:procedure,)



mutable struct Immunization <: AbstractResource
    _expirationDate::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _isSubpotent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lotNumber::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _occurrenceString::Union{Element, Nothing}
    _primarySource::Union{Element, Nothing}
    _recorded::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    doseQuantity::Union{Quantity, Nothing}
    education::Union{Vector{Immunization_Education}, Nothing}
    encounter::Union{Reference, Nothing}
    expirationDate::Union{Date, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fundingSource::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    isSubpotent::Union{Bool, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    lotNumber::Union{string_fhir, Nothing}
    manufacturer::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrenceString::Union{string_fhir, Nothing}
    patient::Union{Reference, Nothing}
    performer::Union{Vector{Immunization_Performer}, Nothing}
    primarySource::Union{Bool, Nothing}
    programEligibility::Union{Vector{CodeableConcept}, Nothing}
    protocolApplied::Union{Vector{Immunization_ProtocolApplied}, Nothing}
    reaction::Union{Vector{Immunization_Reaction}, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    recorded::Union{Union{DateTime, ZonedDateTime}, Nothing}
    reportOrigin::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    route::Union{CodeableConcept, Nothing}
    site::Union{CodeableConcept, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subpotentReason::Union{Vector{CodeableConcept}, Nothing}
    text::Union{String, Nothing}
    vaccineCode::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Immunization} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Immunization} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:statusReason,:vaccineCode,:patient,:encounter,:occurrenceDateTime,:_occurrenceDateTime,:occurrenceString,:_occurrenceString,:recorded,:_recorded,:primarySource,:_primarySource,:reportOrigin,:location,:manufacturer,:lotNumber,:_lotNumber,:expirationDate,:_expirationDate,:site,:route,:doseQuantity,:performer,:note,:reasonCode,:reasonReference,:isSubpotent,:_isSubpotent,:subpotentReason,:education,:programEligibility,:fundingSource,:reaction,:protocolApplied,)



mutable struct ClaimResponse_SubDetail1 <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    quantity::Union{Quantity, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_SubDetail1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_SubDetail1} = (:id,:extension,:modifierExtension,:productOrService,:modifier,:quantity,:unitPrice,:factor,:_factor,:net,:noteNumber,:_noteNumber,:adjudication,)



mutable struct TerminologyCapabilities_Expansion <: AbstractFHIRType
    _hierarchical::Union{Element, Nothing}
    _incomplete::Union{Element, Nothing}
    _paging::Union{Element, Nothing}
    _textFilter::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    hierarchical::Union{Bool, Nothing}
    id::Union{string_fhir, Nothing}
    incomplete::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    paging::Union{Bool, Nothing}
    parameter::Union{Vector{TerminologyCapabilities_Parameter}, Nothing}
    textFilter::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_Expansion} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_Expansion} = (:id,:extension,:modifierExtension,:hierarchical,:_hierarchical,:paging,:_paging,:incomplete,:_incomplete,:parameter,:textFilter,:_textFilter,)



mutable struct Measure_Stratifier <: AbstractFHIRType
    _description::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    component::Union{Vector{Measure_Component}, Nothing}
    criteria::Union{Expression, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure_Stratifier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure_Stratifier} = (:id,:extension,:modifierExtension,:code,:description,:_description,:criteria,:component,)



mutable struct Invoice_LineItem <: AbstractFHIRType
    _sequence::Union{Element, Nothing}
    chargeItemCodeableConcept::Union{CodeableConcept, Nothing}
    chargeItemReference::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    priceComponent::Union{Vector{Invoice_PriceComponent}, Nothing}
    sequence::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Invoice_LineItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Invoice_LineItem} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:chargeItemReference,:chargeItemCodeableConcept,:priceComponent,)



mutable struct Observation_Component <: AbstractFHIRType
    _valueBoolean::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    dataAbsentReason::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    interpretation::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    referenceRange::Union{Vector{Observation_ReferenceRange}, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valuePeriod::Union{Period, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Observation_Component} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Observation_Component} = (:id,:extension,:modifierExtension,:code,:valueQuantity,:valueCodeableConcept,:valueString,:_valueString,:valueBoolean,:_valueBoolean,:valueInteger,:_valueInteger,:valueRange,:valueRatio,:valueSampledData,:valueTime,:_valueTime,:valueDateTime,:_valueDateTime,:valuePeriod,:dataAbsentReason,:interpretation,:referenceRange,)



mutable struct DeviceDefinition <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _manufacturerString::Union{Element, Nothing}
    _modelNumber::Union{Element, Nothing}
    _onlineInformation::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Vector{Element}, Nothing}
    capability::Union{Vector{DeviceDefinition_Capability}, Nothing}
    contact::Union{Vector{ContactPoint}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    deviceName::Union{Vector{DeviceDefinition_DeviceName}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    languageCode::Union{Vector{CodeableConcept}, Nothing}
    manufacturerReference::Union{Reference, Nothing}
    manufacturerString::Union{string_fhir, Nothing}
    material::Union{Vector{DeviceDefinition_Material}, Nothing}
    meta::Union{Meta, Nothing}
    modelNumber::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    onlineInformation::Union{String, Nothing}
    owner::Union{Reference, Nothing}
    parentDevice::Union{Reference, Nothing}
    physicalCharacteristics::Union{ProdCharacteristic, Nothing}
    property::Union{Vector{DeviceDefinition_Property}, Nothing}
    quantity::Union{Quantity, Nothing}
    resourceType::Union{String, Nothing}
    safety::Union{Vector{CodeableConcept}, Nothing}
    shelfLifeStorage::Union{Vector{ProductShelfLife}, Nothing}
    specialization::Union{Vector{DeviceDefinition_Specialization}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    udiDeviceIdentifier::Union{Vector{DeviceDefinition_UdiDeviceIdentifier}, Nothing}
    url::Union{String, Nothing}
    version::Union{Vector{string_fhir}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:udiDeviceIdentifier,:manufacturerString,:_manufacturerString,:manufacturerReference,:deviceName,:modelNumber,:_modelNumber,:type,:specialization,:version,:_version,:safety,:shelfLifeStorage,:physicalCharacteristics,:languageCode,:capability,:property,:owner,:contact,:url,:_url,:onlineInformation,:_onlineInformation,:note,:quantity,:parentDevice,:material,)



mutable struct ConceptMap_Target <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _comment::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    _equivalence::Union{Element, Nothing}
    code::Union{String, Nothing}
    comment::Union{string_fhir, Nothing}
    dependsOn::Union{Vector{ConceptMap_DependsOn}, Nothing}
    display::Union{string_fhir, Nothing}
    equivalence::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    product::Union{Vector{ConceptMap_DependsOn}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap_Target} = (:id,:extension,:modifierExtension,:code,:_code,:display,:_display,:equivalence,:_equivalence,:comment,:_comment,:dependsOn,:product,)



mutable struct MessageDefinition <: AbstractResource
    _category::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _eventUri::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _responseRequired::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    allowedResponse::Union{Vector{MessageDefinition_AllowedResponse}, Nothing}
    base::Union{String, Nothing}
    category::Union{String, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    eventCoding::Union{Coding, Nothing}
    eventUri::Union{string_fhir, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Vector{MessageDefinition_Focus}, Nothing}
    graph::Union{Vector{String}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    parent::Union{Vector{String}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    replaces::Union{Vector{String}, Nothing}
    resourceType::Union{String, Nothing}
    responseRequired::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:replaces,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:base,:parent,:eventCoding,:eventUri,:_eventUri,:category,:_category,:focus,:responseRequired,:_responseRequired,:allowedResponse,:graph,)



mutable struct CapabilityStatement_Messaging <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _reliableCache::Union{Element, Nothing}
    documentation::Union{String, Nothing}
    endpoint::Union{Vector{CapabilityStatement_Endpoint}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reliableCache::Union{SafeInt32, Nothing}
    supportedMessage::Union{Vector{CapabilityStatement_SupportedMessage}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Messaging} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Messaging} = (:id,:extension,:modifierExtension,:endpoint,:reliableCache,:_reliableCache,:documentation,:_documentation,:supportedMessage,)



mutable struct MeasureReport_Stratum <: AbstractFHIRType
    component::Union{Vector{MeasureReport_Component}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measureScore::Union{Quantity, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    population::Union{Vector{MeasureReport_Population1}, Nothing}
    value::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Stratum} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Stratum} = (:id,:extension,:modifierExtension,:value,:component,:population,:measureScore,)



mutable struct AuditEvent_Entity <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _query::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    detail::Union{Vector{AuditEvent_Detail}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    lifecycle::Union{Coding, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    query::Union{String, Nothing}
    role::Union{Coding, Nothing}
    securityLabel::Union{Vector{Coding}, Nothing}
    type::Union{Coding, Nothing}
    what::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent_Entity} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent_Entity} = (:id,:extension,:modifierExtension,:what,:type,:role,:lifecycle,:securityLabel,:name,:_name,:description,:_description,:query,:_query,:detail,)



mutable struct TestScript_Metadata <: AbstractFHIRType
    capability::Union{Vector{TestScript_Capability}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    link::Union{Vector{TestScript_Link}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Metadata} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Metadata} = (:id,:extension,:modifierExtension,:link,:capability,)



mutable struct ImmunizationRecommendation_Recommendation <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _doseNumberPositiveInt::Union{Element, Nothing}
    _doseNumberString::Union{Element, Nothing}
    _series::Union{Element, Nothing}
    _seriesDosesPositiveInt::Union{Element, Nothing}
    _seriesDosesString::Union{Element, Nothing}
    contraindicatedVaccineCode::Union{Vector{CodeableConcept}, Nothing}
    dateCriterion::Union{Vector{ImmunizationRecommendation_DateCriterion}, Nothing}
    description::Union{string_fhir, Nothing}
    doseNumberPositiveInt::Union{FHIRInt32, Nothing}
    doseNumberString::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    forecastReason::Union{Vector{CodeableConcept}, Nothing}
    forecastStatus::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    series::Union{string_fhir, Nothing}
    seriesDosesPositiveInt::Union{FHIRInt32, Nothing}
    seriesDosesString::Union{string_fhir, Nothing}
    supportingImmunization::Union{Vector{Reference}, Nothing}
    supportingPatientInformation::Union{Vector{Reference}, Nothing}
    targetDisease::Union{CodeableConcept, Nothing}
    vaccineCode::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImmunizationRecommendation_Recommendation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImmunizationRecommendation_Recommendation} = (:id,:extension,:modifierExtension,:vaccineCode,:targetDisease,:contraindicatedVaccineCode,:forecastStatus,:forecastReason,:dateCriterion,:description,:_description,:series,:_series,:doseNumberPositiveInt,:_doseNumberPositiveInt,:doseNumberString,:_doseNumberString,:seriesDosesPositiveInt,:_seriesDosesPositiveInt,:seriesDosesString,:_seriesDosesString,:supportingImmunization,:supportingPatientInformation,)



mutable struct Questionnaire_Item <: AbstractFHIRType
    _definition::Union{Element, Nothing}
    _enableBehavior::Union{Element, Nothing}
    _linkId::Union{Element, Nothing}
    _maxLength::Union{Element, Nothing}
    _prefix::Union{Element, Nothing}
    _readOnly::Union{Element, Nothing}
    _repeats::Union{Element, Nothing}
    _required::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    answerOption::Union{Vector{Questionnaire_AnswerOption}, Nothing}
    answerValueSet::Union{String, Nothing}
    code::Union{Vector{Coding}, Nothing}
    definition::Union{String, Nothing}
    enableBehavior::Union{String, Nothing}
    enableWhen::Union{Vector{Questionnaire_EnableWhen}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    initial::Union{Vector{Questionnaire_Initial}, Nothing}
    item::Union{Vector{Questionnaire_Item}, Nothing}
    linkId::Union{string_fhir, Nothing}
    maxLength::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    prefix::Union{string_fhir, Nothing}
    readOnly::Union{Bool, Nothing}
    repeats::Union{Bool, Nothing}
    required::Union{Bool, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Questionnaire_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Questionnaire_Item} = (:id,:extension,:modifierExtension,:linkId,:_linkId,:definition,:_definition,:code,:prefix,:_prefix,:text,:_text,:type,:_type,:enableWhen,:enableBehavior,:_enableBehavior,:required,:_required,:repeats,:_repeats,:readOnly,:_readOnly,:maxLength,:_maxLength,:answerValueSet,:answerOption,:initial,:item,)



mutable struct Linkage <: AbstractResource
    _active::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    author::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    item::Union{Vector{Linkage_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Linkage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Linkage} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:active,:_active,:author,:item,)



mutable struct HealthcareService <: AbstractResource
    _active::Union{Element, Nothing}
    _appointmentRequired::Union{Element, Nothing}
    _availabilityExceptions::Union{Element, Nothing}
    _comment::Union{Element, Nothing}
    _extraDetails::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    active::Union{Bool, Nothing}
    appointmentRequired::Union{Bool, Nothing}
    availabilityExceptions::Union{string_fhir, Nothing}
    availableTime::Union{Vector{HealthcareService_AvailableTime}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    characteristic::Union{Vector{CodeableConcept}, Nothing}
    comment::Union{string_fhir, Nothing}
    communication::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    coverageArea::Union{Vector{Reference}, Nothing}
    eligibility::Union{Vector{HealthcareService_Eligibility}, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    extraDetails::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    notAvailable::Union{Vector{HealthcareService_NotAvailable}, Nothing}
    photo::Union{Attachment, Nothing}
    program::Union{Vector{CodeableConcept}, Nothing}
    providedBy::Union{Reference, Nothing}
    referralMethod::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    serviceProvisionCode::Union{Vector{CodeableConcept}, Nothing}
    specialty::Union{Vector{CodeableConcept}, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: HealthcareService} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: HealthcareService} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:active,:_active,:providedBy,:category,:type,:specialty,:location,:name,:_name,:comment,:_comment,:extraDetails,:_extraDetails,:photo,:telecom,:coverageArea,:serviceProvisionCode,:eligibility,:program,:characteristic,:communication,:referralMethod,:appointmentRequired,:_appointmentRequired,:availableTime,:notAvailable,:availabilityExceptions,:_availabilityExceptions,:endpoint,)



mutable struct GraphDefinition_Target <: AbstractFHIRType
    _params::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    compartment::Union{Vector{GraphDefinition_Compartment}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    link::Union{Vector{GraphDefinition_Link}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    params::Union{string_fhir, Nothing}
    profile::Union{String, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: GraphDefinition_Target} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: GraphDefinition_Target} = (:id,:extension,:modifierExtension,:type,:_type,:params,:_params,:profile,:compartment,:link,)



mutable struct EpisodeOfCare <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    account::Union{Vector{Reference}, Nothing}
    careManager::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    diagnosis::Union{Vector{EpisodeOfCare_Diagnosis}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    managingOrganization::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    referralRequest::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusHistory::Union{Vector{EpisodeOfCare_StatusHistory}, Nothing}
    team::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EpisodeOfCare} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EpisodeOfCare} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:statusHistory,:type,:diagnosis,:patient,:managingOrganization,:period,:referralRequest,:careManager,:team,:account,)



mutable struct CompartmentDefinition <: AbstractResource
    _code::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _search::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    code::Union{String, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resource::Union{Vector{CompartmentDefinition_Resource}, Nothing}
    resourceType::Union{String, Nothing}
    search::Union{Bool, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CompartmentDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CompartmentDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:purpose,:_purpose,:code,:_code,:search,:_search,:resource,)



mutable struct ElementDefinition_Slicing <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _ordered::Union{Element, Nothing}
    _rules::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    discriminator::Union{Vector{ElementDefinition_Discriminator}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    ordered::Union{Bool, Nothing}
    rules::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition_Slicing} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition_Slicing} = (:id,:extension,:modifierExtension,:discriminator,:description,:_description,:ordered,:_ordered,:rules,:_rules,)



mutable struct Contract_Asset <: AbstractFHIRType
    _condition::Union{Element, Nothing}
    _linkId::Union{Vector{Element}, Nothing}
    _securityLabelNumber::Union{Vector{Element}, Nothing}
    _text::Union{Element, Nothing}
    answer::Union{Vector{Contract_Answer}, Nothing}
    condition::Union{string_fhir, Nothing}
    context::Union{Vector{Contract_Context}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    linkId::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Vector{Period}, Nothing}
    periodType::Union{Vector{CodeableConcept}, Nothing}
    relationship::Union{Coding, Nothing}
    scope::Union{CodeableConcept, Nothing}
    securityLabelNumber::Union{Vector{SafeInt32}, Nothing}
    subtype::Union{Vector{CodeableConcept}, Nothing}
    text::Union{string_fhir, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
    typeReference::Union{Vector{Reference}, Nothing}
    usePeriod::Union{Vector{Period}, Nothing}
    valuedItem::Union{Vector{Contract_ValuedItem}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Asset} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Asset} = (:id,:extension,:modifierExtension,:scope,:type,:typeReference,:subtype,:relationship,:context,:condition,:_condition,:periodType,:period,:usePeriod,:text,:_text,:linkId,:_linkId,:answer,:securityLabelNumber,:_securityLabelNumber,:valuedItem,)



mutable struct SubstanceProtein <: AbstractResource
    _disulfideLinkage::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _numberOfSubunits::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    disulfideLinkage::Union{Vector{string_fhir}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfSubunits::Union{SafeInt32, Nothing}
    resourceType::Union{String, Nothing}
    sequenceType::Union{CodeableConcept, Nothing}
    subunit::Union{Vector{SubstanceProtein_Subunit}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceProtein} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceProtein} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:sequenceType,:numberOfSubunits,:_numberOfSubunits,:disulfideLinkage,:_disulfideLinkage,:subunit,)



mutable struct SubstancePolymer_DegreeOfPolymerisation <: AbstractFHIRType
    amount::Union{SubstanceAmount, Nothing}
    degree::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_DegreeOfPolymerisation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_DegreeOfPolymerisation} = (:id,:extension,:modifierExtension,:degree,:amount,)



mutable struct Specimen <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _receivedTime::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    accessionIdentifier::Union{Identifier, Nothing}
    collection::Union{Specimen_Collection, Nothing}
    condition::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    container::Union{Vector{Specimen_Container}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    parent::Union{Vector{Reference}, Nothing}
    processing::Union{Vector{Specimen_Processing}, Nothing}
    receivedTime::Union{Union{DateTime, ZonedDateTime}, Nothing}
    request::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Specimen} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Specimen} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:accessionIdentifier,:status,:_status,:type,:subject,:receivedTime,:_receivedTime,:parent,:request,:collection,:processing,:container,:condition,:note,)



mutable struct Device <: AbstractResource
    _distinctIdentifier::Union{Element, Nothing}
    _expirationDate::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lotNumber::Union{Element, Nothing}
    _manufactureDate::Union{Element, Nothing}
    _manufacturer::Union{Element, Nothing}
    _modelNumber::Union{Element, Nothing}
    _partNumber::Union{Element, Nothing}
    _serialNumber::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    contact::Union{Vector{ContactPoint}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    definition::Union{Reference, Nothing}
    deviceName::Union{Vector{Device_DeviceName}, Nothing}
    distinctIdentifier::Union{string_fhir, Nothing}
    expirationDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    lotNumber::Union{string_fhir, Nothing}
    manufactureDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    manufacturer::Union{string_fhir, Nothing}
    meta::Union{Meta, Nothing}
    modelNumber::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    owner::Union{Reference, Nothing}
    parent::Union{Reference, Nothing}
    partNumber::Union{string_fhir, Nothing}
    patient::Union{Reference, Nothing}
    property::Union{Vector{Device_Property}, Nothing}
    resourceType::Union{String, Nothing}
    safety::Union{Vector{CodeableConcept}, Nothing}
    serialNumber::Union{string_fhir, Nothing}
    specialization::Union{Vector{Device_Specialization}, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{Vector{CodeableConcept}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    udiCarrier::Union{Vector{Device_UdiCarrier}, Nothing}
    url::Union{String, Nothing}
    version::Union{Vector{Device_Version}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Device} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Device} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:definition,:udiCarrier,:status,:_status,:statusReason,:distinctIdentifier,:_distinctIdentifier,:manufacturer,:_manufacturer,:manufactureDate,:_manufactureDate,:expirationDate,:_expirationDate,:lotNumber,:_lotNumber,:serialNumber,:_serialNumber,:deviceName,:modelNumber,:_modelNumber,:partNumber,:_partNumber,:type,:specialization,:version,:property,:patient,:owner,:contact,:location,:url,:_url,:note,:safety,:parent,)



mutable struct Coverage <: AbstractResource
    _dependent::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _network::Union{Element, Nothing}
    _order::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subrogation::Union{Element, Nothing}
    _subscriberId::Union{Element, Nothing}
    beneficiary::Union{Reference, Nothing}
    class::Union{Vector{Coverage_Class}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    contract::Union{Vector{Reference}, Nothing}
    costToBeneficiary::Union{Vector{Coverage_CostToBeneficiary}, Nothing}
    dependent::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    network::Union{string_fhir, Nothing}
    order::Union{SafeInt32, Nothing}
    payor::Union{Vector{Reference}, Nothing}
    period::Union{Period, Nothing}
    policyHolder::Union{Reference, Nothing}
    relationship::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subrogation::Union{Bool, Nothing}
    subscriber::Union{Reference, Nothing}
    subscriberId::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Coverage} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Coverage} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:policyHolder,:subscriber,:subscriberId,:_subscriberId,:beneficiary,:dependent,:_dependent,:relationship,:period,:payor,:class,:order,:_order,:network,:_network,:costToBeneficiary,:subrogation,:_subrogation,:contract,)



mutable struct MedicinalProductPharmaceutical_TargetSpecies <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    withdrawalPeriod::Union{Vector{MedicinalProductPharmaceutical_WithdrawalPeriod}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPharmaceutical_TargetSpecies} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPharmaceutical_TargetSpecies} = (:id,:extension,:modifierExtension,:code,:withdrawalPeriod,)



mutable struct CoverageEligibilityResponse_Item <: AbstractFHIRType
    _authorizationRequired::Union{Element, Nothing}
    _authorizationUrl::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _excluded::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    authorizationRequired::Union{Bool, Nothing}
    authorizationSupporting::Union{Vector{CodeableConcept}, Nothing}
    authorizationUrl::Union{String, Nothing}
    benefit::Union{Vector{CoverageEligibilityResponse_Benefit}, Nothing}
    category::Union{CodeableConcept, Nothing}
    description::Union{string_fhir, Nothing}
    excluded::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    network::Union{CodeableConcept, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    provider::Union{Reference, Nothing}
    term::Union{CodeableConcept, Nothing}
    unit::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityResponse_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityResponse_Item} = (:id,:extension,:modifierExtension,:category,:productOrService,:modifier,:provider,:excluded,:_excluded,:name,:_name,:description,:_description,:network,:unit,:term,:benefit,:authorizationRequired,:_authorizationRequired,:authorizationSupporting,:authorizationUrl,:_authorizationUrl,)



mutable struct DetectedIssue <: AbstractResource
    _detail::Union{Element, Nothing}
    _identifiedDateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _reference::Union{Element, Nothing}
    _severity::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    author::Union{Reference, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    detail::Union{string_fhir, Nothing}
    evidence::Union{Vector{DetectedIssue_Evidence}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifiedDateTime::Union{string_fhir, Nothing}
    identifiedPeriod::Union{Period, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicated::Union{Vector{Reference}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    mitigation::Union{Vector{DetectedIssue_Mitigation}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    reference::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    severity::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DetectedIssue} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DetectedIssue} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:code,:severity,:_severity,:patient,:identifiedDateTime,:_identifiedDateTime,:identifiedPeriod,:author,:implicated,:evidence,:detail,:_detail,:reference,:_reference,:mitigation,)



mutable struct Substance <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    ingredient::Union{Vector{Substance_Ingredient}, Nothing}
    instance::Union{Vector{Substance_Instance}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Substance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Substance} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:category,:code,:description,:_description,:instance,:ingredient,)



mutable struct EvidenceVariable <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _shortTitle::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    characteristic::Union{Vector{EvidenceVariable_Characteristic}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    publisher::Union{string_fhir, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    shortTitle::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EvidenceVariable} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EvidenceVariable} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:shortTitle,:_shortTitle,:subtitle,:_subtitle,:status,:_status,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:note,:useContext,:jurisdiction,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:type,:_type,:characteristic,)



mutable struct CapabilityStatement_Resource <: AbstractFHIRType
    _conditionalCreate::Union{Element, Nothing}
    _conditionalDelete::Union{Element, Nothing}
    _conditionalRead::Union{Element, Nothing}
    _conditionalUpdate::Union{Element, Nothing}
    _documentation::Union{Element, Nothing}
    _readHistory::Union{Element, Nothing}
    _referencePolicy::Union{Vector{Element}, Nothing}
    _searchInclude::Union{Vector{Element}, Nothing}
    _searchRevInclude::Union{Vector{Element}, Nothing}
    _type::Union{Element, Nothing}
    _updateCreate::Union{Element, Nothing}
    _versioning::Union{Element, Nothing}
    conditionalCreate::Union{Bool, Nothing}
    conditionalDelete::Union{String, Nothing}
    conditionalRead::Union{String, Nothing}
    conditionalUpdate::Union{Bool, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    interaction::Union{Vector{CapabilityStatement_Interaction}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{Vector{CapabilityStatement_Operation}, Nothing}
    profile::Union{String, Nothing}
    readHistory::Union{Bool, Nothing}
    referencePolicy::Union{Vector{String}, Nothing}
    searchInclude::Union{Vector{string_fhir}, Nothing}
    searchParam::Union{Vector{CapabilityStatement_SearchParam}, Nothing}
    searchRevInclude::Union{Vector{string_fhir}, Nothing}
    supportedProfile::Union{Vector{String}, Nothing}
    type::Union{String, Nothing}
    updateCreate::Union{Bool, Nothing}
    versioning::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Resource} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Resource} = (:id,:extension,:modifierExtension,:type,:_type,:profile,:supportedProfile,:documentation,:_documentation,:interaction,:versioning,:_versioning,:readHistory,:_readHistory,:updateCreate,:_updateCreate,:conditionalCreate,:_conditionalCreate,:conditionalRead,:_conditionalRead,:conditionalUpdate,:_conditionalUpdate,:conditionalDelete,:_conditionalDelete,:referencePolicy,:_referencePolicy,:searchInclude,:_searchInclude,:searchRevInclude,:_searchRevInclude,:searchParam,:operation,)



mutable struct PlanDefinition_Action <: AbstractFHIRType
    _cardinalityBehavior::Union{Element, Nothing}
    _definitionCanonical::Union{Element, Nothing}
    _definitionUri::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _goalId::Union{Vector{Element}, Nothing}
    _groupingBehavior::Union{Element, Nothing}
    _precheckBehavior::Union{Element, Nothing}
    _prefix::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _requiredBehavior::Union{Element, Nothing}
    _selectionBehavior::Union{Element, Nothing}
    _textEquivalent::Union{Element, Nothing}
    _timingDateTime::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    action::Union{Vector{PlanDefinition_Action}, Nothing}
    cardinalityBehavior::Union{String, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    condition::Union{Vector{PlanDefinition_Condition}, Nothing}
    definitionCanonical::Union{string_fhir, Nothing}
    definitionUri::Union{string_fhir, Nothing}
    description::Union{string_fhir, Nothing}
    documentation::Union{Vector{RelatedArtifact}, Nothing}
    dynamicValue::Union{Vector{PlanDefinition_DynamicValue}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    goalId::Union{Vector{String}, Nothing}
    groupingBehavior::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    input::Union{Vector{DataRequirement}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    output::Union{Vector{DataRequirement}, Nothing}
    participant::Union{Vector{PlanDefinition_Participant}, Nothing}
    precheckBehavior::Union{String, Nothing}
    prefix::Union{string_fhir, Nothing}
    priority::Union{String, Nothing}
    reason::Union{Vector{CodeableConcept}, Nothing}
    relatedAction::Union{Vector{PlanDefinition_RelatedAction}, Nothing}
    requiredBehavior::Union{String, Nothing}
    selectionBehavior::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    textEquivalent::Union{string_fhir, Nothing}
    timingAge::Union{Age, Nothing}
    timingDateTime::Union{string_fhir, Nothing}
    timingDuration::Union{Duration, Nothing}
    timingPeriod::Union{Period, Nothing}
    timingRange::Union{Range, Nothing}
    timingTiming::Union{Timing, Nothing}
    title::Union{string_fhir, Nothing}
    transform::Union{String, Nothing}
    trigger::Union{Vector{TriggerDefinition}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition_Action} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition_Action} = (:id,:extension,:modifierExtension,:prefix,:_prefix,:title,:_title,:description,:_description,:textEquivalent,:_textEquivalent,:priority,:_priority,:code,:reason,:documentation,:goalId,:_goalId,:subjectCodeableConcept,:subjectReference,:trigger,:condition,:input,:output,:relatedAction,:timingDateTime,:_timingDateTime,:timingAge,:timingPeriod,:timingDuration,:timingRange,:timingTiming,:participant,:type,:groupingBehavior,:_groupingBehavior,:selectionBehavior,:_selectionBehavior,:requiredBehavior,:_requiredBehavior,:precheckBehavior,:_precheckBehavior,:cardinalityBehavior,:_cardinalityBehavior,:definitionCanonical,:_definitionCanonical,:definitionUri,:_definitionUri,:transform,:dynamicValue,:action,)



mutable struct ImplementationGuide_Definition <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    grouping::Union{Vector{ImplementationGuide_Grouping}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    page::Union{ImplementationGuide_Page, Nothing}
    parameter::Union{Vector{ImplementationGuide_Parameter}, Nothing}
    resource::Union{Vector{ImplementationGuide_Resource}, Nothing}
    template::Union{Vector{ImplementationGuide_Template}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide_Definition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide_Definition} = (:id,:extension,:modifierExtension,:grouping,:resource,:page,:parameter,:template,)



mutable struct ObservationDefinition <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _multipleResultsAllowed::Union{Element, Nothing}
    _permittedDataType::Union{Vector{Element}, Nothing}
    _preferredReportName::Union{Element, Nothing}
    abnormalCodedValueSet::Union{Reference, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    criticalCodedValueSet::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    multipleResultsAllowed::Union{Bool, Nothing}
    normalCodedValueSet::Union{Reference, Nothing}
    permittedDataType::Union{Vector{String}, Nothing}
    preferredReportName::Union{string_fhir, Nothing}
    qualifiedInterval::Union{Vector{ObservationDefinition_QualifiedInterval}, Nothing}
    quantitativeDetails::Union{ObservationDefinition_QuantitativeDetails, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
    validCodedValueSet::Union{Reference, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ObservationDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ObservationDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:category,:code,:identifier,:permittedDataType,:_permittedDataType,:multipleResultsAllowed,:_multipleResultsAllowed,:method,:preferredReportName,:_preferredReportName,:quantitativeDetails,:qualifiedInterval,:validCodedValueSet,:normalCodedValueSet,:abnormalCodedValueSet,:criticalCodedValueSet,)



mutable struct MedicinalProduct_Name <: AbstractFHIRType
    _productName::Union{Element, Nothing}
    countryLanguage::Union{Vector{MedicinalProduct_CountryLanguage}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    namePart::Union{Vector{MedicinalProduct_NamePart}, Nothing}
    productName::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct_Name} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct_Name} = (:id,:extension,:modifierExtension,:productName,:_productName,:namePart,:countryLanguage,)



mutable struct MedicationDispense <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _whenHandedOver::Union{Element, Nothing}
    _whenPrepared::Union{Element, Nothing}
    authorizingPrescription::Union{Vector{Reference}, Nothing}
    category::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    context::Union{Reference, Nothing}
    daysSupply::Union{Quantity, Nothing}
    destination::Union{Reference, Nothing}
    detectedIssue::Union{Vector{Reference}, Nothing}
    dosageInstruction::Union{Vector{Dosage}, Nothing}
    eventHistory::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performer::Union{Vector{MedicationDispense_Performer}, Nothing}
    quantity::Union{Quantity, Nothing}
    receiver::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReasonCodeableConcept::Union{CodeableConcept, Nothing}
    statusReasonReference::Union{Reference, Nothing}
    subject::Union{Reference, Nothing}
    substitution::Union{MedicationDispense_Substitution, Nothing}
    supportingInformation::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    whenHandedOver::Union{Union{DateTime, ZonedDateTime}, Nothing}
    whenPrepared::Union{Union{DateTime, ZonedDateTime}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationDispense} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationDispense} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:partOf,:status,:_status,:statusReasonCodeableConcept,:statusReasonReference,:category,:medicationCodeableConcept,:medicationReference,:subject,:context,:supportingInformation,:performer,:location,:authorizingPrescription,:type,:quantity,:daysSupply,:whenPrepared,:_whenPrepared,:whenHandedOver,:_whenHandedOver,:destination,:receiver,:note,:dosageInstruction,:substitution,:detectedIssue,:eventHistory,)



mutable struct List <: AbstractResource
    _date::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    emptyReason::Union{CodeableConcept, Nothing}
    encounter::Union{Reference, Nothing}
    entry::Union{Vector{List_Entry}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    orderedBy::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{Reference, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: List} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: List} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:mode,:_mode,:title,:_title,:code,:subject,:encounter,:date,:_date,:source,:orderedBy,:note,:entry,:emptyReason,)



mutable struct DocumentReference <: AbstractResource
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _docStatus::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authenticator::Union{Reference, Nothing}
    author::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    content::Union{Vector{DocumentReference_Content}, Nothing}
    context::Union{DocumentReference_Context, Nothing}
    custodian::Union{Reference, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    docStatus::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    masterIdentifier::Union{Identifier, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    relatesTo::Union{Vector{DocumentReference_RelatesTo}, Nothing}
    resourceType::Union{String, Nothing}
    securityLabel::Union{Vector{CodeableConcept}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DocumentReference} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DocumentReference} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:masterIdentifier,:identifier,:status,:_status,:docStatus,:_docStatus,:type,:category,:subject,:date,:_date,:author,:authenticator,:custodian,:relatesTo,:description,:_description,:securityLabel,:content,:context,)



mutable struct RiskEvidenceSynthesis_RiskEstimate <: AbstractFHIRType
    _denominatorCount::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _numeratorCount::Union{Element, Nothing}
    _value::Union{Element, Nothing}
    denominatorCount::Union{SafeInt32, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numeratorCount::Union{SafeInt32, Nothing}
    precisionEstimate::Union{Vector{RiskEvidenceSynthesis_PrecisionEstimate}, Nothing}
    type::Union{CodeableConcept, Nothing}
    unitOfMeasure::Union{CodeableConcept, Nothing}
    value::Union{FHIRNumber, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis_RiskEstimate} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis_RiskEstimate} = (:id,:extension,:modifierExtension,:description,:_description,:type,:value,:_value,:unitOfMeasure,:denominatorCount,:_denominatorCount,:numeratorCount,:_numeratorCount,:precisionEstimate,)



mutable struct Location <: AbstractResource
    _alias::Union{Vector{Element}, Nothing}
    _availabilityExceptions::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    address::Union{Address, Nothing}
    alias::Union{Vector{string_fhir}, Nothing}
    availabilityExceptions::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    hoursOfOperation::Union{Vector{Location_HoursOfOperation}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    managingOrganization::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    operationalStatus::Union{Coding, Nothing}
    partOf::Union{Reference, Nothing}
    physicalType::Union{CodeableConcept, Nothing}
    position::Union{Location_Position, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    telecom::Union{Vector{ContactPoint}, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Location} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Location} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:operationalStatus,:name,:_name,:alias,:_alias,:description,:_description,:mode,:_mode,:type,:telecom,:address,:physicalType,:position,:managingOrganization,:partOf,:hoursOfOperation,:availabilityExceptions,:_availabilityExceptions,:endpoint,)



mutable struct SubstanceSpecification_Name <: AbstractFHIRType
    _name::Union{Element, Nothing}
    _preferred::Union{Element, Nothing}
    domain::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    official::Union{Vector{SubstanceSpecification_Official}, Nothing}
    preferred::Union{Bool, Nothing}
    source::Union{Vector{Reference}, Nothing}
    status::Union{CodeableConcept, Nothing}
    synonym::Union{Vector{SubstanceSpecification_Name}, Nothing}
    translation::Union{Vector{SubstanceSpecification_Name}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification_Name} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification_Name} = (:id,:extension,:modifierExtension,:name,:_name,:type,:status,:preferred,:_preferred,:language,:domain,:jurisdiction,:synonym,:translation,:official,:source,)



mutable struct CommunicationRequest <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    about::Union{Vector{Reference}, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    doNotPerform::Union{Bool, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupIdentifier::Union{Identifier, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    medium::Union{Vector{CodeableConcept}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    payload::Union{Vector{CommunicationRequest_Payload}, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    recipient::Union{Vector{Reference}, Nothing}
    replaces::Union{Vector{Reference}, Nothing}
    requester::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    sender::Union{Reference, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CommunicationRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CommunicationRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:replaces,:groupIdentifier,:status,:_status,:statusReason,:category,:priority,:_priority,:doNotPerform,:_doNotPerform,:medium,:subject,:about,:encounter,:payload,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:authoredOn,:_authoredOn,:requester,:recipient,:sender,:reasonCode,:reasonReference,:note,)



mutable struct Claim_Detail <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _sequence::Union{Element, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    subDetail::Union{Vector{Claim_SubDetail}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Detail} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:revenue,:category,:productOrService,:modifier,:programCode,:quantity,:unitPrice,:factor,:_factor,:net,:udi,:subDetail,)



mutable struct TestScript_Operation <: AbstractFHIRType
    _accept::Union{Element, Nothing}
    _contentType::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _destination::Union{Element, Nothing}
    _encodeRequestUrl::Union{Element, Nothing}
    _label::Union{Element, Nothing}
    _method::Union{Element, Nothing}
    _origin::Union{Element, Nothing}
    _params::Union{Element, Nothing}
    _requestId::Union{Element, Nothing}
    _resource::Union{Element, Nothing}
    _responseId::Union{Element, Nothing}
    _sourceId::Union{Element, Nothing}
    _targetId::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    accept::Union{String, Nothing}
    contentType::Union{String, Nothing}
    description::Union{string_fhir, Nothing}
    destination::Union{SafeInt32, Nothing}
    encodeRequestUrl::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    label::Union{string_fhir, Nothing}
    method::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    origin::Union{SafeInt32, Nothing}
    params::Union{string_fhir, Nothing}
    requestHeader::Union{Vector{TestScript_RequestHeader}, Nothing}
    requestId::Union{String, Nothing}
    resource::Union{String, Nothing}
    responseId::Union{String, Nothing}
    sourceId::Union{String, Nothing}
    targetId::Union{String, Nothing}
    type::Union{Coding, Nothing}
    url::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Operation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Operation} = (:id,:extension,:modifierExtension,:type,:resource,:_resource,:label,:_label,:description,:_description,:accept,:_accept,:contentType,:_contentType,:destination,:_destination,:encodeRequestUrl,:_encodeRequestUrl,:method,:_method,:origin,:_origin,:params,:_params,:requestHeader,:requestId,:_requestId,:responseId,:_responseId,:sourceId,:_sourceId,:targetId,:_targetId,:url,:_url,)



mutable struct InsurancePlan_SpecificCost <: AbstractFHIRType
    benefit::Union{Vector{InsurancePlan_Benefit1}, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_SpecificCost} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_SpecificCost} = (:id,:extension,:modifierExtension,:category,:benefit,)



mutable struct Goal <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lifecycleStatus::Union{Element, Nothing}
    _startDate::Union{Element, Nothing}
    _statusDate::Union{Element, Nothing}
    _statusReason::Union{Element, Nothing}
    achievementStatus::Union{CodeableConcept, Nothing}
    addresses::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{CodeableConcept, Nothing}
    expressedBy::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    lifecycleStatus::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    outcomeCode::Union{Vector{CodeableConcept}, Nothing}
    outcomeReference::Union{Vector{Reference}, Nothing}
    priority::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    startCodeableConcept::Union{CodeableConcept, Nothing}
    startDate::Union{string_fhir, Nothing}
    statusDate::Union{Date, Nothing}
    statusReason::Union{string_fhir, Nothing}
    subject::Union{Reference, Nothing}
    target::Union{Vector{Goal_Target}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Goal} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Goal} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:lifecycleStatus,:_lifecycleStatus,:achievementStatus,:category,:priority,:description,:subject,:startDate,:_startDate,:startCodeableConcept,:target,:statusDate,:_statusDate,:statusReason,:_statusReason,:expressedBy,:addresses,:note,:outcomeCode,:outcomeReference,)



mutable struct MedicationRequest <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _doNotPerform::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesCanonical::Union{Vector{Element}, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _reportedBoolean::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    courseOfTherapyType::Union{CodeableConcept, Nothing}
    detectedIssue::Union{Vector{Reference}, Nothing}
    dispenseRequest::Union{MedicationRequest_DispenseRequest, Nothing}
    doNotPerform::Union{Bool, Nothing}
    dosageInstruction::Union{Vector{Dosage}, Nothing}
    encounter::Union{Reference, Nothing}
    eventHistory::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupIdentifier::Union{Identifier, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    insurance::Union{Vector{Reference}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    medicationCodeableConcept::Union{CodeableConcept, Nothing}
    medicationReference::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    performer::Union{Reference, Nothing}
    performerType::Union{CodeableConcept, Nothing}
    priorPrescription::Union{Reference, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    recorder::Union{Reference, Nothing}
    reportedBoolean::Union{Bool, Nothing}
    reportedReference::Union{Reference, Nothing}
    requester::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    statusReason::Union{CodeableConcept, Nothing}
    subject::Union{Reference, Nothing}
    substitution::Union{MedicationRequest_Substitution, Nothing}
    supportingInformation::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:statusReason,:intent,:_intent,:category,:priority,:_priority,:doNotPerform,:_doNotPerform,:reportedBoolean,:_reportedBoolean,:reportedReference,:medicationCodeableConcept,:medicationReference,:subject,:encounter,:supportingInformation,:authoredOn,:_authoredOn,:requester,:performer,:performerType,:recorder,:reasonCode,:reasonReference,:instantiatesCanonical,:_instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:groupIdentifier,:courseOfTherapyType,:insurance,:note,:dosageInstruction,:dispenseRequest,:substitution,:priorPrescription,:detectedIssue,:eventHistory,)



mutable struct Encounter <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    account::Union{Vector{Reference}, Nothing}
    appointment::Union{Vector{Reference}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    class::Union{Coding, Nothing}
    classHistory::Union{Vector{Encounter_ClassHistory}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    diagnosis::Union{Vector{Encounter_Diagnosis}, Nothing}
    episodeOfCare::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    hospitalization::Union{Encounter_Hospitalization, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    length::Union{Duration, Nothing}
    location::Union{Vector{Encounter_Location}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    partOf::Union{Reference, Nothing}
    participant::Union{Vector{Encounter_Participant}, Nothing}
    period::Union{Period, Nothing}
    priority::Union{CodeableConcept, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    serviceProvider::Union{Reference, Nothing}
    serviceType::Union{CodeableConcept, Nothing}
    status::Union{String, Nothing}
    statusHistory::Union{Vector{Encounter_StatusHistory}, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Encounter} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Encounter} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:statusHistory,:class,:classHistory,:type,:serviceType,:priority,:subject,:episodeOfCare,:basedOn,:participant,:appointment,:period,:length,:reasonCode,:reasonReference,:diagnosis,:account,:hospitalization,:location,:serviceProvider,:partOf,)



mutable struct ValueSet_Contains <: AbstractFHIRType
    _abstract::Union{Element, Nothing}
    _code::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    _inactive::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    abstract::Union{Bool, Nothing}
    code::Union{String, Nothing}
    contains::Union{Vector{ValueSet_Contains}, Nothing}
    designation::Union{Vector{ValueSet_Designation}, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    inactive::Union{Bool, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    system::Union{String, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Contains} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Contains} = (:id,:extension,:modifierExtension,:system,:_system,:abstract,:_abstract,:inactive,:_inactive,:version,:_version,:code,:_code,:display,:_display,:designation,:contains,)



mutable struct ExampleScenario_Instance <: AbstractResource
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _resourceId::Union{Element, Nothing}
    _resourceType::Union{Element, Nothing}
    containedInstance::Union{Vector{ExampleScenario_ContainedInstance}, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    resourceId::Union{string_fhir, Nothing}
    resourceType::Union{String, Nothing}
    version::Union{Vector{ExampleScenario_Version}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Instance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Instance} = (:id,:extension,:modifierExtension,:resourceId,:_resourceId,:resourceType,:_resourceType,:name,:_name,:description,:_description,:version,:containedInstance,)



mutable struct Contract_Offer <: AbstractFHIRType
    _linkId::Union{Vector{Element}, Nothing}
    _securityLabelNumber::Union{Vector{Element}, Nothing}
    _text::Union{Element, Nothing}
    answer::Union{Vector{Contract_Answer}, Nothing}
    decision::Union{CodeableConcept, Nothing}
    decisionMode::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    linkId::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    party::Union{Vector{Contract_Party}, Nothing}
    securityLabelNumber::Union{Vector{SafeInt32}, Nothing}
    text::Union{string_fhir, Nothing}
    topic::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Offer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Offer} = (:id,:extension,:modifierExtension,:identifier,:party,:topic,:type,:decision,:decisionMode,:answer,:text,:_text,:linkId,:_linkId,:securityLabelNumber,:_securityLabelNumber,)



mutable struct MedicinalProductManufactured <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    ingredient::Union{Vector{Reference}, Nothing}
    language::Union{String, Nothing}
    manufacturedDoseForm::Union{CodeableConcept, Nothing}
    manufacturer::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    otherCharacteristics::Union{Vector{CodeableConcept}, Nothing}
    physicalCharacteristics::Union{ProdCharacteristic, Nothing}
    quantity::Union{Quantity, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
    unitOfPresentation::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductManufactured} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductManufactured} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:manufacturedDoseForm,:unitOfPresentation,:quantity,:manufacturer,:ingredient,:physicalCharacteristics,:otherCharacteristics,)



mutable struct MessageHeader <: AbstractResource
    _eventUri::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    author::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    definition::Union{String, Nothing}
    destination::Union{Vector{MessageHeader_Destination}, Nothing}
    enterer::Union{Reference, Nothing}
    eventCoding::Union{Coding, Nothing}
    eventUri::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    reason::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    response::Union{MessageHeader_Response, Nothing}
    responsible::Union{Reference, Nothing}
    sender::Union{Reference, Nothing}
    source::Union{MessageHeader_Source, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MessageHeader} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MessageHeader} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:eventCoding,:eventUri,:_eventUri,:destination,:sender,:enterer,:author,:source,:responsible,:reason,:response,:focus,:definition,)



mutable struct SupplyRequest <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _occurrenceDateTime::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    category::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    deliverFrom::Union{Reference, Nothing}
    deliverTo::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    itemCodeableConcept::Union{CodeableConcept, Nothing}
    itemReference::Union{Reference, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    occurrenceDateTime::Union{string_fhir, Nothing}
    occurrencePeriod::Union{Period, Nothing}
    occurrenceTiming::Union{Timing, Nothing}
    parameter::Union{Vector{SupplyRequest_Parameter}, Nothing}
    priority::Union{String, Nothing}
    quantity::Union{Quantity, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    requester::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    supplier::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SupplyRequest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SupplyRequest} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:category,:priority,:_priority,:itemCodeableConcept,:itemReference,:quantity,:parameter,:occurrenceDateTime,:_occurrenceDateTime,:occurrencePeriod,:occurrenceTiming,:authoredOn,:_authoredOn,:requester,:supplier,:reasonCode,:reasonReference,:deliverFrom,:deliverTo,)



mutable struct Bundle_Entry <: AbstractFHIRType
    _fullUrl::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fullUrl::Union{String, Nothing}
    id::Union{string_fhir, Nothing}
    link::Union{Vector{Bundle_Link}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    request::Union{Bundle_Request, Nothing}
    resource::Union{ResourceList, Nothing}
    response::Union{Bundle_Response, Nothing}
    search::Union{Bundle_Search, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle_Entry} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle_Entry} = (:id,:extension,:modifierExtension,:link,:fullUrl,:_fullUrl,:resource,:search,:request,:response,)



mutable struct Consent_Provision <: AbstractFHIRType
    _type::Union{Element, Nothing}
    action::Union{Vector{CodeableConcept}, Nothing}
    actor::Union{Vector{Consent_Actor}, Nothing}
    class::Union{Vector{Coding}, Nothing}
    code::Union{Vector{CodeableConcept}, Nothing}
    data::Union{Vector{Consent_Data}, Nothing}
    dataPeriod::Union{Period, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    provision::Union{Vector{Consent_Provision}, Nothing}
    purpose::Union{Vector{Coding}, Nothing}
    securityLabel::Union{Vector{Coding}, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent_Provision} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent_Provision} = (:id,:extension,:modifierExtension,:type,:_type,:period,:actor,:action,:securityLabel,:purpose,:class,:code,:dataPeriod,:data,:provision,)



mutable struct DiagnosticReport <: AbstractResource
    _conclusion::Union{Element, Nothing}
    _effectiveDateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _issued::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    conclusion::Union{string_fhir, Nothing}
    conclusionCode::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    effectiveDateTime::Union{string_fhir, Nothing}
    effectivePeriod::Union{Period, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    imagingStudy::Union{Vector{Reference}, Nothing}
    implicitRules::Union{String, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    language::Union{String, Nothing}
    media::Union{Vector{DiagnosticReport_Media}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    performer::Union{Vector{Reference}, Nothing}
    presentedForm::Union{Vector{Attachment}, Nothing}
    resourceType::Union{String, Nothing}
    result::Union{Vector{Reference}, Nothing}
    resultsInterpreter::Union{Vector{Reference}, Nothing}
    specimen::Union{Vector{Reference}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DiagnosticReport} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DiagnosticReport} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:status,:_status,:category,:code,:subject,:encounter,:effectiveDateTime,:_effectiveDateTime,:effectivePeriod,:issued,:_issued,:performer,:resultsInterpreter,:specimen,:result,:imagingStudy,:media,:conclusion,:_conclusion,:conclusionCode,:presentedForm,)



mutable struct DeviceMetric <: AbstractResource
    _category::Union{Element, Nothing}
    _color::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _operationalStatus::Union{Element, Nothing}
    calibration::Union{Vector{DeviceMetric_Calibration}, Nothing}
    category::Union{String, Nothing}
    color::Union{String, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    measurementPeriod::Union{Timing, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operationalStatus::Union{String, Nothing}
    parent::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
    unit::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: DeviceMetric} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: DeviceMetric} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:type,:unit,:source,:parent,:operationalStatus,:_operationalStatus,:color,:_color,:category,:_category,:measurementPeriod,:calibration,)



mutable struct SubstanceSpecification <: AbstractResource
    _comment::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    code::Union{Vector{SubstanceSpecification_Code}, Nothing}
    comment::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    domain::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    moiety::Union{Vector{SubstanceSpecification_Moiety}, Nothing}
    molecularWeight::Union{Vector{SubstanceSpecification_MolecularWeight}, Nothing}
    name::Union{Vector{SubstanceSpecification_Name}, Nothing}
    nucleicAcid::Union{Reference, Nothing}
    polymer::Union{Reference, Nothing}
    property::Union{Vector{SubstanceSpecification_Property}, Nothing}
    protein::Union{Reference, Nothing}
    referenceInformation::Union{Reference, Nothing}
    relationship::Union{Vector{SubstanceSpecification_Relationship}, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{Vector{Reference}, Nothing}
    sourceMaterial::Union{Reference, Nothing}
    status::Union{CodeableConcept, Nothing}
    structure::Union{SubstanceSpecification_Structure, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSpecification} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSpecification} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:type,:status,:domain,:description,:_description,:source,:comment,:_comment,:moiety,:property,:referenceInformation,:structure,:code,:name,:molecularWeight,:relationship,:nucleicAcid,:polymer,:protein,:sourceMaterial,)



mutable struct MedicinalProductIngredient_SpecifiedSubstance <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    confidentiality::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{CodeableConcept, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{Vector{MedicinalProductIngredient_Strength}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIngredient_SpecifiedSubstance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIngredient_SpecifiedSubstance} = (:id,:extension,:modifierExtension,:code,:group,:confidentiality,:strength,)



mutable struct ExplanationOfBenefit_Detail1 <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    quantity::Union{Quantity, Nothing}
    subDetail::Union{Vector{ExplanationOfBenefit_SubDetail1}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Detail1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Detail1} = (:id,:extension,:modifierExtension,:productOrService,:modifier,:quantity,:unitPrice,:factor,:_factor,:net,:noteNumber,:_noteNumber,:adjudication,:subDetail,)



mutable struct Contract_Term <: AbstractFHIRType
    _issued::Union{Element, Nothing}
    _text::Union{Element, Nothing}
    action::Union{Vector{Contract_Action}, Nothing}
    applies::Union{Period, Nothing}
    asset::Union{Vector{Contract_Asset}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{Vector{Contract_Term}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Identifier, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    offer::Union{Contract_Offer, Nothing}
    securityLabel::Union{Vector{Contract_SecurityLabel}, Nothing}
    subType::Union{CodeableConcept, Nothing}
    text::Union{string_fhir, Nothing}
    topicCodeableConcept::Union{CodeableConcept, Nothing}
    topicReference::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract_Term} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract_Term} = (:id,:extension,:modifierExtension,:identifier,:issued,:_issued,:applies,:topicCodeableConcept,:topicReference,:type,:subType,:text,:_text,:securityLabel,:offer,:asset,:action,:group,)



mutable struct ImagingStudy <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _numberOfInstances::Union{Element, Nothing}
    _numberOfSeries::Union{Element, Nothing}
    _started::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    encounter::Union{Reference, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    interpreter::Union{Vector{Reference}, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modality::Union{Vector{Coding}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    numberOfInstances::Union{SafeInt32, Nothing}
    numberOfSeries::Union{SafeInt32, Nothing}
    procedureCode::Union{Vector{CodeableConcept}, Nothing}
    procedureReference::Union{Reference, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    referrer::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    series::Union{Vector{ImagingStudy_Series}, Nothing}
    started::Union{Union{DateTime, ZonedDateTime}, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImagingStudy} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImagingStudy} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:modality,:subject,:encounter,:started,:_started,:basedOn,:referrer,:interpreter,:endpoint,:numberOfSeries,:_numberOfSeries,:numberOfInstances,:_numberOfInstances,:procedureReference,:procedureCode,:location,:reasonCode,:reasonReference,:note,:description,:_description,:series,)



mutable struct PlanDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    action::Union{Vector{PlanDefinition_Action}, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    goal::Union{Vector{PlanDefinition_Goal}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    library::Union{Vector{String}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    type::Union{CodeableConcept, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: PlanDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: PlanDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:subtitle,:_subtitle,:type,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:library,:goal,:action,)



mutable struct EffectEvidenceSynthesis <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    certainty::Union{Vector{EffectEvidenceSynthesis_Certainty}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectEstimate::Union{Vector{EffectEvidenceSynthesis_EffectEstimate}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    exposure::Union{Reference, Nothing}
    exposureAlternative::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    outcome::Union{Reference, Nothing}
    population::Union{Reference, Nothing}
    publisher::Union{string_fhir, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    resultsByExposure::Union{Vector{EffectEvidenceSynthesis_ResultsByExposure}, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    sampleSize::Union{EffectEvidenceSynthesis_SampleSize, Nothing}
    status::Union{String, Nothing}
    studyType::Union{CodeableConcept, Nothing}
    synthesisType::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: EffectEvidenceSynthesis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: EffectEvidenceSynthesis} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:note,:useContext,:jurisdiction,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:synthesisType,:studyType,:population,:exposure,:exposureAlternative,:outcome,:sampleSize,:resultsByExposure,:effectEstimate,:certainty,)



mutable struct TestScript_Action1 <: AbstractFHIRType
    assert::Union{TestScript_Assert, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestScript_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Action1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Action1} = (:id,:extension,:modifierExtension,:operation,:assert,)



mutable struct SubstanceNucleicAcid <: AbstractResource
    _areaOfHybridisation::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _numberOfSubunits::Union{Element, Nothing}
    areaOfHybridisation::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfSubunits::Union{SafeInt32, Nothing}
    oligoNucleotideType::Union{CodeableConcept, Nothing}
    resourceType::Union{String, Nothing}
    sequenceType::Union{CodeableConcept, Nothing}
    subunit::Union{Vector{SubstanceNucleicAcid_Subunit}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceNucleicAcid} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceNucleicAcid} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:sequenceType,:numberOfSubunits,:_numberOfSubunits,:areaOfHybridisation,:_areaOfHybridisation,:oligoNucleotideType,:subunit,)



mutable struct ConceptMap_Element <: AbstractFHIRType
    _code::Union{Element, Nothing}
    _display::Union{Element, Nothing}
    code::Union{String, Nothing}
    display::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    target::Union{Vector{ConceptMap_Target}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap_Element} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap_Element} = (:id,:extension,:modifierExtension,:code,:_code,:display,:_display,:target,)



mutable struct Questionnaire <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subjectType::Union{Vector{Element}, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    code::Union{Vector{Coding}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    derivedFrom::Union{Vector{String}, Nothing}
    description::Union{String, Nothing}
    effectivePeriod::Union{Period, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    item::Union{Vector{Questionnaire_Item}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subjectType::Union{Vector{String}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Questionnaire} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Questionnaire} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:derivedFrom,:status,:_status,:experimental,:_experimental,:subjectType,:_subjectType,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:code,:item,)



mutable struct SubstanceSourceMaterial <: AbstractResource
    _geographicalLocation::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _organismName::Union{Element, Nothing}
    _parentSubstanceName::Union{Vector{Element}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    countryOfOrigin::Union{Vector{CodeableConcept}, Nothing}
    developmentStage::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fractionDescription::Union{Vector{SubstanceSourceMaterial_FractionDescription}, Nothing}
    geographicalLocation::Union{Vector{string_fhir}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organism::Union{SubstanceSourceMaterial_Organism, Nothing}
    organismId::Union{Identifier, Nothing}
    organismName::Union{string_fhir, Nothing}
    parentSubstanceId::Union{Vector{Identifier}, Nothing}
    parentSubstanceName::Union{Vector{string_fhir}, Nothing}
    partDescription::Union{Vector{SubstanceSourceMaterial_PartDescription}, Nothing}
    resourceType::Union{String, Nothing}
    sourceMaterialClass::Union{CodeableConcept, Nothing}
    sourceMaterialState::Union{CodeableConcept, Nothing}
    sourceMaterialType::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstanceSourceMaterial} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstanceSourceMaterial} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:sourceMaterialClass,:sourceMaterialType,:sourceMaterialState,:organismId,:organismName,:_organismName,:parentSubstanceId,:parentSubstanceName,:_parentSubstanceName,:countryOfOrigin,:geographicalLocation,:_geographicalLocation,:developmentStage,:fractionDescription,:organism,:partDescription,)



mutable struct MeasureReport_Stratifier <: AbstractFHIRType
    code::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    stratum::Union{Vector{MeasureReport_Stratum}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Stratifier} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Stratifier} = (:id,:extension,:modifierExtension,:code,:stratum,)



mutable struct ValueSet_Include <: AbstractFHIRType
    _system::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    concept::Union{Vector{ValueSet_Concept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    filter::Union{Vector{ValueSet_Filter}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    system::Union{String, Nothing}
    valueSet::Union{Vector{String}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Include} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Include} = (:id,:extension,:modifierExtension,:system,:_system,:version,:_version,:concept,:filter,:valueSet,)



mutable struct RiskEvidenceSynthesis <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    certainty::Union{Vector{RiskEvidenceSynthesis_Certainty}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    exposure::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    outcome::Union{Reference, Nothing}
    population::Union{Reference, Nothing}
    publisher::Union{string_fhir, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    riskEstimate::Union{RiskEvidenceSynthesis_RiskEstimate, Nothing}
    sampleSize::Union{RiskEvidenceSynthesis_SampleSize, Nothing}
    status::Union{String, Nothing}
    studyType::Union{CodeableConcept, Nothing}
    synthesisType::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RiskEvidenceSynthesis} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RiskEvidenceSynthesis} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:note,:useContext,:jurisdiction,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:synthesisType,:studyType,:population,:exposure,:outcome,:sampleSize,:riskEstimate,:certainty,)



mutable struct TestReport_Setup <: AbstractFHIRType
    action::Union{Vector{TestReport_Action}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Setup} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Setup} = (:id,:extension,:modifierExtension,:action,)



mutable struct Bundle <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _timestamp::Union{Element, Nothing}
    _total::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    entry::Union{Vector{Bundle_Entry}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    link::Union{Vector{Bundle_Link}, Nothing}
    meta::Union{Meta, Nothing}
    resourceType::Union{String, Nothing}
    signature::Union{Signature, Nothing}
    timestamp::Union{Union{DateTime, ZonedDateTime}, Nothing}
    total::Union{SafeInt32, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Bundle} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Bundle} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:identifier,:type,:_type,:timestamp,:_timestamp,:total,:_total,:link,:entry,:signature,)



mutable struct SpecimenDefinition <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _timeAspect::Union{Element, Nothing}
    collection::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patientPreparation::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
    timeAspect::Union{string_fhir, Nothing}
    typeCollected::Union{CodeableConcept, Nothing}
    typeTested::Union{Vector{SpecimenDefinition_TypeTested}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SpecimenDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SpecimenDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:typeCollected,:patientPreparation,:timeAspect,:_timeAspect,:collection,:typeTested,)



mutable struct ChargeItemDefinition <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _derivedFromUri::Union{Vector{Element}, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    applicability::Union{Vector{ChargeItemDefinition_Applicability}, Nothing}
    approvalDate::Union{Date, Nothing}
    code::Union{CodeableConcept, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    derivedFromUri::Union{Vector{String}, Nothing}
    description::Union{String, Nothing}
    effectivePeriod::Union{Period, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instance::Union{Vector{Reference}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    partOf::Union{Vector{String}, Nothing}
    propertyGroup::Union{Vector{ChargeItemDefinition_PropertyGroup}, Nothing}
    publisher::Union{string_fhir, Nothing}
    replaces::Union{Vector{String}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ChargeItemDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ChargeItemDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:title,:_title,:derivedFromUri,:_derivedFromUri,:partOf,:replaces,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:code,:instance,:applicability,:propertyGroup,)



mutable struct TestScript_Action2 <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestScript_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Action2} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Action2} = (:id,:extension,:modifierExtension,:operation,)



mutable struct TerminologyCapabilities_CodeSystem <: AbstractFHIRType
    _subsumption::Union{Element, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    subsumption::Union{Bool, Nothing}
    uri::Union{String, Nothing}
    version::Union{Vector{TerminologyCapabilities_Version}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities_CodeSystem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities_CodeSystem} = (:id,:extension,:modifierExtension,:uri,:version,:subsumption,:_subsumption,)



mutable struct GraphDefinition_Link <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    _sliceName::Union{Element, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    max::Union{string_fhir, Nothing}
    min::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    path::Union{string_fhir, Nothing}
    sliceName::Union{string_fhir, Nothing}
    target::Union{Vector{GraphDefinition_Target}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: GraphDefinition_Link} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: GraphDefinition_Link} = (:id,:extension,:modifierExtension,:path,:_path,:sliceName,:_sliceName,:min,:_min,:max,:_max,:description,:_description,:target,)



mutable struct MolecularSequence <: AbstractResource
    _coordinateSystem::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _observedSeq::Union{Element, Nothing}
    _readCoverage::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    coordinateSystem::Union{SafeInt32, Nothing}
    device::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    observedSeq::Union{string_fhir, Nothing}
    patient::Union{Reference, Nothing}
    performer::Union{Reference, Nothing}
    pointer::Union{Vector{Reference}, Nothing}
    quality::Union{Vector{MolecularSequence_Quality}, Nothing}
    quantity::Union{Quantity, Nothing}
    readCoverage::Union{SafeInt32, Nothing}
    referenceSeq::Union{MolecularSequence_ReferenceSeq, Nothing}
    repository::Union{Vector{MolecularSequence_Repository}, Nothing}
    resourceType::Union{String, Nothing}
    specimen::Union{Reference, Nothing}
    structureVariant::Union{Vector{MolecularSequence_StructureVariant}, Nothing}
    text::Union{String, Nothing}
    type::Union{String, Nothing}
    variant::Union{Vector{MolecularSequence_Variant}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MolecularSequence} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MolecularSequence} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:type,:_type,:coordinateSystem,:_coordinateSystem,:patient,:specimen,:device,:performer,:quantity,:referenceSeq,:variant,:observedSeq,:_observedSeq,:quality,:readCoverage,:_readCoverage,:repository,:pointer,:structureVariant,)



mutable struct ClaimResponse_Detail <: AbstractFHIRType
    _detailSequence::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    detailSequence::Union{SafeInt32, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    subDetail::Union{Vector{ClaimResponse_SubDetail}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Detail} = (:id,:extension,:modifierExtension,:detailSequence,:_detailSequence,:noteNumber,:_noteNumber,:adjudication,:subDetail,)



mutable struct CodeSystem <: AbstractResource
    _caseSensitive::Union{Element, Nothing}
    _compositional::Union{Element, Nothing}
    _content::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _count::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _hierarchyMeaning::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    _versionNeeded::Union{Element, Nothing}
    caseSensitive::Union{Bool, Nothing}
    compositional::Union{Bool, Nothing}
    concept::Union{Vector{CodeSystem_Concept}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    content::Union{String, Nothing}
    copyright::Union{String, Nothing}
    count::Union{SafeInt32, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    filter::Union{Vector{CodeSystem_Filter}, Nothing}
    hierarchyMeaning::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    property::Union{Vector{CodeSystem_Property}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    supplements::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    valueSet::Union{String, Nothing}
    version::Union{string_fhir, Nothing}
    versionNeeded::Union{Bool, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CodeSystem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CodeSystem} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:caseSensitive,:_caseSensitive,:valueSet,:hierarchyMeaning,:_hierarchyMeaning,:compositional,:_compositional,:versionNeeded,:_versionNeeded,:content,:_content,:supplements,:count,:_count,:filter,:property,:concept,)



mutable struct QuestionnaireResponse <: AbstractResource
    _authored::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    author::Union{Reference, Nothing}
    authored::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    item::Union{Vector{QuestionnaireResponse_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    questionnaire::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{Reference, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: QuestionnaireResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: QuestionnaireResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:partOf,:questionnaire,:status,:_status,:subject,:encounter,:authored,:_authored,:author,:source,:item,)



mutable struct ElementDefinition <: AbstractFHIRType
    _alias::Union{Vector{Element}, Nothing}
    _comment::Union{Element, Nothing}
    _condition::Union{Vector{Element}, Nothing}
    _contentReference::Union{Element, Nothing}
    _defaultValueBase64Binary::Union{Element, Nothing}
    _defaultValueBoolean::Union{Element, Nothing}
    _defaultValueCanonical::Union{Element, Nothing}
    _defaultValueCode::Union{Element, Nothing}
    _defaultValueDate::Union{Element, Nothing}
    _defaultValueDateTime::Union{Element, Nothing}
    _defaultValueDecimal::Union{Element, Nothing}
    _defaultValueId::Union{Element, Nothing}
    _defaultValueInstant::Union{Element, Nothing}
    _defaultValueInteger::Union{Element, Nothing}
    _defaultValueMarkdown::Union{Element, Nothing}
    _defaultValueOid::Union{Element, Nothing}
    _defaultValuePositiveInt::Union{Element, Nothing}
    _defaultValueString::Union{Element, Nothing}
    _defaultValueTime::Union{Element, Nothing}
    _defaultValueUnsignedInt::Union{Element, Nothing}
    _defaultValueUri::Union{Element, Nothing}
    _defaultValueUrl::Union{Element, Nothing}
    _defaultValueUuid::Union{Element, Nothing}
    _definition::Union{Element, Nothing}
    _fixedBase64Binary::Union{Element, Nothing}
    _fixedBoolean::Union{Element, Nothing}
    _fixedCanonical::Union{Element, Nothing}
    _fixedCode::Union{Element, Nothing}
    _fixedDate::Union{Element, Nothing}
    _fixedDateTime::Union{Element, Nothing}
    _fixedDecimal::Union{Element, Nothing}
    _fixedId::Union{Element, Nothing}
    _fixedInstant::Union{Element, Nothing}
    _fixedInteger::Union{Element, Nothing}
    _fixedMarkdown::Union{Element, Nothing}
    _fixedOid::Union{Element, Nothing}
    _fixedPositiveInt::Union{Element, Nothing}
    _fixedString::Union{Element, Nothing}
    _fixedTime::Union{Element, Nothing}
    _fixedUnsignedInt::Union{Element, Nothing}
    _fixedUri::Union{Element, Nothing}
    _fixedUrl::Union{Element, Nothing}
    _fixedUuid::Union{Element, Nothing}
    _isModifier::Union{Element, Nothing}
    _isModifierReason::Union{Element, Nothing}
    _isSummary::Union{Element, Nothing}
    _label::Union{Element, Nothing}
    _max::Union{Element, Nothing}
    _maxLength::Union{Element, Nothing}
    _maxValueDate::Union{Element, Nothing}
    _maxValueDateTime::Union{Element, Nothing}
    _maxValueDecimal::Union{Element, Nothing}
    _maxValueInstant::Union{Element, Nothing}
    _maxValueInteger::Union{Element, Nothing}
    _maxValuePositiveInt::Union{Element, Nothing}
    _maxValueTime::Union{Element, Nothing}
    _maxValueUnsignedInt::Union{Element, Nothing}
    _meaningWhenMissing::Union{Element, Nothing}
    _min::Union{Element, Nothing}
    _minValueDate::Union{Element, Nothing}
    _minValueDateTime::Union{Element, Nothing}
    _minValueDecimal::Union{Element, Nothing}
    _minValueInstant::Union{Element, Nothing}
    _minValueInteger::Union{Element, Nothing}
    _minValuePositiveInt::Union{Element, Nothing}
    _minValueTime::Union{Element, Nothing}
    _minValueUnsignedInt::Union{Element, Nothing}
    _mustSupport::Union{Element, Nothing}
    _orderMeaning::Union{Element, Nothing}
    _path::Union{Element, Nothing}
    _patternBase64Binary::Union{Element, Nothing}
    _patternBoolean::Union{Element, Nothing}
    _patternCanonical::Union{Element, Nothing}
    _patternCode::Union{Element, Nothing}
    _patternDate::Union{Element, Nothing}
    _patternDateTime::Union{Element, Nothing}
    _patternDecimal::Union{Element, Nothing}
    _patternId::Union{Element, Nothing}
    _patternInstant::Union{Element, Nothing}
    _patternInteger::Union{Element, Nothing}
    _patternMarkdown::Union{Element, Nothing}
    _patternOid::Union{Element, Nothing}
    _patternPositiveInt::Union{Element, Nothing}
    _patternString::Union{Element, Nothing}
    _patternTime::Union{Element, Nothing}
    _patternUnsignedInt::Union{Element, Nothing}
    _patternUri::Union{Element, Nothing}
    _patternUrl::Union{Element, Nothing}
    _patternUuid::Union{Element, Nothing}
    _representation::Union{Vector{Element}, Nothing}
    _requirements::Union{Element, Nothing}
    _short::Union{Element, Nothing}
    _sliceIsConstraining::Union{Element, Nothing}
    _sliceName::Union{Element, Nothing}
    alias::Union{Vector{string_fhir}, Nothing}
    base::Union{ElementDefinition_Base, Nothing}
    binding::Union{ElementDefinition_Binding, Nothing}
    code::Union{Vector{Coding}, Nothing}
    comment::Union{String, Nothing}
    condition::Union{Vector{String}, Nothing}
    constraint::Union{Vector{ElementDefinition_Constraint}, Nothing}
    contentReference::Union{String, Nothing}
    defaultValueAddress::Union{Address, Nothing}
    defaultValueAge::Union{Age, Nothing}
    defaultValueAnnotation::Union{Annotation, Nothing}
    defaultValueAttachment::Union{Attachment, Nothing}
    defaultValueBase64Binary::Union{string_fhir, Nothing}
    defaultValueBoolean::Union{Bool, Nothing}
    defaultValueCanonical::Union{string_fhir, Nothing}
    defaultValueCode::Union{string_fhir, Nothing}
    defaultValueCodeableConcept::Union{CodeableConcept, Nothing}
    defaultValueCoding::Union{Coding, Nothing}
    defaultValueContactDetail::Union{ContactDetail, Nothing}
    defaultValueContactPoint::Union{ContactPoint, Nothing}
    defaultValueContributor::Union{Contributor, Nothing}
    defaultValueCount::Union{Count, Nothing}
    defaultValueDataRequirement::Union{DataRequirement, Nothing}
    defaultValueDate::Union{string_fhir, Nothing}
    defaultValueDateTime::Union{string_fhir, Nothing}
    defaultValueDecimal::Union{FHIRNumber, Nothing}
    defaultValueDistance::Union{Distance, Nothing}
    defaultValueDosage::Union{Dosage, Nothing}
    defaultValueDuration::Union{Duration, Nothing}
    defaultValueExpression::Union{Expression, Nothing}
    defaultValueHumanName::Union{HumanName, Nothing}
    defaultValueId::Union{string_fhir, Nothing}
    defaultValueIdentifier::Union{Identifier, Nothing}
    defaultValueInstant::Union{string_fhir, Nothing}
    defaultValueInteger::Union{FHIRInt32, Nothing}
    defaultValueMarkdown::Union{string_fhir, Nothing}
    defaultValueMeta::Union{Meta, Nothing}
    defaultValueMoney::Union{Money, Nothing}
    defaultValueOid::Union{string_fhir, Nothing}
    defaultValueParameterDefinition::Union{ParameterDefinition, Nothing}
    defaultValuePeriod::Union{Period, Nothing}
    defaultValuePositiveInt::Union{FHIRInt32, Nothing}
    defaultValueQuantity::Union{Quantity, Nothing}
    defaultValueRange::Union{Range, Nothing}
    defaultValueRatio::Union{Ratio, Nothing}
    defaultValueReference::Union{Reference, Nothing}
    defaultValueRelatedArtifact::Union{RelatedArtifact, Nothing}
    defaultValueSampledData::Union{SampledData, Nothing}
    defaultValueSignature::Union{Signature, Nothing}
    defaultValueString::Union{string_fhir, Nothing}
    defaultValueTime::Union{string_fhir, Nothing}
    defaultValueTiming::Union{Timing, Nothing}
    defaultValueTriggerDefinition::Union{TriggerDefinition, Nothing}
    defaultValueUnsignedInt::Union{FHIRInt32, Nothing}
    defaultValueUri::Union{string_fhir, Nothing}
    defaultValueUrl::Union{string_fhir, Nothing}
    defaultValueUsageContext::Union{UsageContext, Nothing}
    defaultValueUuid::Union{string_fhir, Nothing}
    definition::Union{String, Nothing}
    example::Union{Vector{ElementDefinition_Example}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fixedAddress::Union{Address, Nothing}
    fixedAge::Union{Age, Nothing}
    fixedAnnotation::Union{Annotation, Nothing}
    fixedAttachment::Union{Attachment, Nothing}
    fixedBase64Binary::Union{string_fhir, Nothing}
    fixedBoolean::Union{Bool, Nothing}
    fixedCanonical::Union{string_fhir, Nothing}
    fixedCode::Union{string_fhir, Nothing}
    fixedCodeableConcept::Union{CodeableConcept, Nothing}
    fixedCoding::Union{Coding, Nothing}
    fixedContactDetail::Union{ContactDetail, Nothing}
    fixedContactPoint::Union{ContactPoint, Nothing}
    fixedContributor::Union{Contributor, Nothing}
    fixedCount::Union{Count, Nothing}
    fixedDataRequirement::Union{DataRequirement, Nothing}
    fixedDate::Union{string_fhir, Nothing}
    fixedDateTime::Union{string_fhir, Nothing}
    fixedDecimal::Union{FHIRNumber, Nothing}
    fixedDistance::Union{Distance, Nothing}
    fixedDosage::Union{Dosage, Nothing}
    fixedDuration::Union{Duration, Nothing}
    fixedExpression::Union{Expression, Nothing}
    fixedHumanName::Union{HumanName, Nothing}
    fixedId::Union{string_fhir, Nothing}
    fixedIdentifier::Union{Identifier, Nothing}
    fixedInstant::Union{string_fhir, Nothing}
    fixedInteger::Union{FHIRInt32, Nothing}
    fixedMarkdown::Union{string_fhir, Nothing}
    fixedMeta::Union{Meta, Nothing}
    fixedMoney::Union{Money, Nothing}
    fixedOid::Union{string_fhir, Nothing}
    fixedParameterDefinition::Union{ParameterDefinition, Nothing}
    fixedPeriod::Union{Period, Nothing}
    fixedPositiveInt::Union{FHIRInt32, Nothing}
    fixedQuantity::Union{Quantity, Nothing}
    fixedRange::Union{Range, Nothing}
    fixedRatio::Union{Ratio, Nothing}
    fixedReference::Union{Reference, Nothing}
    fixedRelatedArtifact::Union{RelatedArtifact, Nothing}
    fixedSampledData::Union{SampledData, Nothing}
    fixedSignature::Union{Signature, Nothing}
    fixedString::Union{string_fhir, Nothing}
    fixedTime::Union{string_fhir, Nothing}
    fixedTiming::Union{Timing, Nothing}
    fixedTriggerDefinition::Union{TriggerDefinition, Nothing}
    fixedUnsignedInt::Union{FHIRInt32, Nothing}
    fixedUri::Union{string_fhir, Nothing}
    fixedUrl::Union{string_fhir, Nothing}
    fixedUsageContext::Union{UsageContext, Nothing}
    fixedUuid::Union{string_fhir, Nothing}
    id::Union{string_fhir, Nothing}
    isModifier::Union{Bool, Nothing}
    isModifierReason::Union{string_fhir, Nothing}
    isSummary::Union{Bool, Nothing}
    label::Union{string_fhir, Nothing}
    mapping::Union{Vector{ElementDefinition_Mapping}, Nothing}
    max::Union{string_fhir, Nothing}
    maxLength::Union{SafeInt32, Nothing}
    maxValueDate::Union{string_fhir, Nothing}
    maxValueDateTime::Union{string_fhir, Nothing}
    maxValueDecimal::Union{FHIRNumber, Nothing}
    maxValueInstant::Union{string_fhir, Nothing}
    maxValueInteger::Union{FHIRInt32, Nothing}
    maxValuePositiveInt::Union{FHIRInt32, Nothing}
    maxValueQuantity::Union{Quantity, Nothing}
    maxValueTime::Union{string_fhir, Nothing}
    maxValueUnsignedInt::Union{FHIRInt32, Nothing}
    meaningWhenMissing::Union{String, Nothing}
    min::Union{SafeInt32, Nothing}
    minValueDate::Union{string_fhir, Nothing}
    minValueDateTime::Union{string_fhir, Nothing}
    minValueDecimal::Union{FHIRNumber, Nothing}
    minValueInstant::Union{string_fhir, Nothing}
    minValueInteger::Union{FHIRInt32, Nothing}
    minValuePositiveInt::Union{FHIRInt32, Nothing}
    minValueQuantity::Union{Quantity, Nothing}
    minValueTime::Union{string_fhir, Nothing}
    minValueUnsignedInt::Union{FHIRInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    mustSupport::Union{Bool, Nothing}
    orderMeaning::Union{string_fhir, Nothing}
    path::Union{string_fhir, Nothing}
    patternAddress::Union{Address, Nothing}
    patternAge::Union{Age, Nothing}
    patternAnnotation::Union{Annotation, Nothing}
    patternAttachment::Union{Attachment, Nothing}
    patternBase64Binary::Union{string_fhir, Nothing}
    patternBoolean::Union{Bool, Nothing}
    patternCanonical::Union{string_fhir, Nothing}
    patternCode::Union{string_fhir, Nothing}
    patternCodeableConcept::Union{CodeableConcept, Nothing}
    patternCoding::Union{Coding, Nothing}
    patternContactDetail::Union{ContactDetail, Nothing}
    patternContactPoint::Union{ContactPoint, Nothing}
    patternContributor::Union{Contributor, Nothing}
    patternCount::Union{Count, Nothing}
    patternDataRequirement::Union{DataRequirement, Nothing}
    patternDate::Union{string_fhir, Nothing}
    patternDateTime::Union{string_fhir, Nothing}
    patternDecimal::Union{FHIRNumber, Nothing}
    patternDistance::Union{Distance, Nothing}
    patternDosage::Union{Dosage, Nothing}
    patternDuration::Union{Duration, Nothing}
    patternExpression::Union{Expression, Nothing}
    patternHumanName::Union{HumanName, Nothing}
    patternId::Union{string_fhir, Nothing}
    patternIdentifier::Union{Identifier, Nothing}
    patternInstant::Union{string_fhir, Nothing}
    patternInteger::Union{FHIRNumber, Nothing}
    patternMarkdown::Union{string_fhir, Nothing}
    patternMeta::Union{Meta, Nothing}
    patternMoney::Union{Money, Nothing}
    patternOid::Union{string_fhir, Nothing}
    patternParameterDefinition::Union{ParameterDefinition, Nothing}
    patternPeriod::Union{Period, Nothing}
    patternPositiveInt::Union{FHIRNumber, Nothing}
    patternQuantity::Union{Quantity, Nothing}
    patternRange::Union{Range, Nothing}
    patternRatio::Union{Ratio, Nothing}
    patternReference::Union{Reference, Nothing}
    patternRelatedArtifact::Union{RelatedArtifact, Nothing}
    patternSampledData::Union{SampledData, Nothing}
    patternSignature::Union{Signature, Nothing}
    patternString::Union{string_fhir, Nothing}
    patternTime::Union{string_fhir, Nothing}
    patternTiming::Union{Timing, Nothing}
    patternTriggerDefinition::Union{TriggerDefinition, Nothing}
    patternUnsignedInt::Union{FHIRNumber, Nothing}
    patternUri::Union{string_fhir, Nothing}
    patternUrl::Union{string_fhir, Nothing}
    patternUsageContext::Union{UsageContext, Nothing}
    patternUuid::Union{string_fhir, Nothing}
    representation::Union{Vector{String}, Nothing}
    requirements::Union{String, Nothing}
    short::Union{string_fhir, Nothing}
    sliceIsConstraining::Union{Bool, Nothing}
    sliceName::Union{string_fhir, Nothing}
    slicing::Union{ElementDefinition_Slicing, Nothing}
    type::Union{Vector{ElementDefinition_Type}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ElementDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ElementDefinition} = (:id,:extension,:modifierExtension,:path,:_path,:representation,:_representation,:sliceName,:_sliceName,:sliceIsConstraining,:_sliceIsConstraining,:label,:_label,:code,:slicing,:short,:_short,:definition,:_definition,:comment,:_comment,:requirements,:_requirements,:alias,:_alias,:min,:_min,:max,:_max,:base,:contentReference,:_contentReference,:type,:defaultValueBase64Binary,:_defaultValueBase64Binary,:defaultValueBoolean,:_defaultValueBoolean,:defaultValueCanonical,:_defaultValueCanonical,:defaultValueCode,:_defaultValueCode,:defaultValueDate,:_defaultValueDate,:defaultValueDateTime,:_defaultValueDateTime,:defaultValueDecimal,:_defaultValueDecimal,:defaultValueId,:_defaultValueId,:defaultValueInstant,:_defaultValueInstant,:defaultValueInteger,:_defaultValueInteger,:defaultValueMarkdown,:_defaultValueMarkdown,:defaultValueOid,:_defaultValueOid,:defaultValuePositiveInt,:_defaultValuePositiveInt,:defaultValueString,:_defaultValueString,:defaultValueTime,:_defaultValueTime,:defaultValueUnsignedInt,:_defaultValueUnsignedInt,:defaultValueUri,:_defaultValueUri,:defaultValueUrl,:_defaultValueUrl,:defaultValueUuid,:_defaultValueUuid,:defaultValueAddress,:defaultValueAge,:defaultValueAnnotation,:defaultValueAttachment,:defaultValueCodeableConcept,:defaultValueCoding,:defaultValueContactPoint,:defaultValueCount,:defaultValueDistance,:defaultValueDuration,:defaultValueHumanName,:defaultValueIdentifier,:defaultValueMoney,:defaultValuePeriod,:defaultValueQuantity,:defaultValueRange,:defaultValueRatio,:defaultValueReference,:defaultValueSampledData,:defaultValueSignature,:defaultValueTiming,:defaultValueContactDetail,:defaultValueContributor,:defaultValueDataRequirement,:defaultValueExpression,:defaultValueParameterDefinition,:defaultValueRelatedArtifact,:defaultValueTriggerDefinition,:defaultValueUsageContext,:defaultValueDosage,:defaultValueMeta,:meaningWhenMissing,:_meaningWhenMissing,:orderMeaning,:_orderMeaning,:fixedBase64Binary,:_fixedBase64Binary,:fixedBoolean,:_fixedBoolean,:fixedCanonical,:_fixedCanonical,:fixedCode,:_fixedCode,:fixedDate,:_fixedDate,:fixedDateTime,:_fixedDateTime,:fixedDecimal,:_fixedDecimal,:fixedId,:_fixedId,:fixedInstant,:_fixedInstant,:fixedInteger,:_fixedInteger,:fixedMarkdown,:_fixedMarkdown,:fixedOid,:_fixedOid,:fixedPositiveInt,:_fixedPositiveInt,:fixedString,:_fixedString,:fixedTime,:_fixedTime,:fixedUnsignedInt,:_fixedUnsignedInt,:fixedUri,:_fixedUri,:fixedUrl,:_fixedUrl,:fixedUuid,:_fixedUuid,:fixedAddress,:fixedAge,:fixedAnnotation,:fixedAttachment,:fixedCodeableConcept,:fixedCoding,:fixedContactPoint,:fixedCount,:fixedDistance,:fixedDuration,:fixedHumanName,:fixedIdentifier,:fixedMoney,:fixedPeriod,:fixedQuantity,:fixedRange,:fixedRatio,:fixedReference,:fixedSampledData,:fixedSignature,:fixedTiming,:fixedContactDetail,:fixedContributor,:fixedDataRequirement,:fixedExpression,:fixedParameterDefinition,:fixedRelatedArtifact,:fixedTriggerDefinition,:fixedUsageContext,:fixedDosage,:fixedMeta,:patternBase64Binary,:_patternBase64Binary,:patternBoolean,:_patternBoolean,:patternCanonical,:_patternCanonical,:patternCode,:_patternCode,:patternDate,:_patternDate,:patternDateTime,:_patternDateTime,:patternDecimal,:_patternDecimal,:patternId,:_patternId,:patternInstant,:_patternInstant,:patternInteger,:_patternInteger,:patternMarkdown,:_patternMarkdown,:patternOid,:_patternOid,:patternPositiveInt,:_patternPositiveInt,:patternString,:_patternString,:patternTime,:_patternTime,:patternUnsignedInt,:_patternUnsignedInt,:patternUri,:_patternUri,:patternUrl,:_patternUrl,:patternUuid,:_patternUuid,:patternAddress,:patternAge,:patternAnnotation,:patternAttachment,:patternCodeableConcept,:patternCoding,:patternContactPoint,:patternCount,:patternDistance,:patternDuration,:patternHumanName,:patternIdentifier,:patternMoney,:patternPeriod,:patternQuantity,:patternRange,:patternRatio,:patternReference,:patternSampledData,:patternSignature,:patternTiming,:patternContactDetail,:patternContributor,:patternDataRequirement,:patternExpression,:patternParameterDefinition,:patternRelatedArtifact,:patternTriggerDefinition,:patternUsageContext,:patternDosage,:patternMeta,:example,:minValueDate,:_minValueDate,:minValueDateTime,:_minValueDateTime,:minValueInstant,:_minValueInstant,:minValueTime,:_minValueTime,:minValueDecimal,:_minValueDecimal,:minValueInteger,:_minValueInteger,:minValuePositiveInt,:_minValuePositiveInt,:minValueUnsignedInt,:_minValueUnsignedInt,:minValueQuantity,:maxValueDate,:_maxValueDate,:maxValueDateTime,:_maxValueDateTime,:maxValueInstant,:_maxValueInstant,:maxValueTime,:_maxValueTime,:maxValueDecimal,:_maxValueDecimal,:maxValueInteger,:_maxValueInteger,:maxValuePositiveInt,:_maxValuePositiveInt,:maxValueUnsignedInt,:_maxValueUnsignedInt,:maxValueQuantity,:maxLength,:_maxLength,:condition,:_condition,:constraint,:mustSupport,:_mustSupport,:isModifier,:_isModifier,:isModifierReason,:_isModifierReason,:isSummary,:_isSummary,:binding,:mapping,)



mutable struct CoverageEligibilityResponse_Insurance <: AbstractFHIRType
    _inforce::Union{Element, Nothing}
    benefitPeriod::Union{Period, Nothing}
    coverage::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    inforce::Union{Bool, Nothing}
    item::Union{Vector{CoverageEligibilityResponse_Item}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityResponse_Insurance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityResponse_Insurance} = (:id,:extension,:modifierExtension,:coverage,:inforce,:_inforce,:benefitPeriod,:item,)



mutable struct SubstancePolymer_MonomerSet <: AbstractFHIRType
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    ratioType::Union{CodeableConcept, Nothing}
    startingMaterial::Union{Vector{SubstancePolymer_StartingMaterial}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_MonomerSet} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_MonomerSet} = (:id,:extension,:modifierExtension,:ratioType,:startingMaterial,)



mutable struct ValueSet_Expansion <: AbstractFHIRType
    _identifier::Union{Element, Nothing}
    _offset::Union{Element, Nothing}
    _timestamp::Union{Element, Nothing}
    _total::Union{Element, Nothing}
    contains::Union{Vector{ValueSet_Contains}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    offset::Union{SafeInt32, Nothing}
    parameter::Union{Vector{ValueSet_Parameter}, Nothing}
    timestamp::Union{Union{DateTime, ZonedDateTime}, Nothing}
    total::Union{SafeInt32, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Expansion} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Expansion} = (:id,:extension,:modifierExtension,:identifier,:_identifier,:timestamp,:_timestamp,:total,:_total,:offset,:_offset,:parameter,:contains,)



mutable struct InsurancePlan_Plan <: AbstractFHIRType
    coverageArea::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    generalCost::Union{Vector{InsurancePlan_GeneralCost}, Nothing}
    id::Union{string_fhir, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    network::Union{Vector{Reference}, Nothing}
    specificCost::Union{Vector{InsurancePlan_SpecificCost}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan_Plan} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan_Plan} = (:id,:extension,:modifierExtension,:identifier,:type,:coverageArea,:network,:generalCost,:specificCost,)



mutable struct MedicinalProductPackaged <: AbstractResource
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    batchIdentifier::Union{Vector{MedicinalProductPackaged_BatchIdentifier}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    legalStatusOfSupply::Union{CodeableConcept, Nothing}
    manufacturer::Union{Vector{Reference}, Nothing}
    marketingAuthorization::Union{Reference, Nothing}
    marketingStatus::Union{Vector{MarketingStatus}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    packageItem::Union{Vector{MedicinalProductPackaged_PackageItem}, Nothing}
    resourceType::Union{String, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPackaged} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPackaged} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:subject,:description,:_description,:legalStatusOfSupply,:marketingStatus,:marketingAuthorization,:manufacturer,:batchIdentifier,:packageItem,)



mutable struct AuditEvent <: AbstractResource
    _action::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _outcomeDesc::Union{Element, Nothing}
    _recorded::Union{Element, Nothing}
    action::Union{String, Nothing}
    agent::Union{Vector{AuditEvent_Agent}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    entity::Union{Vector{AuditEvent_Entity}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{String, Nothing}
    outcomeDesc::Union{string_fhir, Nothing}
    period::Union{Period, Nothing}
    purposeOfEvent::Union{Vector{CodeableConcept}, Nothing}
    recorded::Union{Union{DateTime, ZonedDateTime}, Nothing}
    resourceType::Union{String, Nothing}
    source::Union{AuditEvent_Source, Nothing}
    subtype::Union{Vector{Coding}, Nothing}
    text::Union{String, Nothing}
    type::Union{Coding, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AuditEvent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AuditEvent} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:type,:subtype,:action,:_action,:period,:recorded,:_recorded,:outcome,:_outcome,:outcomeDesc,:_outcomeDesc,:purposeOfEvent,:agent,:source,:entity,)



mutable struct MedicationKnowledge <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _preparationInstruction::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _synonym::Union{Vector{Element}, Nothing}
    administrationGuidelines::Union{Vector{MedicationKnowledge_AdministrationGuidelines}, Nothing}
    amount::Union{Quantity, Nothing}
    associatedMedication::Union{Vector{Reference}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    contraindication::Union{Vector{Reference}, Nothing}
    cost::Union{Vector{MedicationKnowledge_Cost}, Nothing}
    doseForm::Union{CodeableConcept, Nothing}
    drugCharacteristic::Union{Vector{MedicationKnowledge_DrugCharacteristic}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    ingredient::Union{Vector{MedicationKnowledge_Ingredient}, Nothing}
    intendedRoute::Union{Vector{CodeableConcept}, Nothing}
    kinetics::Union{Vector{MedicationKnowledge_Kinetics}, Nothing}
    language::Union{String, Nothing}
    manufacturer::Union{Reference, Nothing}
    medicineClassification::Union{Vector{MedicationKnowledge_MedicineClassification}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    monitoringProgram::Union{Vector{MedicationKnowledge_MonitoringProgram}, Nothing}
    monograph::Union{Vector{MedicationKnowledge_Monograph}, Nothing}
    packaging::Union{MedicationKnowledge_Packaging, Nothing}
    preparationInstruction::Union{String, Nothing}
    productType::Union{Vector{CodeableConcept}, Nothing}
    regulatory::Union{Vector{MedicationKnowledge_Regulatory}, Nothing}
    relatedMedicationKnowledge::Union{Vector{MedicationKnowledge_RelatedMedicationKnowledge}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    synonym::Union{Vector{string_fhir}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicationKnowledge} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicationKnowledge} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:code,:status,:_status,:manufacturer,:doseForm,:amount,:synonym,:_synonym,:relatedMedicationKnowledge,:associatedMedication,:productType,:monograph,:ingredient,:preparationInstruction,:_preparationInstruction,:intendedRoute,:cost,:monitoringProgram,:administrationGuidelines,:medicineClassification,:packaging,:drugCharacteristic,:contraindication,:regulatory,:kinetics,)



mutable struct StructureMap_Rule <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    dependent::Union{Vector{StructureMap_Dependent}, Nothing}
    documentation::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
    rule::Union{Vector{StructureMap_Rule}, Nothing}
    source::Union{Vector{StructureMap_Source}, Nothing}
    target::Union{Vector{StructureMap_Target}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Rule} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Rule} = (:id,:extension,:modifierExtension,:name,:_name,:source,:target,:rule,:dependent,:documentation,:_documentation,)



mutable struct VisionPrescription <: AbstractResource
    _created::Union{Element, Nothing}
    _dateWritten::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    dateWritten::Union{Union{DateTime, ZonedDateTime}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    lensSpecification::Union{Vector{VisionPrescription_LensSpecification}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    prescriber::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: VisionPrescription} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: VisionPrescription} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:created,:_created,:patient,:encounter,:dateWritten,:_dateWritten,:prescriber,:lensSpecification,)



mutable struct MedicinalProductIngredient_Substance <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    strength::Union{Vector{MedicinalProductIngredient_Strength}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIngredient_Substance} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIngredient_Substance} = (:id,:extension,:modifierExtension,:code,:strength,)



mutable struct Consent <: AbstractResource
    _dateTime::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    dateTime::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    organization::Union{Vector{Reference}, Nothing}
    patient::Union{Reference, Nothing}
    performer::Union{Vector{Reference}, Nothing}
    policy::Union{Vector{Consent_Policy}, Nothing}
    policyRule::Union{CodeableConcept, Nothing}
    provision::Union{Consent_Provision, Nothing}
    resourceType::Union{String, Nothing}
    scope::Union{CodeableConcept, Nothing}
    sourceAttachment::Union{Attachment, Nothing}
    sourceReference::Union{Reference, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    verification::Union{Vector{Consent_Verification}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Consent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Consent} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:scope,:category,:patient,:dateTime,:_dateTime,:performer,:organization,:sourceAttachment,:sourceReference,:policy,:policyRule,:verification,:provision,)



mutable struct TestScript_Action <: AbstractFHIRType
    assert::Union{TestScript_Assert, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{TestScript_Operation, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Action} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Action} = (:id,:extension,:modifierExtension,:operation,:assert,)



mutable struct ClaimResponse_Detail1 <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    quantity::Union{Quantity, Nothing}
    subDetail::Union{Vector{ClaimResponse_SubDetail1}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Detail1} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Detail1} = (:id,:extension,:modifierExtension,:productOrService,:modifier,:quantity,:unitPrice,:factor,:_factor,:net,:noteNumber,:_noteNumber,:adjudication,:subDetail,)



mutable struct MedicinalProductPharmaceutical_RouteOfAdministration <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    firstDose::Union{Quantity, Nothing}
    id::Union{string_fhir, Nothing}
    maxDosePerDay::Union{Quantity, Nothing}
    maxDosePerTreatmentPeriod::Union{Ratio, Nothing}
    maxSingleDose::Union{Quantity, Nothing}
    maxTreatmentPeriod::Union{Duration, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    targetSpecies::Union{Vector{MedicinalProductPharmaceutical_TargetSpecies}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPharmaceutical_RouteOfAdministration} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPharmaceutical_RouteOfAdministration} = (:id,:extension,:modifierExtension,:code,:firstDose,:maxSingleDose,:maxDosePerDay,:maxDosePerTreatmentPeriod,:maxTreatmentPeriod,:targetSpecies,)



mutable struct ImplementationGuide <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _fhirVersion::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _license::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _packageId::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    definition::Union{ImplementationGuide_Definition, Nothing}
    dependsOn::Union{Vector{ImplementationGuide_DependsOn}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fhirVersion::Union{Vector{String}, Nothing}
    global::Union{Vector{ImplementationGuide_Global}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    license::Union{String, Nothing}
    manifest::Union{ImplementationGuide_Manifest, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    packageId::Union{String, Nothing}
    publisher::Union{string_fhir, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImplementationGuide} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImplementationGuide} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:copyright,:_copyright,:packageId,:_packageId,:license,:_license,:fhirVersion,:_fhirVersion,:dependsOn,:global,:definition,:manifest,)



mutable struct ExplanationOfBenefit_Detail <: AbstractFHIRType
    _factor::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    _sequence::Union{Element, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    category::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    subDetail::Union{Vector{ExplanationOfBenefit_SubDetail}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Detail} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Detail} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:revenue,:category,:productOrService,:modifier,:programCode,:quantity,:unitPrice,:factor,:_factor,:net,:udi,:noteNumber,:_noteNumber,:adjudication,:subDetail,)



mutable struct OperationDefinition <: AbstractResource
    _affectsState::Union{Element, Nothing}
    _code::Union{Element, Nothing}
    _comment::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instance::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _resource::Union{Vector{Element}, Nothing}
    _status::Union{Element, Nothing}
    _system::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    affectsState::Union{Bool, Nothing}
    base::Union{String, Nothing}
    code::Union{String, Nothing}
    comment::Union{String, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    inputProfile::Union{String, Nothing}
    instance::Union{Bool, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    outputProfile::Union{String, Nothing}
    overload::Union{Vector{OperationDefinition_Overload}, Nothing}
    parameter::Union{Vector{OperationDefinition_Parameter}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resource::Union{Vector{String}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    system::Union{Bool, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    type::Union{Bool, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: OperationDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: OperationDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:kind,:_kind,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:affectsState,:_affectsState,:code,:_code,:comment,:_comment,:base,:resource,:_resource,:system,:_system,:type,:_type,:instance,:_instance,:inputProfile,:outputProfile,:parameter,:overload,)



mutable struct RequestGroup <: AbstractResource
    _authoredOn::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesCanonical::Union{Vector{Element}, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _priority::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    action::Union{Vector{RequestGroup_Action}, Nothing}
    author::Union{Reference, Nothing}
    authoredOn::Union{Union{DateTime, ZonedDateTime}, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    code::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    groupIdentifier::Union{Identifier, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    priority::Union{String, Nothing}
    reasonCode::Union{Vector{CodeableConcept}, Nothing}
    reasonReference::Union{Vector{Reference}, Nothing}
    replaces::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: RequestGroup} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: RequestGroup} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:_instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:replaces,:groupIdentifier,:status,:_status,:intent,:_intent,:priority,:_priority,:code,:subject,:encounter,:authoredOn,:_authoredOn,:author,:reasonCode,:reasonReference,:note,:action,)



mutable struct Invoice <: AbstractResource
    _cancelledReason::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _paymentTerms::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    account::Union{Reference, Nothing}
    cancelledReason::Union{string_fhir, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    issuer::Union{Reference, Nothing}
    language::Union{String, Nothing}
    lineItem::Union{Vector{Invoice_LineItem}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    participant::Union{Vector{Invoice_Participant}, Nothing}
    paymentTerms::Union{String, Nothing}
    recipient::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    totalGross::Union{Money, Nothing}
    totalNet::Union{Money, Nothing}
    totalPriceComponent::Union{Vector{Invoice_PriceComponent}, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Invoice} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Invoice} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:cancelledReason,:_cancelledReason,:type,:subject,:recipient,:date,:_date,:participant,:issuer,:account,:lineItem,:totalPriceComponent,:totalNet,:totalGross,:paymentTerms,:_paymentTerms,:note,)



mutable struct AdverseEvent <: AbstractResource
    _actuality::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _detected::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _recordedDate::Union{Element, Nothing}
    actuality::Union{String, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    contributor::Union{Vector{Reference}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    detected::Union{Union{DateTime, ZonedDateTime}, Nothing}
    encounter::Union{Reference, Nothing}
    event::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    location::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{CodeableConcept, Nothing}
    recordedDate::Union{Union{DateTime, ZonedDateTime}, Nothing}
    recorder::Union{Reference, Nothing}
    referenceDocument::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    resultingCondition::Union{Vector{Reference}, Nothing}
    seriousness::Union{CodeableConcept, Nothing}
    severity::Union{CodeableConcept, Nothing}
    study::Union{Vector{Reference}, Nothing}
    subject::Union{Reference, Nothing}
    subjectMedicalHistory::Union{Vector{Reference}, Nothing}
    suspectEntity::Union{Vector{AdverseEvent_SuspectEntity}, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: AdverseEvent} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: AdverseEvent} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:actuality,:_actuality,:category,:event,:subject,:encounter,:date,:_date,:detected,:_detected,:recordedDate,:_recordedDate,:resultingCondition,:location,:seriousness,:severity,:outcome,:recorder,:contributor,:suspectEntity,:subjectMedicalHistory,:referenceDocument,:study,)



mutable struct TestReport_Teardown <: AbstractFHIRType
    action::Union{Vector{TestReport_Action2}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Teardown} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Teardown} = (:id,:extension,:modifierExtension,:action,)



mutable struct Claim_Item <: AbstractFHIRType
    _careTeamSequence::Union{Vector{Element}, Nothing}
    _diagnosisSequence::Union{Vector{Element}, Nothing}
    _factor::Union{Element, Nothing}
    _informationSequence::Union{Vector{Element}, Nothing}
    _procedureSequence::Union{Vector{Element}, Nothing}
    _sequence::Union{Element, Nothing}
    _servicedDate::Union{Element, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    careTeamSequence::Union{Vector{SafeInt32}, Nothing}
    category::Union{CodeableConcept, Nothing}
    detail::Union{Vector{Claim_Detail}, Nothing}
    diagnosisSequence::Union{Vector{SafeInt32}, Nothing}
    encounter::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    informationSequence::Union{Vector{SafeInt32}, Nothing}
    locationAddress::Union{Address, Nothing}
    locationCodeableConcept::Union{CodeableConcept, Nothing}
    locationReference::Union{Reference, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    procedureSequence::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    subSite::Union{Vector{CodeableConcept}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim_Item} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:careTeamSequence,:_careTeamSequence,:diagnosisSequence,:_diagnosisSequence,:procedureSequence,:_procedureSequence,:informationSequence,:_informationSequence,:revenue,:category,:productOrService,:modifier,:programCode,:servicedDate,:_servicedDate,:servicedPeriod,:locationCodeableConcept,:locationAddress,:locationReference,:quantity,:unitPrice,:factor,:_factor,:net,:udi,:bodySite,:subSite,:encounter,:detail,)



mutable struct TestReport_Test <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    action::Union{Vector{TestReport_Action1}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport_Test} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport_Test} = (:id,:extension,:modifierExtension,:name,:_name,:description,:_description,:action,)



mutable struct CarePlan <: AbstractResource
    _created::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Vector{Element}, Nothing}
    _intent::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    activity::Union{Vector{CarePlan_Activity}, Nothing}
    addresses::Union{Vector{Reference}, Nothing}
    author::Union{Reference, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    careTeam::Union{Vector{Reference}, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    contributor::Union{Vector{Reference}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{string_fhir, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    goal::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Vector{String}, Nothing}
    instantiatesUri::Union{Vector{String}, Nothing}
    intent::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    period::Union{Period, Nothing}
    replaces::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    supportingInfo::Union{Vector{Reference}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CarePlan} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CarePlan} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:basedOn,:replaces,:partOf,:status,:_status,:intent,:_intent,:category,:title,:_title,:description,:_description,:subject,:encounter,:period,:created,:_created,:author,:contributor,:careTeam,:addresses,:supportingInfo,:goal,:activity,:note,)



mutable struct ImmunizationRecommendation <: AbstractResource
    _date::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    authority::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    patient::Union{Reference, Nothing}
    recommendation::Union{Vector{ImmunizationRecommendation_Recommendation}, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ImmunizationRecommendation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ImmunizationRecommendation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:patient,:date,:_date,:authority,:recommendation,)



mutable struct SubstancePolymer_RepeatUnit <: AbstractFHIRType
    _repeatUnit::Union{Element, Nothing}
    amount::Union{SubstanceAmount, Nothing}
    degreeOfPolymerisation::Union{Vector{SubstancePolymer_DegreeOfPolymerisation}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    orientationOfPolymerisation::Union{CodeableConcept, Nothing}
    repeatUnit::Union{string_fhir, Nothing}
    structuralRepresentation::Union{Vector{SubstancePolymer_StructuralRepresentation}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_RepeatUnit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_RepeatUnit} = (:id,:extension,:modifierExtension,:orientationOfPolymerisation,:repeatUnit,:_repeatUnit,:amount,:degreeOfPolymerisation,:structuralRepresentation,)



mutable struct Measure_Group <: AbstractFHIRType
    _description::Union{Element, Nothing}
    code::Union{CodeableConcept, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    population::Union{Vector{Measure_Population}, Nothing}
    stratifier::Union{Vector{Measure_Stratifier}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure_Group} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure_Group} = (:id,:extension,:modifierExtension,:code,:description,:_description,:population,:stratifier,)



mutable struct CapabilityStatement_Rest <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _mode::Union{Element, Nothing}
    compartment::Union{Vector{String}, Nothing}
    documentation::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    interaction::Union{Vector{CapabilityStatement_Interaction1}, Nothing}
    mode::Union{String, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{Vector{CapabilityStatement_Operation}, Nothing}
    resource::Union{Vector{CapabilityStatement_Resource}, Nothing}
    searchParam::Union{Vector{CapabilityStatement_SearchParam}, Nothing}
    security::Union{CapabilityStatement_Security, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement_Rest} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement_Rest} = (:id,:extension,:modifierExtension,:mode,:_mode,:documentation,:_documentation,:security,:resource,:interaction,:searchParam,:operation,:compartment,)



mutable struct ExampleScenario_Step <: AbstractFHIRType
    _pause::Union{Element, Nothing}
    alternative::Union{Vector{ExampleScenario_Alternative}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    operation::Union{ExampleScenario_Operation, Nothing}
    pause::Union{Bool, Nothing}
    process::Union{Vector{ExampleScenario_Process}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Step} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Step} = (:id,:extension,:modifierExtension,:process,:pause,:_pause,:operation,:alternative,)



mutable struct MedicinalProduct <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _specialMeasures::Union{Vector{Element}, Nothing}
    additionalMonitoringIndicator::Union{CodeableConcept, Nothing}
    attachedDocument::Union{Vector{Reference}, Nothing}
    clinicalTrial::Union{Vector{Reference}, Nothing}
    combinedPharmaceuticalDoseForm::Union{CodeableConcept, Nothing}
    contact::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    crossReference::Union{Vector{Identifier}, Nothing}
    domain::Union{Coding, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    legalStatusOfSupply::Union{CodeableConcept, Nothing}
    manufacturingBusinessOperation::Union{Vector{MedicinalProduct_ManufacturingBusinessOperation}, Nothing}
    marketingStatus::Union{Vector{MarketingStatus}, Nothing}
    masterFile::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{Vector{MedicinalProduct_Name}, Nothing}
    packagedMedicinalProduct::Union{Vector{Reference}, Nothing}
    paediatricUseIndicator::Union{CodeableConcept, Nothing}
    pharmaceuticalProduct::Union{Vector{Reference}, Nothing}
    productClassification::Union{Vector{CodeableConcept}, Nothing}
    resourceType::Union{String, Nothing}
    specialDesignation::Union{Vector{MedicinalProduct_SpecialDesignation}, Nothing}
    specialMeasures::Union{Vector{string_fhir}, Nothing}
    text::Union{String, Nothing}
    type::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProduct} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProduct} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:type,:domain,:combinedPharmaceuticalDoseForm,:legalStatusOfSupply,:additionalMonitoringIndicator,:specialMeasures,:_specialMeasures,:paediatricUseIndicator,:productClassification,:marketingStatus,:pharmaceuticalProduct,:packagedMedicinalProduct,:attachedDocument,:masterFile,:contact,:clinicalTrial,:name,:crossReference,:manufacturingBusinessOperation,:specialDesignation,)



mutable struct Observation <: AbstractResource
    _effectiveDateTime::Union{Element, Nothing}
    _effectiveInstant::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _issued::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _valueBoolean::Union{Element, Nothing}
    _valueDateTime::Union{Element, Nothing}
    _valueInteger::Union{Element, Nothing}
    _valueString::Union{Element, Nothing}
    _valueTime::Union{Element, Nothing}
    basedOn::Union{Vector{Reference}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    category::Union{Vector{CodeableConcept}, Nothing}
    code::Union{CodeableConcept, Nothing}
    component::Union{Vector{Observation_Component}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    dataAbsentReason::Union{CodeableConcept, Nothing}
    derivedFrom::Union{Vector{Reference}, Nothing}
    device::Union{Reference, Nothing}
    effectiveDateTime::Union{string_fhir, Nothing}
    effectiveInstant::Union{string_fhir, Nothing}
    effectivePeriod::Union{Period, Nothing}
    effectiveTiming::Union{Timing, Nothing}
    encounter::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    focus::Union{Vector{Reference}, Nothing}
    hasMember::Union{Vector{Reference}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    interpretation::Union{Vector{CodeableConcept}, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    method::Union{CodeableConcept, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    note::Union{Vector{Annotation}, Nothing}
    partOf::Union{Vector{Reference}, Nothing}
    performer::Union{Vector{Reference}, Nothing}
    referenceRange::Union{Vector{Observation_ReferenceRange}, Nothing}
    resourceType::Union{String, Nothing}
    specimen::Union{Reference, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    valueBoolean::Union{Bool, Nothing}
    valueCodeableConcept::Union{CodeableConcept, Nothing}
    valueDateTime::Union{string_fhir, Nothing}
    valueInteger::Union{FHIRInt32, Nothing}
    valuePeriod::Union{Period, Nothing}
    valueQuantity::Union{Quantity, Nothing}
    valueRange::Union{Range, Nothing}
    valueRatio::Union{Ratio, Nothing}
    valueSampledData::Union{SampledData, Nothing}
    valueString::Union{string_fhir, Nothing}
    valueTime::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Observation} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Observation} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:basedOn,:partOf,:status,:_status,:category,:code,:subject,:focus,:encounter,:effectiveDateTime,:_effectiveDateTime,:effectivePeriod,:effectiveTiming,:effectiveInstant,:_effectiveInstant,:issued,:_issued,:performer,:valueQuantity,:valueCodeableConcept,:valueString,:_valueString,:valueBoolean,:_valueBoolean,:valueInteger,:_valueInteger,:valueRange,:valueRatio,:valueSampledData,:valueTime,:_valueTime,:valueDateTime,:_valueDateTime,:valuePeriod,:dataAbsentReason,:interpretation,:note,:bodySite,:method,:specimen,:device,:referenceRange,:hasMember,:derivedFrom,:component,)



mutable struct TestReport <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _issued::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _result::Union{Element, Nothing}
    _score::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _tester::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    participant::Union{Vector{TestReport_Participant}, Nothing}
    resourceType::Union{String, Nothing}
    result::Union{String, Nothing}
    score::Union{FHIRNumber, Nothing}
    setup::Union{TestReport_Setup, Nothing}
    status::Union{String, Nothing}
    teardown::Union{TestReport_Teardown, Nothing}
    test::Union{Vector{TestReport_Test}, Nothing}
    testScript::Union{Reference, Nothing}
    tester::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestReport} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestReport} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:name,:_name,:status,:_status,:testScript,:result,:_result,:score,:_score,:tester,:_tester,:issued,:_issued,:participant,:setup,:test,:teardown,)



mutable struct MedicinalProductIngredient <: AbstractResource
    _allergenicIndicator::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    allergenicIndicator::Union{Bool, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    manufacturer::Union{Vector{Reference}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    role::Union{CodeableConcept, Nothing}
    specifiedSubstance::Union{Vector{MedicinalProductIngredient_SpecifiedSubstance}, Nothing}
    substance::Union{MedicinalProductIngredient_Substance, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductIngredient} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductIngredient} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:role,:allergenicIndicator,:_allergenicIndicator,:manufacturer,:specifiedSubstance,:substance,)



mutable struct StructureDefinition_Snapshot <: AbstractFHIRType
    element::Union{Vector{ElementDefinition}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureDefinition_Snapshot} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureDefinition_Snapshot} = (:id,:extension,:modifierExtension,:element,)



mutable struct ValueSet_Compose <: AbstractFHIRType
    _inactive::Union{Element, Nothing}
    _lockedDate::Union{Element, Nothing}
    exclude::Union{Vector{ValueSet_Include}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    inactive::Union{Bool, Nothing}
    include::Union{Vector{ValueSet_Include}, Nothing}
    lockedDate::Union{Date, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet_Compose} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet_Compose} = (:id,:extension,:modifierExtension,:lockedDate,:_lockedDate,:inactive,:_inactive,:include,:exclude,)



mutable struct Contract <: AbstractResource
    _alias::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _instantiatesUri::Union{Element, Nothing}
    _issued::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    alias::Union{Vector{string_fhir}, Nothing}
    applies::Union{Period, Nothing}
    author::Union{Reference, Nothing}
    authority::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    contentDefinition::Union{Contract_ContentDefinition, Nothing}
    contentDerivative::Union{CodeableConcept, Nothing}
    domain::Union{Vector{Reference}, Nothing}
    expirationType::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    friendly::Union{Vector{Contract_Friendly}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instantiatesCanonical::Union{Reference, Nothing}
    instantiatesUri::Union{String, Nothing}
    issued::Union{Union{DateTime, ZonedDateTime}, Nothing}
    language::Union{String, Nothing}
    legal::Union{Vector{Contract_Legal}, Nothing}
    legalState::Union{CodeableConcept, Nothing}
    legallyBindingAttachment::Union{Attachment, Nothing}
    legallyBindingReference::Union{Reference, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    relevantHistory::Union{Vector{Reference}, Nothing}
    resourceType::Union{String, Nothing}
    rule::Union{Vector{Contract_Rule}, Nothing}
    scope::Union{CodeableConcept, Nothing}
    signer::Union{Vector{Contract_Signer}, Nothing}
    site::Union{Vector{Reference}, Nothing}
    status::Union{String, Nothing}
    subType::Union{Vector{CodeableConcept}, Nothing}
    subject::Union{Vector{Reference}, Nothing}
    subtitle::Union{string_fhir, Nothing}
    supportingInfo::Union{Vector{Reference}, Nothing}
    term::Union{Vector{Contract_Term}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topicCodeableConcept::Union{CodeableConcept, Nothing}
    topicReference::Union{Reference, Nothing}
    type::Union{CodeableConcept, Nothing}
    url::Union{String, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Contract} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Contract} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:url,:_url,:version,:_version,:status,:_status,:legalState,:instantiatesCanonical,:instantiatesUri,:_instantiatesUri,:contentDerivative,:issued,:_issued,:applies,:expirationType,:subject,:authority,:domain,:site,:name,:_name,:title,:_title,:subtitle,:_subtitle,:alias,:_alias,:author,:scope,:topicCodeableConcept,:topicReference,:type,:subType,:contentDefinition,:term,:supportingInfo,:relevantHistory,:signer,:friendly,:legal,:rule,:legallyBindingAttachment,:legallyBindingReference,)



mutable struct TerminologyCapabilities <: AbstractResource
    _codeSearch::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lockedDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    closure::Union{TerminologyCapabilities_Closure, Nothing}
    codeSearch::Union{String, Nothing}
    codeSystem::Union{Vector{TerminologyCapabilities_CodeSystem}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    expansion::Union{TerminologyCapabilities_Expansion, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implementation::Union{TerminologyCapabilities_Implementation, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    lockedDate::Union{Bool, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    software::Union{TerminologyCapabilities_Software, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    translation::Union{TerminologyCapabilities_Translation, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    validateCode::Union{TerminologyCapabilities_ValidateCode, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TerminologyCapabilities} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TerminologyCapabilities} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:kind,:_kind,:software,:implementation,:lockedDate,:_lockedDate,:codeSystem,:expansion,:codeSearch,:_codeSearch,:validateCode,:translation,:closure,)



mutable struct InsurancePlan <: AbstractResource
    _alias::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    administeredBy::Union{Reference, Nothing}
    alias::Union{Vector{string_fhir}, Nothing}
    contact::Union{Vector{InsurancePlan_Contact}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    coverage::Union{Vector{InsurancePlan_Coverage}, Nothing}
    coverageArea::Union{Vector{Reference}, Nothing}
    endpoint::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    network::Union{Vector{Reference}, Nothing}
    ownedBy::Union{Reference, Nothing}
    period::Union{Period, Nothing}
    plan::Union{Vector{InsurancePlan_Plan}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: InsurancePlan} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: InsurancePlan} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:name,:_name,:alias,:_alias,:period,:ownedBy,:administeredBy,:coverageArea,:contact,:endpoint,:network,:coverage,:plan,)



mutable struct Measure <: AbstractResource
    _approvalDate::Union{Element, Nothing}
    _clinicalRecommendationStatement::Union{Element, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _definition::Union{Vector{Element}, Nothing}
    _description::Union{Element, Nothing}
    _disclaimer::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _guidance::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _lastReviewDate::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _rateAggregation::Union{Element, Nothing}
    _rationale::Union{Element, Nothing}
    _riskAdjustment::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _subtitle::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _usage::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    approvalDate::Union{Date, Nothing}
    author::Union{Vector{ContactDetail}, Nothing}
    clinicalRecommendationStatement::Union{String, Nothing}
    compositeScoring::Union{CodeableConcept, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    definition::Union{Vector{String}, Nothing}
    description::Union{String, Nothing}
    disclaimer::Union{String, Nothing}
    editor::Union{Vector{ContactDetail}, Nothing}
    effectivePeriod::Union{Period, Nothing}
    endorser::Union{Vector{ContactDetail}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{Vector{Measure_Group}, Nothing}
    guidance::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    improvementNotation::Union{CodeableConcept, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    lastReviewDate::Union{Date, Nothing}
    library::Union{Vector{String}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    rateAggregation::Union{string_fhir, Nothing}
    rationale::Union{String, Nothing}
    relatedArtifact::Union{Vector{RelatedArtifact}, Nothing}
    resourceType::Union{String, Nothing}
    reviewer::Union{Vector{ContactDetail}, Nothing}
    riskAdjustment::Union{string_fhir, Nothing}
    scoring::Union{CodeableConcept, Nothing}
    status::Union{String, Nothing}
    subjectCodeableConcept::Union{CodeableConcept, Nothing}
    subjectReference::Union{Reference, Nothing}
    subtitle::Union{string_fhir, Nothing}
    supplementalData::Union{Vector{Measure_SupplementalData}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    topic::Union{Vector{CodeableConcept}, Nothing}
    type::Union{Vector{CodeableConcept}, Nothing}
    url::Union{String, Nothing}
    usage::Union{string_fhir, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Measure} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Measure} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:subtitle,:_subtitle,:status,:_status,:experimental,:_experimental,:subjectCodeableConcept,:subjectReference,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:usage,:_usage,:copyright,:_copyright,:approvalDate,:_approvalDate,:lastReviewDate,:_lastReviewDate,:effectivePeriod,:topic,:author,:editor,:reviewer,:endorser,:relatedArtifact,:library,:disclaimer,:_disclaimer,:scoring,:compositeScoring,:type,:riskAdjustment,:_riskAdjustment,:rateAggregation,:_rateAggregation,:rationale,:_rationale,:clinicalRecommendationStatement,:_clinicalRecommendationStatement,:improvementNotation,:definition,:_definition,:guidance,:_guidance,:group,:supplementalData,)



mutable struct CoverageEligibilityResponse <: AbstractResource
    _created::Union{Element, Nothing}
    _disposition::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _preAuthRef::Union{Element, Nothing}
    _purpose::Union{Vector{Element}, Nothing}
    _servicedDate::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    disposition::Union{string_fhir, Nothing}
    error::Union{Vector{CoverageEligibilityResponse_Error}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    form::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurance::Union{Vector{CoverageEligibilityResponse_Insurance}, Nothing}
    insurer::Union{Reference, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{String, Nothing}
    patient::Union{Reference, Nothing}
    preAuthRef::Union{string_fhir, Nothing}
    purpose::Union{Vector{String}, Nothing}
    request::Union{Reference, Nothing}
    requestor::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CoverageEligibilityResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CoverageEligibilityResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:purpose,:_purpose,:patient,:servicedDate,:_servicedDate,:servicedPeriod,:created,:_created,:requestor,:request,:outcome,:_outcome,:disposition,:_disposition,:insurer,:insurance,:preAuthRef,:_preAuthRef,:form,:error,)



mutable struct ClaimResponse_AddItem <: AbstractFHIRType
    _detailSequence::Union{Vector{Element}, Nothing}
    _factor::Union{Element, Nothing}
    _itemSequence::Union{Vector{Element}, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    _servicedDate::Union{Element, Nothing}
    _subdetailSequence::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    detail::Union{Vector{ClaimResponse_Detail1}, Nothing}
    detailSequence::Union{Vector{SafeInt32}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    itemSequence::Union{Vector{SafeInt32}, Nothing}
    locationAddress::Union{Address, Nothing}
    locationCodeableConcept::Union{CodeableConcept, Nothing}
    locationReference::Union{Reference, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    provider::Union{Vector{Reference}, Nothing}
    quantity::Union{Quantity, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    subSite::Union{Vector{CodeableConcept}, Nothing}
    subdetailSequence::Union{Vector{SafeInt32}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_AddItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_AddItem} = (:id,:extension,:modifierExtension,:itemSequence,:_itemSequence,:detailSequence,:_detailSequence,:subdetailSequence,:_subdetailSequence,:provider,:productOrService,:modifier,:programCode,:servicedDate,:_servicedDate,:servicedPeriod,:locationCodeableConcept,:locationAddress,:locationReference,:quantity,:unitPrice,:factor,:_factor,:net,:bodySite,:subSite,:noteNumber,:_noteNumber,:adjudication,:detail,)



mutable struct MedicinalProductPharmaceutical <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    administrableDoseForm::Union{CodeableConcept, Nothing}
    characteristics::Union{Vector{MedicinalProductPharmaceutical_Characteristics}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    device::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    ingredient::Union{Vector{Reference}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    resourceType::Union{String, Nothing}
    routeOfAdministration::Union{Vector{MedicinalProductPharmaceutical_RouteOfAdministration}, Nothing}
    text::Union{String, Nothing}
    unitOfPresentation::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MedicinalProductPharmaceutical} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MedicinalProductPharmaceutical} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:administrableDoseForm,:unitOfPresentation,:ingredient,:device,:characteristics,:routeOfAdministration,)



mutable struct ExplanationOfBenefit_AddItem <: AbstractFHIRType
    _detailSequence::Union{Vector{Element}, Nothing}
    _factor::Union{Element, Nothing}
    _itemSequence::Union{Vector{Element}, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    _servicedDate::Union{Element, Nothing}
    _subDetailSequence::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    detail::Union{Vector{ExplanationOfBenefit_Detail1}, Nothing}
    detailSequence::Union{Vector{SafeInt32}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    itemSequence::Union{Vector{SafeInt32}, Nothing}
    locationAddress::Union{Address, Nothing}
    locationCodeableConcept::Union{CodeableConcept, Nothing}
    locationReference::Union{Reference, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    provider::Union{Vector{Reference}, Nothing}
    quantity::Union{Quantity, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    subDetailSequence::Union{Vector{SafeInt32}, Nothing}
    subSite::Union{Vector{CodeableConcept}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_AddItem} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_AddItem} = (:id,:extension,:modifierExtension,:itemSequence,:_itemSequence,:detailSequence,:_detailSequence,:subDetailSequence,:_subDetailSequence,:provider,:productOrService,:modifier,:programCode,:servicedDate,:_servicedDate,:servicedPeriod,:locationCodeableConcept,:locationAddress,:locationReference,:quantity,:unitPrice,:factor,:_factor,:net,:bodySite,:subSite,:noteNumber,:_noteNumber,:adjudication,:detail,)



mutable struct GraphDefinition <: AbstractResource
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _start::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    link::Union{Vector{GraphDefinition_Link}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    profile::Union{String, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    start::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: GraphDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: GraphDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:start,:_start,:profile,:link,)



mutable struct StructureDefinition_Differential <: AbstractFHIRType
    element::Union{Vector{ElementDefinition}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureDefinition_Differential} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureDefinition_Differential} = (:id,:extension,:modifierExtension,:element,)



mutable struct TestScript_Setup <: AbstractFHIRType
    action::Union{Vector{TestScript_Action}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Setup} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Setup} = (:id,:extension,:modifierExtension,:action,)



mutable struct CapabilityStatement <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _fhirVersion::Union{Element, Nothing}
    _format::Union{Vector{Element}, Nothing}
    _implicitRules::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _patchFormat::Union{Vector{Element}, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    document::Union{Vector{CapabilityStatement_Document}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fhirVersion::Union{String, Nothing}
    format::Union{Vector{String}, Nothing}
    id::Union{String, Nothing}
    implementation::Union{CapabilityStatement_Implementation, Nothing}
    implementationGuide::Union{Vector{String}, Nothing}
    implicitRules::Union{String, Nothing}
    imports::Union{Vector{String}, Nothing}
    instantiates::Union{Vector{String}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    messaging::Union{Vector{CapabilityStatement_Messaging}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    patchFormat::Union{Vector{String}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    rest::Union{Vector{CapabilityStatement_Rest}, Nothing}
    software::Union{CapabilityStatement_Software, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: CapabilityStatement} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: CapabilityStatement} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:kind,:_kind,:instantiates,:imports,:software,:implementation,:fhirVersion,:_fhirVersion,:format,:_format,:patchFormat,:_patchFormat,:implementationGuide,:rest,:messaging,:document,)



mutable struct ConceptMap_Group <: AbstractFHIRType
    _source::Union{Element, Nothing}
    _sourceVersion::Union{Element, Nothing}
    _target::Union{Element, Nothing}
    _targetVersion::Union{Element, Nothing}
    element::Union{Vector{ConceptMap_Element}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    source::Union{String, Nothing}
    sourceVersion::Union{string_fhir, Nothing}
    target::Union{String, Nothing}
    targetVersion::Union{string_fhir, Nothing}
    unmapped::Union{ConceptMap_Unmapped, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap_Group} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap_Group} = (:id,:extension,:modifierExtension,:source,:_source,:sourceVersion,:_sourceVersion,:target,:_target,:targetVersion,:_targetVersion,:element,:unmapped,)



mutable struct TestScript_Test <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    action::Union{Vector{TestScript_Action1}, Nothing}
    description::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Test} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Test} = (:id,:extension,:modifierExtension,:name,:_name,:description,:_description,:action,)



mutable struct SubstancePolymer_Repeat <: AbstractFHIRType
    _averageMolecularFormula::Union{Element, Nothing}
    _numberOfUnits::Union{Element, Nothing}
    averageMolecularFormula::Union{string_fhir, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    numberOfUnits::Union{SafeInt32, Nothing}
    repeatUnit::Union{Vector{SubstancePolymer_RepeatUnit}, Nothing}
    repeatUnitAmountType::Union{CodeableConcept, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer_Repeat} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer_Repeat} = (:id,:extension,:modifierExtension,:numberOfUnits,:_numberOfUnits,:averageMolecularFormula,:_averageMolecularFormula,:repeatUnitAmountType,:repeatUnit,)



mutable struct ClaimResponse_Item <: AbstractFHIRType
    _itemSequence::Union{Element, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    detail::Union{Vector{ClaimResponse_Detail}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    itemSequence::Union{SafeInt32, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse_Item} = (:id,:extension,:modifierExtension,:itemSequence,:_itemSequence,:noteNumber,:_noteNumber,:adjudication,:detail,)



mutable struct MeasureReport_Group <: AbstractFHIRType
    code::Union{CodeableConcept, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    measureScore::Union{Quantity, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    population::Union{Vector{MeasureReport_Population}, Nothing}
    stratifier::Union{Vector{MeasureReport_Stratifier}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport_Group} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport_Group} = (:id,:extension,:modifierExtension,:code,:population,:measureScore,:stratifier,)



mutable struct ExplanationOfBenefit_Item <: AbstractFHIRType
    _careTeamSequence::Union{Vector{Element}, Nothing}
    _diagnosisSequence::Union{Vector{Element}, Nothing}
    _factor::Union{Element, Nothing}
    _informationSequence::Union{Vector{Element}, Nothing}
    _noteNumber::Union{Vector{Element}, Nothing}
    _procedureSequence::Union{Vector{Element}, Nothing}
    _sequence::Union{Element, Nothing}
    _servicedDate::Union{Element, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    bodySite::Union{CodeableConcept, Nothing}
    careTeamSequence::Union{Vector{SafeInt32}, Nothing}
    category::Union{CodeableConcept, Nothing}
    detail::Union{Vector{ExplanationOfBenefit_Detail}, Nothing}
    diagnosisSequence::Union{Vector{SafeInt32}, Nothing}
    encounter::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    factor::Union{FHIRNumber, Nothing}
    id::Union{string_fhir, Nothing}
    informationSequence::Union{Vector{SafeInt32}, Nothing}
    locationAddress::Union{Address, Nothing}
    locationCodeableConcept::Union{CodeableConcept, Nothing}
    locationReference::Union{Reference, Nothing}
    modifier::Union{Vector{CodeableConcept}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    net::Union{Money, Nothing}
    noteNumber::Union{Vector{SafeInt32}, Nothing}
    procedureSequence::Union{Vector{SafeInt32}, Nothing}
    productOrService::Union{CodeableConcept, Nothing}
    programCode::Union{Vector{CodeableConcept}, Nothing}
    quantity::Union{Quantity, Nothing}
    revenue::Union{CodeableConcept, Nothing}
    sequence::Union{SafeInt32, Nothing}
    servicedDate::Union{string_fhir, Nothing}
    servicedPeriod::Union{Period, Nothing}
    subSite::Union{Vector{CodeableConcept}, Nothing}
    udi::Union{Vector{Reference}, Nothing}
    unitPrice::Union{Money, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit_Item} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit_Item} = (:id,:extension,:modifierExtension,:sequence,:_sequence,:careTeamSequence,:_careTeamSequence,:diagnosisSequence,:_diagnosisSequence,:procedureSequence,:_procedureSequence,:informationSequence,:_informationSequence,:revenue,:category,:productOrService,:modifier,:programCode,:servicedDate,:_servicedDate,:servicedPeriod,:locationCodeableConcept,:locationAddress,:locationReference,:quantity,:unitPrice,:factor,:_factor,:net,:udi,:bodySite,:subSite,:encounter,:noteNumber,:_noteNumber,:adjudication,:detail,)



mutable struct Claim <: AbstractResource
    _created::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    accident::Union{Claim_Accident, Nothing}
    billablePeriod::Union{Period, Nothing}
    careTeam::Union{Vector{Claim_CareTeam}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    diagnosis::Union{Vector{Claim_Diagnosis}, Nothing}
    enterer::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    facility::Union{Reference, Nothing}
    fundsReserve::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurance::Union{Vector{Claim_Insurance}, Nothing}
    insurer::Union{Reference, Nothing}
    item::Union{Vector{Claim_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    originalPrescription::Union{Reference, Nothing}
    patient::Union{Reference, Nothing}
    payee::Union{Claim_Payee, Nothing}
    prescription::Union{Reference, Nothing}
    priority::Union{CodeableConcept, Nothing}
    procedure::Union{Vector{Claim_Procedure}, Nothing}
    provider::Union{Reference, Nothing}
    referral::Union{Reference, Nothing}
    related::Union{Vector{Claim_Related}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subType::Union{CodeableConcept, Nothing}
    supportingInfo::Union{Vector{Claim_SupportingInfo}, Nothing}
    text::Union{String, Nothing}
    total::Union{Money, Nothing}
    type::Union{CodeableConcept, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: Claim} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: Claim} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:subType,:use,:_use,:patient,:billablePeriod,:created,:_created,:enterer,:insurer,:provider,:priority,:fundsReserve,:related,:prescription,:originalPrescription,:payee,:referral,:facility,:careTeam,:supportingInfo,:diagnosis,:procedure,:insurance,:accident,:item,:total,)



mutable struct ExampleScenario_Process <: AbstractFHIRType
    _description::Union{Element, Nothing}
    _postConditions::Union{Element, Nothing}
    _preConditions::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    description::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    postConditions::Union{String, Nothing}
    preConditions::Union{String, Nothing}
    step::Union{Vector{ExampleScenario_Step}, Nothing}
    title::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario_Process} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario_Process} = (:id,:extension,:modifierExtension,:title,:_title,:description,:_description,:preConditions,:_preConditions,:postConditions,:_postConditions,:step,)



mutable struct TestScript_Teardown <: AbstractFHIRType
    action::Union{Vector{TestScript_Action2}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript_Teardown} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript_Teardown} = (:id,:extension,:modifierExtension,:action,)



mutable struct StructureMap_Group <: AbstractFHIRType
    _documentation::Union{Element, Nothing}
    _extends::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _typeMode::Union{Element, Nothing}
    documentation::Union{string_fhir, Nothing}
    extends::Union{String, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{string_fhir, Nothing}
    input::Union{Vector{StructureMap_Input}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{String, Nothing}
    rule::Union{Vector{StructureMap_Rule}, Nothing}
    typeMode::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap_Group} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap_Group} = (:id,:extension,:modifierExtension,:name,:_name,:extends,:_extends,:typeMode,:_typeMode,:documentation,:_documentation,:input,:rule,)



mutable struct TestScript <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    destination::Union{Vector{TestScript_Destination}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fixture::Union{Vector{TestScript_Fixture}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    metadata::Union{TestScript_Metadata, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    origin::Union{Vector{TestScript_Origin}, Nothing}
    profile::Union{Vector{Reference}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    setup::Union{TestScript_Setup, Nothing}
    status::Union{String, Nothing}
    teardown::Union{TestScript_Teardown, Nothing}
    test::Union{Vector{TestScript_Test}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    variable::Union{Vector{TestScript_Variable}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: TestScript} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: TestScript} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:origin,:destination,:metadata,:fixture,:profile,:variable,:setup,:test,:teardown,)



mutable struct ExampleScenario <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    actor::Union{Vector{ExampleScenario_Actor}, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    instance::Union{Vector{ExampleScenario_Instance}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    process::Union{Vector{ExampleScenario_Process}, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
    workflow::Union{Vector{String}, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExampleScenario} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExampleScenario} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:useContext,:jurisdiction,:copyright,:_copyright,:purpose,:_purpose,:actor,:instance,:process,:workflow,)



mutable struct ConceptMap <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _sourceCanonical::Union{Element, Nothing}
    _sourceUri::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _targetCanonical::Union{Element, Nothing}
    _targetUri::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{Vector{ConceptMap_Group}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Identifier, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    sourceCanonical::Union{string_fhir, Nothing}
    sourceUri::Union{string_fhir, Nothing}
    status::Union{String, Nothing}
    targetCanonical::Union{string_fhir, Nothing}
    targetUri::Union{string_fhir, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ConceptMap} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ConceptMap} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:sourceUri,:_sourceUri,:sourceCanonical,:_sourceCanonical,:targetUri,:_targetUri,:targetCanonical,:_targetCanonical,:group,)



mutable struct ExplanationOfBenefit <: AbstractResource
    _created::Union{Element, Nothing}
    _disposition::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _preAuthRef::Union{Vector{Element}, Nothing}
    _precedence::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    accident::Union{ExplanationOfBenefit_Accident, Nothing}
    addItem::Union{Vector{ExplanationOfBenefit_AddItem}, Nothing}
    adjudication::Union{Vector{ExplanationOfBenefit_Adjudication}, Nothing}
    benefitBalance::Union{Vector{ExplanationOfBenefit_BenefitBalance}, Nothing}
    benefitPeriod::Union{Period, Nothing}
    billablePeriod::Union{Period, Nothing}
    careTeam::Union{Vector{ExplanationOfBenefit_CareTeam}, Nothing}
    claim::Union{Reference, Nothing}
    claimResponse::Union{Reference, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    diagnosis::Union{Vector{ExplanationOfBenefit_Diagnosis}, Nothing}
    disposition::Union{string_fhir, Nothing}
    enterer::Union{Reference, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    facility::Union{Reference, Nothing}
    form::Union{Attachment, Nothing}
    formCode::Union{CodeableConcept, Nothing}
    fundsReserve::Union{CodeableConcept, Nothing}
    fundsReserveRequested::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurance::Union{Vector{ExplanationOfBenefit_Insurance}, Nothing}
    insurer::Union{Reference, Nothing}
    item::Union{Vector{ExplanationOfBenefit_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    originalPrescription::Union{Reference, Nothing}
    outcome::Union{String, Nothing}
    patient::Union{Reference, Nothing}
    payee::Union{ExplanationOfBenefit_Payee, Nothing}
    payment::Union{ExplanationOfBenefit_Payment, Nothing}
    preAuthRef::Union{Vector{string_fhir}, Nothing}
    preAuthRefPeriod::Union{Vector{Period}, Nothing}
    precedence::Union{SafeInt32, Nothing}
    prescription::Union{Reference, Nothing}
    priority::Union{CodeableConcept, Nothing}
    procedure::Union{Vector{ExplanationOfBenefit_Procedure}, Nothing}
    processNote::Union{Vector{ExplanationOfBenefit_ProcessNote}, Nothing}
    provider::Union{Reference, Nothing}
    referral::Union{Reference, Nothing}
    related::Union{Vector{ExplanationOfBenefit_Related}, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subType::Union{CodeableConcept, Nothing}
    supportingInfo::Union{Vector{ExplanationOfBenefit_SupportingInfo}, Nothing}
    text::Union{String, Nothing}
    total::Union{Vector{ExplanationOfBenefit_Total}, Nothing}
    type::Union{CodeableConcept, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ExplanationOfBenefit} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ExplanationOfBenefit} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:subType,:use,:_use,:patient,:billablePeriod,:created,:_created,:enterer,:insurer,:provider,:priority,:fundsReserveRequested,:fundsReserve,:related,:prescription,:originalPrescription,:payee,:referral,:facility,:claim,:claimResponse,:outcome,:_outcome,:disposition,:_disposition,:preAuthRef,:_preAuthRef,:preAuthRefPeriod,:careTeam,:supportingInfo,:diagnosis,:procedure,:precedence,:_precedence,:insurance,:accident,:item,:addItem,:adjudication,:total,:payment,:formCode,:form,:processNote,:benefitPeriod,:benefitBalance,)



mutable struct ValueSet <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _immutable::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    compose::Union{ValueSet_Compose, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    expansion::Union{ValueSet_Expansion, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    immutable::Union{Bool, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ValueSet} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ValueSet} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:immutable,:_immutable,:purpose,:_purpose,:copyright,:_copyright,:compose,:expansion,)



mutable struct ClaimResponse <: AbstractResource
    _created::Union{Element, Nothing}
    _disposition::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _outcome::Union{Element, Nothing}
    _preAuthRef::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _use::Union{Element, Nothing}
    addItem::Union{Vector{ClaimResponse_AddItem}, Nothing}
    adjudication::Union{Vector{ClaimResponse_Adjudication}, Nothing}
    communicationRequest::Union{Vector{Reference}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    created::Union{Union{DateTime, ZonedDateTime}, Nothing}
    disposition::Union{string_fhir, Nothing}
    error::Union{Vector{ClaimResponse_Error}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    form::Union{Attachment, Nothing}
    formCode::Union{CodeableConcept, Nothing}
    fundsReserve::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    insurance::Union{Vector{ClaimResponse_Insurance}, Nothing}
    insurer::Union{Reference, Nothing}
    item::Union{Vector{ClaimResponse_Item}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    outcome::Union{String, Nothing}
    patient::Union{Reference, Nothing}
    payeeType::Union{CodeableConcept, Nothing}
    payment::Union{ClaimResponse_Payment, Nothing}
    preAuthPeriod::Union{Period, Nothing}
    preAuthRef::Union{string_fhir, Nothing}
    processNote::Union{Vector{ClaimResponse_ProcessNote}, Nothing}
    request::Union{Reference, Nothing}
    requestor::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subType::Union{CodeableConcept, Nothing}
    text::Union{String, Nothing}
    total::Union{Vector{ClaimResponse_Total}, Nothing}
    type::Union{CodeableConcept, Nothing}
    use::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: ClaimResponse} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: ClaimResponse} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:subType,:use,:_use,:patient,:created,:_created,:insurer,:requestor,:request,:outcome,:_outcome,:disposition,:_disposition,:preAuthRef,:_preAuthRef,:preAuthPeriod,:payeeType,:item,:addItem,:adjudication,:total,:payment,:fundsReserve,:formCode,:form,:processNote,:communicationRequest,:insurance,:error,)



mutable struct StructureMap <: AbstractResource
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    description::Union{String, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{Vector{StructureMap_Group}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    import::Union{Vector{String}, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    structure::Union{Vector{StructureMap_Structure}, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureMap} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureMap} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:structure,:import,:group,)



mutable struct SubstancePolymer <: AbstractResource
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _modification::Union{Vector{Element}, Nothing}
    class::Union{CodeableConcept, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    copolymerConnectivity::Union{Vector{CodeableConcept}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    geometry::Union{CodeableConcept, Nothing}
    id::Union{String, Nothing}
    implicitRules::Union{String, Nothing}
    language::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modification::Union{Vector{string_fhir}, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    monomerSet::Union{Vector{SubstancePolymer_MonomerSet}, Nothing}
    repeat::Union{Vector{SubstancePolymer_Repeat}, Nothing}
    resourceType::Union{String, Nothing}
    text::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: SubstancePolymer} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: SubstancePolymer} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:class,:geometry,:copolymerConnectivity,:modification,:_modification,:monomerSet,:repeat,)



mutable struct MeasureReport <: AbstractResource
    _date::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    evaluatedResource::Union{Vector{Reference}, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    group::Union{Vector{MeasureReport_Group}, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    improvementNotation::Union{CodeableConcept, Nothing}
    language::Union{String, Nothing}
    measure::Union{String, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    period::Union{Period, Nothing}
    reporter::Union{Reference, Nothing}
    resourceType::Union{String, Nothing}
    status::Union{String, Nothing}
    subject::Union{Reference, Nothing}
    text::Union{String, Nothing}
    type::Union{String, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: MeasureReport} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: MeasureReport} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:identifier,:status,:_status,:type,:_type,:measure,:subject,:date,:_date,:reporter,:period,:improvementNotation,:group,:evaluatedResource,)



mutable struct StructureDefinition <: AbstractResource
    _abstract::Union{Element, Nothing}
    _contextInvariant::Union{Vector{Element}, Nothing}
    _copyright::Union{Element, Nothing}
    _date::Union{Element, Nothing}
    _derivation::Union{Element, Nothing}
    _description::Union{Element, Nothing}
    _experimental::Union{Element, Nothing}
    _fhirVersion::Union{Element, Nothing}
    _implicitRules::Union{Element, Nothing}
    _kind::Union{Element, Nothing}
    _language::Union{Element, Nothing}
    _name::Union{Element, Nothing}
    _publisher::Union{Element, Nothing}
    _purpose::Union{Element, Nothing}
    _status::Union{Element, Nothing}
    _title::Union{Element, Nothing}
    _type::Union{Element, Nothing}
    _url::Union{Element, Nothing}
    _version::Union{Element, Nothing}
    abstract::Union{Bool, Nothing}
    baseDefinition::Union{String, Nothing}
    contact::Union{Vector{ContactDetail}, Nothing}
    contained::Union{Vector{ResourceList}, Nothing}
    context::Union{Vector{StructureDefinition_Context}, Nothing}
    contextInvariant::Union{Vector{string_fhir}, Nothing}
    copyright::Union{String, Nothing}
    date::Union{Union{DateTime, ZonedDateTime}, Nothing}
    derivation::Union{String, Nothing}
    description::Union{String, Nothing}
    differential::Union{StructureDefinition_Differential, Nothing}
    experimental::Union{Bool, Nothing}
    extension::Union{Vector{Extension}, Nothing}
    fhirVersion::Union{String, Nothing}
    id::Union{String, Nothing}
    identifier::Union{Vector{Identifier}, Nothing}
    implicitRules::Union{String, Nothing}
    jurisdiction::Union{Vector{CodeableConcept}, Nothing}
    keyword::Union{Vector{Coding}, Nothing}
    kind::Union{String, Nothing}
    language::Union{String, Nothing}
    mapping::Union{Vector{StructureDefinition_Mapping}, Nothing}
    meta::Union{Meta, Nothing}
    modifierExtension::Union{Vector{Extension}, Nothing}
    name::Union{string_fhir, Nothing}
    publisher::Union{string_fhir, Nothing}
    purpose::Union{String, Nothing}
    resourceType::Union{String, Nothing}
    snapshot::Union{StructureDefinition_Snapshot, Nothing}
    status::Union{String, Nothing}
    text::Union{String, Nothing}
    title::Union{string_fhir, Nothing}
    type::Union{String, Nothing}
    url::Union{String, Nothing}
    useContext::Union{Vector{UsageContext}, Nothing}
    version::Union{string_fhir, Nothing}
end
@inline StructTypes.StructType(::Type{T}) where {T <: StructureDefinition} = StructTypes.Mutable()
@inline StructTypes.omitempties(::Type{T}) where {T <: StructureDefinition} = (:resourceType,:id,:meta,:implicitRules,:_implicitRules,:language,:_language,:text,:contained,:extension,:modifierExtension,:url,:_url,:identifier,:version,:_version,:name,:_name,:title,:_title,:status,:_status,:experimental,:_experimental,:date,:_date,:publisher,:_publisher,:contact,:description,:_description,:useContext,:jurisdiction,:purpose,:_purpose,:copyright,:_copyright,:keyword,:fhirVersion,:_fhirVersion,:mapping,:kind,:_kind,:abstract,:_abstract,:context,:contextInvariant,:_contextInvariant,:type,:_type,:baseDefinition,:derivation,:_derivation,:snapshot,:differential,)

end # end module R4Types
