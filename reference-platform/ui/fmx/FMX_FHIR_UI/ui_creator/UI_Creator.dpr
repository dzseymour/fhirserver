program UI_Creator;

uses
  System.StartUpCopy,
  FMX.Forms,
  FHIR.Version.Client in '..\..\..\..\version\FHIR.Version.Client.pas',
  FHIR.Version.Context in '..\..\..\..\version\FHIR.Version.Context.pas',
  FHIR.Support.Strings in '..\..\..\..\support\FHIR.Support.Strings.pas',
  FHIR.Support.Math in '..\..\..\..\support\FHIR.Support.Math.pas',
  FHIR.Support.Osx in '..\..\..\..\support\FHIR.Support.Osx.pas',
  FHIR.Support.Decimal in '..\..\..\..\support\FHIR.Support.Decimal.pas',
  FHIR.Support.DateTime in '..\..\..\..\support\FHIR.Support.DateTime.pas',
  FHIR.Support.Mime in '..\..\..\..\support\FHIR.Support.Mime.pas',
  FHIR.Support.Objects in '..\..\..\..\support\FHIR.Support.Objects.pas',
  FHIR.Support.Exceptions in '..\..\..\..\support\FHIR.Support.Exceptions.pas',
  FHIR.Support.Generics in '..\..\..\..\support\FHIR.Support.Generics.pas',
  FHIR.Support.Stream in '..\..\..\..\support\FHIR.Support.Stream.pas',
  FHIR.Support.Collections in '..\..\..\..\support\FHIR.Support.Collections.pas',
  FHIR.Support.Binary in '..\..\..\..\support\FHIR.Support.Binary.pas',
  FHIR.Support.System in '..\..\..\..\support\FHIR.Support.System.pas',
  FHIR.Support.Json in '..\..\..\..\support\FHIR.Support.Json.pas',
  FHIR.Version.Parser in '..\..\..\..\version\FHIR.Version.Parser.pas',
  FHIR.R4.Xml in '..\..\..\..\r4\FHIR.R4.Xml.pas',
  FHIR.Base.Parser in '..\..\..\..\base\FHIR.Base.Parser.pas',
  FHIR.Support.MXml in '..\..\..\..\support\FHIR.Support.MXml.pas',
  FHIR.Support.Turtle in '..\..\..\..\support\FHIR.Support.Turtle.pas',
  FHIR.Base.Objects in '..\..\..\..\base\FHIR.Base.Objects.pas',
  FHIR.Base.Common in '..\..\..\..\base\FHIR.Base.Common.pas',
  FHIR.Base.Utilities in '..\..\..\..\base\FHIR.Base.Utilities.pas',
  FHIR.R4.Utilities in '..\..\..\..\r4\FHIR.R4.Utilities.pas',
  FHIR.Web.Parsers in '..\..\..\..\support\FHIR.Web.Parsers.pas',
  FHIR.Web.Fetcher in '..\..\..\..\support\FHIR.Web.Fetcher.pas',
  FHIR.R4.Context in '..\..\..\..\r4\FHIR.R4.Context.pas',
  FHIR.R4.Types in '..\..\..\..\r4\FHIR.R4.Types.pas',
  FHIR.R4.Resources in '..\..\..\..\r4\FHIR.R4.Resources.pas',
  FHIR.Base.Scim in '..\..\..\..\base\FHIR.Base.Scim.pas',
  FHIR.R4.Constants in '..\..\..\..\r4\FHIR.R4.Constants.pas',
  FHIR.R4.Tags in '..\..\..\..\r4\FHIR.R4.Tags.pas',
  FHIR.Base.Lang in '..\..\..\..\base\FHIR.Base.Lang.pas',
  FHIR.Base.Xhtml in '..\..\..\..\base\FHIR.Base.Xhtml.pas',
  FHIR.R4.Json in '..\..\..\..\r4\FHIR.R4.Json.pas',
  FHIR.R4.Turtle in '..\..\..\..\r4\FHIR.R4.Turtle.pas',
  FHIR.R4.ElementModel in '..\..\..\..\r4\FHIR.R4.ElementModel.pas',
  FHIR.R4.Profiles in '..\..\..\..\r4\FHIR.R4.Profiles.pas',
  FHIR.Support.Lock in '..\..\..\..\support\FHIR.Support.Lock.pas',
  FHIR.R4.PathEngine in '..\..\..\..\r4\FHIR.R4.PathEngine.pas',
  FHIR.CdsHooks.Utilities in '..\..\..\..\support\FHIR.CdsHooks.Utilities.pas',
  FastMM4Messages in '..\..\..\..\..\Libraries\FMM\FastMM4Messages.pas',
  FHIR.R4.IndexInfo in '..\..\..\..\r4\FHIR.R4.IndexInfo.pas',
  FHIR.Tools.Indexing in '..\..\..\..\tools\FHIR.Tools.Indexing.pas',
  FHIR.Tools.DiffEngine in '..\..\..\..\tools\FHIR.Tools.DiffEngine.pas',
  FHIR.Client.Registry in '..\..\..\..\client\FHIR.Client.Registry.pas',
  FHIR.Client.ServerDialogFMX in '..\..\..\..\client\FHIR.Client.ServerDialogFMX.pas' {EditRegisteredServerForm},
  FHIR.Web.HtmlGen in '..\..\..\..\Support\FHIR.Web.HtmlGen.pas',
  FHIR.Client.ClientDialogFMX in '..\..\..\..\client\FHIR.Client.ClientDialogFMX.pas' {RegisterClientForm},
  FHIR.Support.Signatures in '..\..\..\..\support\FHIR.Support.Signatures.pas',
  FHIR.Ucum.IFace in '..\..\..\..\support\FHIR.Ucum.IFace.pas',
  FHIR.R4.PathNode in '..\..\..\..\r4\FHIR.R4.PathNode.pas',
  FHIR.Debug.Logging in '..\..\..\..\support\FHIR.Debug.Logging.pas',
  FHIR.R4.Questionnaire2 in '..\..\..\..\r4\FHIR.R4.Questionnaire2.pas',
  FHIR.R4.Base in '..\..\..\..\r4\FHIR.R4.Base.pas',
  FHIR.R4.ParserBase in '..\..\..\..\r4\FHIR.R4.ParserBase.pas',
  FHIR.Tools.XhtmlComp in '..\..\..\..\tools\FHIR.Tools.XhtmlComp.pas',
  FHIR.R4.Parser in '..\..\..\..\r4\FHIR.R4.Parser.pas',
  FHIR.Client.Base in '..\..\..\..\client\FHIR.Client.Base.pas',
  FHIR.Client.HTTP in '..\..\..\..\client\FHIR.Client.HTTP.pas',
  FHIR.Client.Threaded in '..\..\..\..\client\FHIR.Client.Threaded.pas',
  FHIR.R4.Client in '..\..\..\..\r4\FHIR.R4.Client.pas',
  FHIR.Support.Text in '..\..\..\..\support\FHIR.Support.Text.pas',
  FHIR.Support.Xml in '..\..\..\..\support\FHIR.Support.Xml.pas',
  FHIR.Support.Zip in '..\..\..\..\support\FHIR.Support.Zip.pas',
  FHIR.Support.WInInet in '..\..\..\..\support\FHIR.Support.WInInet.pas',
  FHIR.Support.Controllers in '..\..\..\..\support\FHIR.Support.Controllers.pas',
  FHIR.Support.Certs in '..\..\..\..\support\FHIR.Support.Certs.pas',
  FHIR.Misc.GraphQL in '..\..\..\..\support\FHIR.Misc.GraphQL.pas',
  FHIR.Base.Factory in '..\..\..\..\base\FHIR.Base.Factory.pas',
  FHIR.Base.Validator in '..\..\..\..\base\FHIR.Base.Validator.pas',
  FHIR.Base.Narrative in '..\..\..\..\base\FHIR.Base.Narrative.pas',
  FHIR.Base.PathEngine in '..\..\..\..\base\FHIR.Base.PathEngine.pas',
  FHIR.R4.Common in '..\..\..\..\r4\FHIR.R4.Common.pas',
  FHIR.R4.Factory in '..\..\..\..\r4\FHIR.R4.Factory.pas',
  FHIR.R4.Narrative in '..\..\..\..\r4\FHIR.R4.Narrative.pas',
  FHIR.R4.Validator in '..\..\..\..\r4\FHIR.R4.Validator.pas',
  FHIR.Client.Async in '..\..\..\..\client\FHIR.Client.Async.pas',
  FHIR.Cache.PackageManager in '..\..\..\..\cache\FHIR.Cache.PackageManager.pas',
  FHIR.Support.Tarball in '..\..\..\..\support\FHIR.Support.Tarball.pas',
  FHIR.Support.Shell in '..\..\..\..\support\FHIR.Support.Shell.pas',
  FHIR.Tools.ValidationWrapper in '..\..\..\..\tools\FHIR.Tools.ValidationWrapper.pas',
  Unit1 in 'Unit1.pas' {Form1},
  FHIR.FMX.Ctrls in '..\FHIR.FMX.Ctrls.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
