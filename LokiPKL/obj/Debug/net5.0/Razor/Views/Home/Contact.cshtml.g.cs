#pragma checksum "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Home\Contact.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "d6ef8a42cadd99393b73f2e22f04acf29d44b75b"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Contact), @"mvc.1.0.view", @"/Views/Home/Contact.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\_ViewImports.cshtml"
using LokiPKL;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\_ViewImports.cshtml"
using LokiPKL.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"d6ef8a42cadd99393b73f2e22f04acf29d44b75b", @"/Views/Home/Contact.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"4c9096b3339e044483f05ba3e96e1ed9a855c385", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Contact : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("contact_body"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("method", "post", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("action", new global::Microsoft.AspNetCore.Html.HtmlString("contact_me.php"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 2 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Home\Contact.cshtml"
  
    ViewData["Title"] = "Contact";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<div class=\"container mt_30\">\r\n      <div class=\"row \">\r\n        \r\n        ");
#nullable restore
#line 10 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Home\Contact.cshtml"
   Write(await Html.PartialAsync("_CategoryLeftPartialView"));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"

        <div class=""col-sm-8 col-lg-9 mtb_20"">
          <!-- contact  -->
          <div class=""row"">
            <div class=""col-md-4 col-xs-12 contact"">
              <div class=""location mb_50"">
                <h5 class=""capitalize mb_20""><strong>Our Location</strong></h5>
                <div class=""address"">Office address
                  <br> 124,Lorem Ipsum has been
                  <br> text ever since the 1500</div>
                <div class=""call mt_10""><i class=""fa fa-phone"" aria-hidden=""true""></i>+91-9987-654-321</div>
              </div>
              <div class=""Career mb_50"">
                <h5 class=""capitalize mb_20""><strong>Careers</strong></h5>
                <div class=""address"">dummy text ever since the 1500s, simply dummy text of the typesetting industry. </div>
                <div class=""email mt_10""><i class=""fa fa-envelope"" aria-hidden=""true""></i><a href=""mailto:careers@yourdomain.com"" target=""_top"">careers@yourdomain.com</a></div>
              </div>
   ");
            WriteLiteral(@"           <div class=""Hello mb_50"">
                <h5 class=""capitalize mb_20""><strong>Say Hello</strong></h5>
                <div class=""address"">simply dummy text of the printing and typesetting industry.</div>
                <div class=""email mt_10""><i class=""fa fa-envelope"" aria-hidden=""true""></i><a href=""mailto:info@yourdomailname.com"" target=""_top"">info@yourdomailname.com</a></div>
              </div>
            </div>
            <div class=""col-md-8 col-xs-12 contact-form mb_50"">
              <!-- Contact FORM -->
              <div id=""contact_form"">
                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "d6ef8a42cadd99393b73f2e22f04acf29d44b75b6492", async() => {
                WriteLiteral(@"
                  <!--                                <label class=""full-with-form"" ><span>Name</span></label>
-->
                  <input class=""full-with-form "" type=""text"" name=""name"" placeholder=""Name"" data-required=""true"" />
                  <!--                <label class=""full-with-form"" ><span>Email Address</span></label>
-->
                  <input class=""full-with-form  mt_30"" type=""email"" name=""email"" placeholder=""Email Address"" data-required=""true"" />
                  <!--                <label class=""full-with-form"" ><span>Phone Number</span></label>
-->
                  <input class=""full-with-form  mt_30"" type=""text"" name=""phone1"" placeholder=""Phone Number"" maxlength=""15"" data-required=""true"" />
                  <!--                <label class=""full-with-form"" ><span>Subject</span></label>
-->
                  <input class=""full-with-form  mt_30"" type=""text"" name=""subject"" placeholder=""Subject"" data-required=""true"">
                  <!--                                <l");
                WriteLiteral(@"abel class=""full-with-form"" ><span>Attachment</span></label>
-->
                  <!--                                <label class=""full-with-form"" ><span>Message</span></label>
-->
                  <textarea class=""full-with-form  mt_30"" name=""message"" placeholder=""Message"" data-required=""true""></textarea>
                  <button class=""btn mt_30"" type=""submit"">Send Message</button>
                ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Method = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
                <div id=""contact_results""></div>
              </div>
              <!-- END Contact FORM -->
            </div>
          </div>
          <!-- map  -->
          <div class=""row"">
            <div class=""col-xs-12 map mb_80"">
              <div id=""map""></div>
            </div>
          </div>
        </div>
      </div>
    </div>
");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
