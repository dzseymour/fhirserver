unit FHIR.R2.Base;

{
Copyright (c) 2017+, Health Intersections Pty Ltd (http://www.healthintersections.com.au)
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to
   endorse or promote products derived from this software without specific
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
}

interface

uses
  FHIR.Base.Objects;

type
  TFHIRObject2 = class (TFHIRObject)
  protected
    function makeStringValue(v : String) : TFHIRObject; override;
    function makeCodeValue(v : String) : TFHIRObject; override;
    function makeIntValue(v : String) : TFHIRObject; override;
    function GetFhirObjectVersion: TFHIRVersion; override;
  end;

  TFHIRObjectX = TFHIRObject2;

  TFHIRResource2 = class (TFHIRResourceV)
  protected
    function makeStringValue(v : String) : TFHIRObject; override;
    function makeCodeValue(v : String) : TFHIRObject; override;
    function makeIntValue(v : String) : TFHIRObject; override;
    function GetFhirObjectVersion: TFHIRVersion; override;
  end;

  TFHIRResourceX = TFHIRResource2;

implementation

uses
  FHIR.R2.Types;


{ TFHIRObject2 }

function TFHIRObject2.GetFhirObjectVersion: TFHIRVersion;
begin
  result := fhirVersionRelease2;
end;

function TFHIRObject2.makeCodeValue(v: String): TFHIRObject;
begin
  result := TFhirCode.Create(v);
end;

function TFHIRObject2.makeIntValue(v: String): TFHIRObject;
begin
  result := TFhirInteger.Create(v);
end;

function TFHIRObject2.makeStringValue(v: String): TFHIRObject;
begin
  result := TFhirString.Create(v);
end;


{ TFHIRResource2 }

function TFHIRResource2.GetFhirObjectVersion: TFHIRVersion;
begin
  result := fhirVersionRelease2;
end;

function TFHIRResource2.makeCodeValue(v: String): TFHIRObject;
begin
  result := TFhirCode.Create(v);
end;

function TFHIRResource2.makeIntValue(v: String): TFHIRObject;
begin
  result := TFhirInteger.Create(v);
end;

function TFHIRResource2.makeStringValue(v: String): TFHIRObject;
begin
  result := TFhirString.Create(v);
end;

end.
