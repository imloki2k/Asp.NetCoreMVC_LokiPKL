#pragma checksum "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "030ce42c72d01238a50b053283fb3dcc52c9114d"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_ShoppingCart_CheckOut), @"mvc.1.0.view", @"/Views/ShoppingCart/CheckOut.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"030ce42c72d01238a50b053283fb3dcc52c9114d", @"/Views/ShoppingCart/CheckOut.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1226c4f3c2c30cb6e7b97345e49c9f7fce79e5af", @"/Views/_ViewImports.cshtml")]
    public class Views_ShoppingCart_CheckOut : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Home", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "ShoppingCart", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "DoOrder", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 2 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
  
    ViewData["Title"] = "CheckOut";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<div class=\"container\">\r\n      <div class=\"row \">\r\n        <!-- =====  BANNER STRAT  ===== -->\r\n        <div class=\"col-sm-12\">\r\n          <div class=\"breadcrumb ptb_20\">\r\n            <h1>Shopping Cart</h1>\r\n            <ul>\r\n              <li>");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "030ce42c72d01238a50b053283fb3dcc52c9114d5122", async() => {
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
            WriteLiteral("</li>\r\n              <li class=\"active\">Shopping Cart</li>\r\n            </ul>\r\n          </div>\r\n        </div>\r\n        <!-- =====  BREADCRUMB END===== -->\r\n        \r\n        ");
#nullable restore
#line 21 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
   Write(await Html.PartialAsync("_CategoryLeftPartialView"));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "030ce42c72d01238a50b053283fb3dcc52c9114d6939", async() => {
                WriteLiteral(@"
        <div class=""col-sm-8 col-lg-9 mtb_20"">
          <div class=""panel-group"" id=""accordion"">
            <div class=""panel panel-default "">
              <div class=""panel-heading"">
                <h4 class=""panel-title""> <a data-toggle=""collapse"" data-parent=""#accordion"" href=""#collapseTwo"">Step 1: Billing Details <i class=""fa fa-caret-down""></i></a> </h4>
              </div>
              <div id=""collapseTwo"" class=""panel-collapse collapse"">
                <div class=""panel-body"">
                    <div id=""payment-new"">
                      <div class=""form-group required"">
                        <label for=""input-payment-firstname"" class=""col-sm-2 control-label"">Full Name</label>
                        <div class=""col-sm-10"">
                          <input type=""text"" class=""form-control"" id=""input-payment-firstname"" placeholder=""Full Name""");
                BeginWriteAttribute("value", " value=\"", 1574, "\"", 1582, 0);
                EndWriteAttribute();
                WriteLiteral(@" name=""name"">
                        </div>
                      </div>
                      <div class=""form-group required"">
                        <label for=""input-payment-address-1"" class=""col-sm-2 control-label"">Address</label>
                        <div class=""col-sm-10"">
                          <input type=""text"" class=""form-control"" id=""input-payment-address-1"" placeholder=""Address""");
                BeginWriteAttribute("value", " value=\"", 1991, "\"", 1999, 0);
                EndWriteAttribute();
                WriteLiteral(@" name=""address"">
                        </div>
                      </div>
                      <div class=""form-group"">
                        <label for=""input-payment-postcode"" class=""col-sm-2 control-label"">Phone Number</label>
                        <div class=""col-sm-10"">
                          <input type=""text"" class=""form-control"" id=""input-payment-postcode"" placeholder=""Phone Number""");
                BeginWriteAttribute("value", " value=\"", 2410, "\"", 2418, 0);
                EndWriteAttribute();
                WriteLiteral(@" name=""phoneNumber"">
                        </div>
                      </div>
                      <div class=""form-group required"">
                        <label for=""input-payment-country"" class=""col-sm-2 control-label"">Email</label>
                        <div class=""col-sm-10"">
                          <input type=""text"" class=""form-control"" id=""input-payment-postcode"" placeholder=""Email""");
                BeginWriteAttribute("value", " value=\"", 2827, "\"", 2835, 0);
                EndWriteAttribute();
                WriteLiteral(@" name=""email"">
                        </div>
                      </div>
                    </div>
                    <div class=""buttons clearfix"">
                      <div class=""pull-right"">
                      </div>
                    </div>
                </div>
              </div>
            </div>
            <div class=""panel panel-default "">
              <div class=""panel-heading"">
                <h4 class=""panel-title""> <a data-toggle=""collapse"" data-parent=""#accordion"" href=""#collapsefive"">Step 2: Payment Method <i class=""fa fa-caret-down""></i></a> </h4>
              </div>
              <div id=""collapsefive"" class=""panel-collapse collapse"">
                <div class=""panel-body"">
                  <p>Please select the preferred payment method to use on this order.</p>
                  <div class=""radio"">
                    <label>
                      <input type=""radio"" checked=""checked"" value=""cod"" name=""payment_method""> Cash On Delivery </label>
       ");
                WriteLiteral(@"           </div>
                  <p><strong>Add Note About Your Order</strong></p>
                  <p>
                    <textarea class=""form-control"" rows=""8"" name=""note""></textarea>
                  </p>
                  <div class=""buttons"">
                  </div>
                </div>
              </div>
            </div>
            <div class=""panel panel-default "">
              <div class=""panel-heading"">
                <h4 class=""panel-title""> <a data-toggle=""collapse"" data-parent=""#accordion"" href=""#collapsesix"">Step 3: Confirm Order <i class=""fa fa-caret-down""></i></a> </h4>
              </div>
              <div id=""collapsesix"" class=""panel-collapse collapse"">
                <div class=""panel-body"">
                  <div class=""table-responsive"">
                    <table class=""table table-bordered table-hover"">
                      <thead>
                        <tr>
                          <td class=""text-left"">Product Name</td>
                    ");
                WriteLiteral(@"      <td class=""text-right"">Quantity</td>
                          <td class=""text-right"">Unit Price</td>
                          <td class=""text-right"">Total</td>
                        </tr>
                      </thead>
                      <tbody>
");
#nullable restore
#line 102 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                         foreach (var item in ViewBag.IsGioHang)
                       {

#line default
#line hidden
#nullable disable
                WriteLiteral("                         <tr>\r\n                          <td class=\"text-left\">");
#nullable restore
#line 105 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                                           Write(item.product.ProductName);

#line default
#line hidden
#nullable disable
                WriteLiteral("</td>\r\n                          <td class=\"text-right\">");
#nullable restore
#line 106 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                                            Write(item.amount);

#line default
#line hidden
#nullable disable
                WriteLiteral("</td>\r\n                          <td class=\"text-right\">");
#nullable restore
#line 107 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                                            Write(item.product.FormatPrice);

#line default
#line hidden
#nullable disable
                WriteLiteral("</td>\r\n                          <td class=\"text-right\">");
#nullable restore
#line 108 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                                            Write(item.FormatTotalPrice);

#line default
#line hidden
#nullable disable
                WriteLiteral("</td>\r\n                        </tr>  \n");
#nullable restore
#line 110 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                       }

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                      </tbody>\r\n                      <tfoot>\r\n                        <tr>\r\n                          <td class=\"text-right\" colspan=\"4\"><strong>Total: ");
#nullable restore
#line 115 "C:\Users\Loki\source\repos\LokiPKL\LokiPKL\Views\ShoppingCart\CheckOut.cshtml"
                                                                       Write(ViewBag.SumTotal.ToString("#,## VNĐ"));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"</strong></td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <div class=""buttons"">
                    <div class=""pull-right"">
                      <input type=""submit"" data-loading-text=""Loading..."" class=""btn"" id=""button-confirm"" value=""Confirm Order"">
                    </div>
                  </div>
                </div>
              </div>
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
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Controller = (string)__tagHelperAttribute_2.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_2);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Action = (string)__tagHelperAttribute_3.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n      </div>\r\n    </div>\r\n");
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
