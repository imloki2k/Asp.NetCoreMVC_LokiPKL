#pragma checksum "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "0c2b3edd372ea9c801d6faa4b3a440efed202270"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Product_Details), @"mvc.1.0.view", @"/Views/Product/Details.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0c2b3edd372ea9c801d6faa4b3a440efed202270", @"/Views/Product/Details.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1226c4f3c2c30cb6e7b97345e49c9f7fce79e5af", @"/Views/_ViewImports.cshtml")]
    public class Views_Product_Details : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<LokiPKL.Models.Product>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Home", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Product", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("data-name", new global::Microsoft.AspNetCore.Html.HtmlString("product_image"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("alt", new global::Microsoft.AspNetCore.Html.HtmlString(""), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_5 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "ShoppingCart", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_6 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "AddToCart", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_7 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("form-horizontal"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
  
    ViewData["Title"] = "Details";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n    <div class=\"container\">\r\n      <div class=\"row \">\r\n        <!-- =====  BANNER STRAT  ===== -->\r\n        <div class=\"col-sm-12\">\r\n          <div class=\"breadcrumb ptb_20\">\r\n            <h1>Product Details</h1>\r\n            <ul>\r\n              <li>");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0c2b3edd372ea9c801d6faa4b3a440efed2022706587", async() => {
                WriteLiteral("Home");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("</li>\r\n              <li>");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0c2b3edd372ea9c801d6faa4b3a440efed2022707969", async() => {
                WriteLiteral("Products");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_2.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_2);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("</li>\r\n              <li class=\"active\">");
#nullable restore
#line 16 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                            Write(Model.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral(" ...</li>\r\n            </ul>\r\n          </div>\r\n        </div>\r\n        <!-- =====  BREADCRUMB END===== -->\r\n        \r\n          \r\n         ");
#nullable restore
#line 23 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
    Write(await Html.PartialAsync("_CategoryLeftPartialView"));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n          \r\n        <div class=\"col-sm-8 col-lg-9 mtb_20\">\r\n          <div class=\"row mt_10 \">\r\n            <div class=\"col-md-6\">\r\n              <div><a class=\"thumbnails\"> ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "0c2b3edd372ea9c801d6faa4b3a440efed20227010212", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 974, "~/Upload/Main_image/", 974, 20, true);
#nullable restore
#line 29 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
AddHtmlAttributeValue("", 994, Model.MainImage, 994, 16, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("</a></div>\r\n\r\n");
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col-md-6 prodetail caption product-thumb\">\r\n              <h2 data-name=\"product_name\" class=\"product-name\">");
#nullable restore
#line 57 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                                                           Write(Model.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</h2>
              <div class=""rating"">
                <span class=""fa fa-stack""><i class=""fa fa-star-o fa-stack-1x""></i><i class=""fa fa-star fa-stack-1x""></i></span>
                <span class=""fa fa-stack""><i class=""fa fa-star-o fa-stack-1x""></i><i class=""fa fa-star fa-stack-1x""></i></span>
                <span class=""fa fa-stack""><i class=""fa fa-star-o fa-stack-1x""></i><i class=""fa fa-star fa-stack-1x""></i></span>
                <span class=""fa fa-stack""><i class=""fa fa-star-o fa-stack-1x""></i><i class=""fa fa-star fa-stack-1x""></i></span>
                <span class=""fa fa-stack""><i class=""fa fa-star-o fa-stack-1x""></i><i class=""fa fa-star fa-stack-x""></i></span>
              </div>
              <span class=""price mb_20""><span class=""amount"">");
#nullable restore
#line 65 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                                                        Write(Model.FormatPrice);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\r\n              </span>\r\n              <hr>\r\n              <ul class=\"list-unstyled product_info mtb_20\">\r\n                <li>\r\n                  <label>Brand:</label>\r\n                  <span> <a href=\"#\">");
#nullable restore
#line 71 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                                Write(Model.Brand.BrandName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></span></li>\r\n                <li>\r\n                  <label>Product Code:</label>\r\n                  <span>");
#nullable restore
#line 74 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                   Write(Model.Brand.BrandName);

#line default
#line hidden
#nullable disable
            WriteLiteral(" ");
#nullable restore
#line 74 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                                          Write(Model.ProductId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span></li>\r\n                <li>\r\n                  <label>Availability:</label>\r\n");
#nullable restore
#line 77 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                         if(@Model.Quantity > 0)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <span> In Stock</span>\r\n");
#nullable restore
#line 80 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <span> Out Stock</span>\r\n");
#nullable restore
#line 84 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                        }

#line default
#line hidden
#nullable disable
            WriteLiteral("              </li>\r\n              </ul>\r\n              <hr>\r\n              <p class=\"product-desc mtb_30\">");
#nullable restore
#line 88 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
                                        Write(Model.Description);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n              <div id=\"product\">\r\n\r\n");
            WriteLiteral("                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0c2b3edd372ea9c801d6faa4b3a440efed20227015901", async() => {
                WriteLiteral("\r\n                  <input type=\"hidden\" name=\"productID\"");
                BeginWriteAttribute("value", " value=\"", 6009, "\"", 6033, 1);
#nullable restore
#line 113 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\Product\Details.cshtml"
WriteAttributeValue("", 6017, Model.ProductId, 6017, 16, false);

#line default
#line hidden
#nullable disable
                EndWriteAttribute();
                WriteLiteral(@"/>
                  <div class=""qty mt_30 form-group2"">
                  <label>Qty</label>
                  <input name=""amount"" min=""1"" max=""10"" value=""1"" type=""number"">
                  <input type=""submit"" value=""Add To Cart""></input>
                </div>
                ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Controller = (string)__tagHelperAttribute_5.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_5);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Action = (string)__tagHelperAttribute_6.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_6);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            WriteLiteral(@"              </div>
            </div>
          </div>
          <div class=""row"">
            <div class=""col-md-12"">
              <div id=""exTab5"" class=""mtb_30"">
                <ul class=""nav nav-tabs"">
                  <li><h3>Reviews</h3></li>
                </ul>
                <div class=""tab-content "">
                  <div id=""2c"">
                    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0c2b3edd372ea9c801d6faa4b3a440efed20227018703", async() => {
                WriteLiteral(@"
                      <div id=""review""></div>
                      <h4 class=""mt_20 mb_30"">Write a review</h4>
                      <div class=""form-group required"">
                        <div class=""col-sm-12"">
                          <label class=""control-label"" for=""input-name"">Your Name</label>
                          <input name=""name""");
                BeginWriteAttribute("value", " value=\"", 7437, "\"", 7445, 0);
                EndWriteAttribute();
                WriteLiteral(@" id=""input-name"" class=""form-control"" type=""text"">
                        </div>
                      </div>
                      <div class=""form-group required"">
                        <div class=""col-sm-12"">
                          <label class=""control-label"" for=""input-review"">Your Review</label>
                          <textarea name=""text"" rows=""5"" id=""input-review"" class=""form-control""></textarea>
                        </div>
                      </div>
                      <div class=""form-group required"">
                        <div class=""col-md-6"">
                          <label class=""control-label"">Rating</label>
                          <div class=""rates""><span>Bad</span>
                            <input name=""rating"" value=""1"" type=""radio"">
                            <input name=""rating"" value=""2"" type=""radio"">
                            <input name=""rating"" value=""3"" type=""radio"">
                            <input name=""rating"" value=""4"" type=""radio"">
   ");
                WriteLiteral(@"                         <input name=""rating"" value=""5"" type=""radio"">
                            <span>Good</span></div>
                        </div>
                        <div class=""col-md-6"">
                          <div class=""buttons pull-right"">
                            <button type=""submit"" class=""btn btn-md btn-link"">Continue</button>
                          </div>
                        </div>
                      </div>
                    ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_7);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class=""row"">
            <div class=""col-md-12"">


            </div>
          </div>
        </div>
      </div>
    </div>


");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n        <script>\r\n\r\n        </script>\r\n    ");
            }
            );
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<LokiPKL.Models.Product> Html { get; private set; }
    }
}
#pragma warning restore 1591
