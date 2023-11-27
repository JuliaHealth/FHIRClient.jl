struct DSTU2 <: FHIRVersion end

struct STU3 <: FHIRVersion end

struct UnknownFHIRVersion <: FHIRVersion end

struct OtherFHIRVersion{V} <: FHIRVersion end
