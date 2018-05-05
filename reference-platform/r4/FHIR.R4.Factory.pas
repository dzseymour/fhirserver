unit FHIR.R4.Factory;

interface

uses
  FHIR.Ucum.IFace,
  FHIR.Base.Objects, FHIR.Base.Parser, FHIR.Base.Validator, FHIR.Base.Narrative, FHIR.Base.Factory, FHIR.Base.PathEngine,
  FHIR.XVersion.Resources,
  FHIR.Client.Base, FHIR.Client.Threaded;

type
  TFHIRVersionFactoryR4 = class (TFHIRVersionFactory)
  public
    function version : TFHIRVersion; override;
    function description : String; virtual;
    function makeParser(worker : TFHIRWorkerContextV; format : TFHIRFormat; lang : String) : TFHIRParser; override;
    function makeComposer(worker : TFHIRWorkerContextV; format : TFHIRFormat; lang : String; style: TFHIROutputStyle) : TFHIRComposer; override;
    function makeValidator(worker : TFHIRWorkerContextV) : TFHIRValidatorV; override;
    function makeGenerator(worker : TFHIRWorkerContextV) : TFHIRNarrativeGeneratorBase; override;
    function makePathEngine(worker : TFHIRWorkerContextV; ucum : TUcumServiceInterface) : TFHIRPathEngineV; override;
    function makeClientHTTP(worker : TFHIRWorkerContextV; url : String; fmt : TFHIRFormat; timeout : cardinal; proxy : String) : TFhirClientV; overload; override;
    function makeClientThreaded(worker : TFHIRWorkerContextV; internal : TFhirClientV; event : TThreadManagementEvent) : TFhirClientV; overload; override;

    function wrapCapabilityStatement(r : TFHIRResourceV) : TFHIRCapabilityStatementW; override;
  end;

implementation

uses
  FHIR.Client.HTTP,
  FHIR.R4.Parser, FHIR.R4.Context, FHIR.R4.Validator, FHIR.R4.Narrative, FHIR.R4.PathEngine, FHIR.R4.Constants,
  FHIR.R4.Client, FHIR.R4.Common;

{ TFHIRVersionFactoryR4 }

function TFHIRVersionFactoryR4.description: String;
begin
  result := 'R4 ('+FHIR_GENERATED_VERSION+')';
end;

function TFHIRVersionFactoryR4.makeClientHTTP(worker: TFHIRWorkerContextV; url: String; fmt : TFHIRFormat; timeout: cardinal; proxy: String): TFhirClientV;
var
  http : TFHIRHTTPCommunicator;
begin
  http := TFHIRHTTPCommunicator.Create(url);
  try
    http.timeout := timeout;
    http.proxy := proxy;
    result := TFhirClient4.create(worker, 'en', http.link);
    try
      result.format := fmt;
      result.link;
    finally
      result.Free;
    end;
  finally
    http.free;
  end;
end;

function TFHIRVersionFactoryR4.makeClientThreaded(worker: TFHIRWorkerContextV;
  internal: TFhirClientV; event: TThreadManagementEvent): TFhirClientV;
begin

end;

function TFHIRVersionFactoryR4.makeComposer(worker: TFHIRWorkerContextV; format: TFHIRFormat; lang: String; style: TFHIROutputStyle): TFHIRComposer;
begin
  result := TFHIRParsers4.composer(worker as TFHIRWorkerContext, format, lang, style);
end;

function TFHIRVersionFactoryR4.makeGenerator(worker: TFHIRWorkerContextV): TFHIRNarrativeGeneratorBase;
begin
  result := TFHIRNarrativeGenerator.create(worker);
end;

function TFHIRVersionFactoryR4.makeParser(worker: TFHIRWorkerContextV; format: TFHIRFormat; lang: String): TFHIRParser;
begin
  result := TFHIRParsers4.parser(worker as TFHIRWorkerContext, format, lang);
end;

function TFHIRVersionFactoryR4.makePathEngine(worker: TFHIRWorkerContextV; ucum : TUcumServiceInterface): TFHIRPathEngineV;
begin
  result := TFHIRPathEngine.Create(worker as TFHIRWorkerContext, ucum);
end;

function TFHIRVersionFactoryR4.makeValidator(worker: TFHIRWorkerContextV): TFHIRValidatorV;
begin
  result := TFHIRValidator4.Create(worker as TFHIRWorkerContext);
end;

function TFHIRVersionFactoryR4.version: TFHIRVersion;
begin
  result := fhirVersionRelease4;
end;

function TFHIRVersionFactoryR4.wrapCapabilityStatement(r: TFHIRResourceV): TFHIRCapabilityStatementW;
begin
  result := TFHIRCapabilityStatement4.create(r);
end;

end.